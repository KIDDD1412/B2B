package com.zzc.webshop.controller;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.IndexService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	@RequestMapping("/before")
	public String before(Model model,HttpSession session, Goods goods) {
		return indexService.before(model, session, goods);
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
