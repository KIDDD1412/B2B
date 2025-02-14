package com.zzc.webshop.controller;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.AdminGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController extends BaseController{
	@Autowired
	private AdminGoodsService adminGoodsService;
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model, Integer pageCur, String act) {
		return adminGoodsService.selectGoods(model, pageCur, act);
	}
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addGoods")
	public String addGoods(@ModelAttribute Goods goods, Model model){
		return adminGoodsService.addOrUpdateGoods(goods, model);
	}
	/**
	 * 查询一个名片
	 */
	@RequestMapping("/selectAGoods")
	public String selectAGoods(Model model, Integer id, String act){
		return adminGoodsService.selectAGoods(model, id, act);
	}
}
