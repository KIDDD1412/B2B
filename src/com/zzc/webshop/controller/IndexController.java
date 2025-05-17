package com.zzc.webshop.controller;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.IndexService;

import com.zzc.webshop.service.impl.ItemBasedCFService;
import com.zzc.webshop.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	private ItemBasedCFService itemBasedCFService;

	public IndexController(ItemBasedCFService itemBasedCFService) {
		this.itemBasedCFService = itemBasedCFService;
	}

	@RequestMapping("/before")
	public String before(Model model,HttpSession session, Goods goods,@RequestParam(value = "pageCur", required = false) Integer pageCur) {
		Integer uid = MyUtil.getUserId(session);
		List<Goods> recommendedGoods = indexService.recommendGoods(uid, 5);
		model.addAttribute("recommendedGoods", recommendedGoods);
		return indexService.before(model, session, goods, pageCur);
	}
	@RequestMapping("/toRegister")
	public String toRegister(Model model) {
		return indexService.toRegister(model);
	}

	@RequestMapping("/toLogin")
	public String toLogin(Model model) {
		return indexService.toLogin(model);
	}

	@RequestMapping("/search")
	public String search(Model model,String mykey) {
		return indexService.search(model, mykey);
	}

}
