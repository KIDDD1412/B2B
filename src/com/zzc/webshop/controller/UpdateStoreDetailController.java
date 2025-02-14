package com.zzc.webshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.Store;
import com.zzc.webshop.service.UpdateStoreDetailService;
import com.zzc.webshop.util.MyUtil;
@Controller
@RequestMapping("/updateStoreDetail")
public class UpdateStoreDetailController {
	@Autowired
	private UpdateStoreDetailService updateStoreDetailService;
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model, Integer pageCur, String act,HttpSession session) {
		return updateStoreDetailService.selectGoods(model, pageCur, act,MyUtil.getStoreId(session));
	}
	/**
	 * add页面初始化
	 */
	@RequestMapping("/toAddGoods")
	public String toAddGoods(Model model){
		model.addAttribute("goods", new Goods());
		return "pages3/addGoods";
	}
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addGoods")
	public String addGoods(@ModelAttribute Goods goods, HttpServletRequest request, String updateAct,HttpSession session){
		return  updateStoreDetailService.addOrUpdateGoods(goods, request, updateAct,session);
	}
	/**
	 * 查询一个名片
	 */
	@RequestMapping("/selectAGoods")
	public String selectAGoods(Model model, Integer id, String act){
		return  updateStoreDetailService.selectAGoods(model, id, act);
	}
	/**
	 * 删除多个商品
	 */
	@RequestMapping("/deleteGoods")
	public String deleteGoods(Integer ids[], Model model) {
		return  updateStoreDetailService.deleteGoods(ids, model);
	}
	/**
	 * 删除单个商品
	 */
	@RequestMapping("/deleteAGoods")
	public String deleteAGoods(Integer id, Model model) {
		return  updateStoreDetailService.deleteAGoods(id, model);
	}
}
