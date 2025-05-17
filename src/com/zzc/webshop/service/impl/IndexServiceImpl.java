package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.GoodsMapper;
import com.zzc.webshop.mapper.UserBehaviorMapper;
import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.IndexService;
import com.zzc.webshop.mapper.IndexMapper;
import org.ansj.domain.Result;
import org.ansj.splitWord.analysis.ToAnalysis; // ansj 分词核心类
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import java.io.IOException;
import java.io.StringReader;
import org.ansj.domain.Term; // 确保导入 Term 类
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.analysis.Tokenizer; // 导入 Tokenizer 类
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexMapper indexDao;

	@Override
	public String before(Model model, HttpSession session, Goods goods, Integer pageCur) {
		// 查询所有状态为 1 的商品数量
		int totalCount = indexDao.getGoodsCount(goods);
		model.addAttribute("totalCount", totalCount);

		int totalPage = 0;
		int perPageSize = 12; // 每页显示 24 条记录
		if (totalCount == 0) {
			totalPage = 0;
		} else {
			totalPage = (int) Math.ceil((double) totalCount / perPageSize);
		}

		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * perPageSize > totalCount) {
			pageCur = pageCur - 1;
		}

		// 分页查询
		Map<String, Object> map = new HashMap<>();
		map.put("startIndex", (pageCur - 1) * perPageSize);
		map.put("perPageSize", perPageSize);
		map.put("goods", goods);

		List<Goods> lastedlist = indexDao.getGoodsByPage(map);
		model.addAttribute("lastedlist", lastedlist);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);

		return "pages2/index";
	}

	@Override
	public String toRegister(Model model) {
		model.addAttribute("ruser", new User());
		return "pages2/register";
	}

	//登录
	@Override
	public String toLogin(Model model) {
		model.addAttribute("luser", new User());
		return "pages2/login";
	}

	@Override
	public String search(Model model, String mykey) {
		List<Goods> list = indexDao.search(mykey);
		model.addAttribute("searchlist", list);
		System.out.println(mykey);
		return "pages2/searchResult";
	}
	

		@Autowired
		private GoodsMapper goodsMapper;
		@Autowired
		private UserBehaviorMapper userBehaviorMapper;

		// 计算余弦相似度
		public double cosineSimilarity(double[] vector1, double[] vector2) {
			System.out.println("cosineSimilarity");
			double dotProduct = 0.0;
			double normA = 0.0;
			double normB = 0.0;
			for (int i = 0; i < vector1.length; i++) {
				dotProduct += vector1[i] * vector2[i];
				normA += Math.pow(vector1[i], 2);
				normB += Math.pow(vector2[i], 2);
			}
			if (normA == 0 || normB == 0) {
				return 0.0;
			}
			System.out.println("cosineSimilarity2");
			return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
		}

		// 构建用户-商品交互矩阵中的用户向量
		public double[] buildUserVector(Integer userId, List<Goods> allGoods) {
			System.out.println("buildUserVector");
			System.out.println(userId);
			double[] userVector = new double[allGoods.size()];
			System.out.println(userVector);
			// 获取用户的浏览记录
			List<Map<String, Object>> browseRecords = userBehaviorMapper.getUserBrowseRecords(userId);
			System.out.println("get1!");
			// 获取用户的购买记录
			List<Map<String, Object>> purchaseRecords = userBehaviorMapper.getUserPurchaseRecords(userId);
			System.out.println("get2!");
			// 构建用户向量，浏览记为1，购买记为2（购买的权重更高）
			for (Map<String, Object> record : browseRecords) {
				int goodsId = (int) record.get("gid");
				for (int i = 0; i < allGoods.size(); i++) {
					if (allGoods.get(i).getGid() == goodsId) {
						if (userVector[i] < 1) {
							userVector[i] = 1; // 浏览行为
						}
						break;
					}
				}
			}

			for (Map<String, Object> record : purchaseRecords) {
				int goodsId = (int) record.get("gid");
				for (int i = 0; i < allGoods.size(); i++) {
					if (allGoods.get(i).getGid() == goodsId) {
						userVector[i] = 2; // 购买行为（权重更高）
						break;
					}
				}
			}
			System.out.println("buildUserVector2");
			return userVector;
		}

		// 基于物品的协同过滤推荐
		public List<Goods> recommendGoods(Integer userId, int topN) {
			System.out.println("recommendGoods");
			// 获取所有商品
			List<Goods> allGoods = goodsMapper.selectGoods();

			// 构建用户的商品交互向量
			double[] userVector = buildUserVector(userId, allGoods);

			// 计算每个商品与用户已交互商品的相似度
			Map<Goods, Double> similarityMap = new HashMap<>();

			for (Goods candidateGoods : allGoods) {
				// 如果用户已经购买或浏览过该商品，则跳过
				boolean userHasInteracted = false;
				for (int i = 0; i < allGoods.size(); i++) {
					if (allGoods.get(i).getGid() == candidateGoods.getGid() && userVector[i] > 0) {
						userHasInteracted = true;
						break;
					}
				}
				if (userHasInteracted) {
					continue;
				}

				// 构建候选商品的用户交互向量
				double[] candidateVector = buildGoodsVector(candidateGoods.getGid(), allGoods);

				// 计算相似度
				double similarity = cosineSimilarity(userVector, candidateVector);
				similarityMap.put(candidateGoods, similarity);
			}

			// 按相似度排序
			List<Map.Entry<Goods, Double>> sortedEntries = new ArrayList<>(similarityMap.entrySet());
			sortedEntries.sort(Map.Entry.<Goods, Double>comparingByValue().reversed());

			// 取前 topN 个商品
			List<Goods> recommendedGoods = new ArrayList<>();
			for (int i = 0; i < Math.min(topN, sortedEntries.size()); i++) {
				recommendedGoods.add(sortedEntries.get(i).getKey());
			}
			System.out.println("recommendGoods2");
			return recommendedGoods;
		}

		// 构建商品的用户交互向量
		public double[] buildGoodsVector(Integer goodsId, List<Goods> allGoods) {
			System.out.println("buildGoodsVector");
			double[] goodsVector = new double[allGoods.size()];

			// 获取浏览过该商品的用户
			List<Map<String, Object>> browseUsers = userBehaviorMapper.getUserBrowseRecordsByGoodsId(goodsId);
			// 获取购买过该商品的用户
			List<Map<String, Object>> purchaseUsers = userBehaviorMapper.getUserPurchaseRecordsByGoodsId(goodsId);

			// 构建商品向量
			for (Map<String, Object> userRecord : browseUsers) {
				int userId = (int) userRecord.get("uid");
				// 为简化起见，这里只记录用户是否与商品有交互，而不考虑具体的交互类型
				goodsVector[userId] = 1;
			}

			for (Map<String, Object> userRecord : purchaseUsers) {
				int userId = (int) userRecord.get("uid");
				goodsVector[userId] = 2; // 购买行为权重更高
			}
			 //提取商品介绍的文本特征
        String goodsIntroduction = goodsMapper.getGoodsIntroduction(goodsId);
        double[] textFeatureVector = extractTextFeatureVector(goodsIntroduction, allGoods);

			 //合并用户交互向量和文本特征向量
        for (int i = 0; i < goodsVector.length; i++) {
            goodsVector[i] += textFeatureVector[i];
        }
			System.out.println("buildGoodsVector2");
			return goodsVector;
		}
		// 提取文本特征向量
		public double[] extractTextFeatureVector(String text, List<Goods> allGoods) {
			double[] textFeatureVector = new double[allGoods.size()];

			try {
				Analyzer analyzer = new AnsjAnalyzer();
				Directory index = new RAMDirectory();
				IndexWriterConfig config = new IndexWriterConfig(analyzer);
				IndexWriter writer = new IndexWriter(index, config);

				// 构建索引
				for (Goods goods : allGoods) {
					Document doc = new Document();
					doc.add(new TextField("introduction", goods.getGintroduction(), Field.Store.YES));
					writer.addDocument(doc);
				}
				writer.close();

				// 查询文本
				IndexReader reader = DirectoryReader.open(index);
				IndexSearcher searcher = new IndexSearcher(reader);
				QueryParser parser = new QueryParser("introduction", analyzer);
				//Query query = parser.parse(text);
				// 在 extractTextFeatureVector 中解析查询前添加转义
				String escapedText = QueryParser.escape(text); // 转义所有特殊字符
				Query query = parser.parse(escapedText);
				TopDocs topDocs = searcher.search(query, allGoods.size());

				// 填充文本特征向量
				for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
					textFeatureVector[scoreDoc.doc] = scoreDoc.score;
				}

				reader.close();
			} catch (IOException | ParseException e) {
				e.printStackTrace();
			}

			return textFeatureVector;
		}
	private static class AnsjAnalyzer extends Analyzer {
		@Override
		protected TokenStreamComponents createComponents(String fieldName) {
			Tokenizer source = new Tokenizer() {
				private StringReader reader = null;
				private List<String> terms = new ArrayList<>();
				private int position = 0;

				public void Tokenizer(String text) {
					this.reader = new StringReader(text);
					// 使用 ansj_seg 进行分词
					Result result = ToAnalysis.parse(text);
					for (Term term : result) {
						terms.add(term.getName());
					}
				}

				@Override
				public boolean incrementToken() throws IOException {
					clearAttributes();
					if (position < terms.size()) {
						CharTermAttribute termAttr = addAttribute(CharTermAttribute.class);
						termAttr.setEmpty().append(terms.get(position));
						position++;
						return true;
					}
					return false;
				}

				@Override
				public void reset() throws IOException {
					super.reset();
					position = 0;
				}
			};
			return new TokenStreamComponents(source);
		}
	}
}
