package com.zzc.webshop.controller;

import com.zzc.webshop.po.Store;
import com.zzc.webshop.service.AdminStoresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminStores")
public class AdminStoresController extends BaseController{
	@Autowired
	private AdminStoresService adminStoresService;
	@RequestMapping("/selectStores")
	public String selectStores(Model model, Integer pageCur, String act) {
		return adminStoresService.selectStores(model, pageCur, act);
	}
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addStores")
	public String addStores(@ModelAttribute Store stores, Model model){
		return adminStoresService.addOrUpdateStores(stores, model);
	}
	/**
	 * 查询一个名片
	 */
	@RequestMapping("/selectAStores")
	public String selectAStores(Model model, Integer id, String act){
		return adminStoresService.selectAStores(model, id, act);
	}
}
