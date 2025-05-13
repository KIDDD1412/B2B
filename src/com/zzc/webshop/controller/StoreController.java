package com.zzc.webshop.controller;

import com.zzc.webshop.po.Store;
import com.zzc.webshop.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class StoreController {
	@Autowired
	private StoreService storeService;
	@RequestMapping("/loadStore")
	public String before(Model model,HttpSession session, Store store) {
		return storeService.loadStore(model, session, store);
	}
}
