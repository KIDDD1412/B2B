package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.GoodsMapper;
import  com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("goodsService")
@Transactional
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsMapper goodsDao;

	/**
	 * 查询商品
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act) {
		List<Goods> allGoods = goodsDao.selectGoods();
		int temp = allGoods.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);//起始位置
		map.put("perPageSize", 10);//每页10个
		allGoods = goodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		return "selectGoods";
	}
	/**
	 * 查询一个商品
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = goodsDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		return "goodsDetail";
	}

}
