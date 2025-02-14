package com.zzc.webshop.controller;

import com.zzc.webshop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model, Integer pageCur, String act) {
		return goodsService.selectGoods(model, pageCur, act);
	}

	/**
	 * 查询一个名片
	 */
	@RequestMapping("/selectAGoods")
	public String selectAGoods(Model model, Integer id, String act){
		return goodsService.selectAGoods(model, id, act);
	}

}
