package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.AdminGoodsMapper;
import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.AdminGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsMapper adminGoodsDao;
	/**
	 * 审核商品
	 */
	@Override
	public String addOrUpdateGoods(Goods goods, Model model) {
        //修改到数据库
		if(adminGoodsDao.updateGoodsById(goods) > 0){
			model.addAttribute("msg", "审核成功！");
			return "jsp/admin/updateAgoods";
		}else{
			model.addAttribute("msg", "审核失败！");
			return "jsp/admin/updateAgoods";
		}
	}
	/**
	 * 查询商品
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act) {
		List<Goods> allGoods = adminGoodsDao.selectGoods();
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
		allGoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//审核查询
		if("updateSelect".equals(act)){
			return "jsp/admin/updateSelectGoods";
		}else{
			return "jsp/admin/selectGoods";
		}
	}
	/**
	 * 审核一个商品
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = adminGoodsDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		//审核页面
		if("updateAgoods".equals(act)){
			return "jsp/admin/updateAgoods";
		}
		return "jsp/admin/updateSelectGoods";
	}
}
