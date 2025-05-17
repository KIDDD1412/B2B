package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.GoodsMapper;
import com.zzc.webshop.mapper.UserBehaviorMapper;
import com.zzc.webshop.po.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
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

import java.io.IOException;
import java.util.List;
import java.util.Map;
@Service("itemBasedCFService")
public class ItemBasedCFService {
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private UserBehaviorMapper userBehaviorMapper;

    // 计算余弦相似度
    private double cosineSimilarity(double[] vector1, double[] vector2) {
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
    private double[] buildUserVector(Integer userId, List<Goods> allGoods) {
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
    private double[] buildGoodsVector(Integer goodsId, List<Goods> allGoods) {
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
        // 提取商品介绍的文本特征
        String goodsIntroduction = goodsMapper.getGoodsIntroduction(goodsId);
        System.out.println("getGoodsIntroduction");
        double[] textFeatureVector = extractTextFeatureVector(goodsIntroduction, allGoods);

        // 合并用户交互向量和文本特征向量
        for (int i = 0; i < goodsVector.length; i++) {
            goodsVector[i] += textFeatureVector[i];
            System.out.println(i);
        }
        System.out.println("buildGoodsVector2");
        return goodsVector;
    }
    // 提取文本特征向量
    private double[] extractTextFeatureVector(String text, List<Goods> allGoods) {
        double[] textFeatureVector = new double[allGoods.size()];

        try {
            Analyzer analyzer = new StandardAnalyzer();
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
            Query query = parser.parse(text);
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
}