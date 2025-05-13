package com.zzc.webshop.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.po.Store;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.UserCenterService;


@Controller
public class UserCenterController extends BaseBeforeController{
	@Autowired
	private UserCenterService userCenterService;
	@RequestMapping("/userCenter_trade")
	public String userCenter_trade(HttpSession session, Model model) {
		return userCenterService.userCenter_trade(session, model);
	}
	@RequestMapping("/userCenter_account")
	public String userCenter_account(HttpSession session, Model model) {
		return userCenterService.userCenter_account(session, model);
	}
	@RequestMapping("/userCenter_store")
	public String userCenter_store(HttpSession session, Model model) {
		return userCenterService.userCenter_store(session, model);
	}
	@RequestMapping("/storeDetail")
	public String storeDetail(Model model, Integer storesn,HttpSession session) {	
		return userCenterService.storeDetail(model,storesn,session);
	}
	@RequestMapping("/updateStoreByid")
	public String updateStore(Integer storen, Model model) {
		return userCenterService.updateStoreByid(storen,model);
	}
	@RequestMapping("/updateStore")
	public String updateStore(@ModelAttribute Store store, Model model) {
		return userCenterService.updateStore(store,model);
	}
	@RequestMapping("/deleteStore")
	public String deleteStore(Integer storesn, Model model) {
		return userCenterService.deleteStore(storesn, model);
	}

	@RequestMapping("/toAddStore")
	public String toAddStore(Model model){
		model.addAttribute("store", new Store());
		return "pages3/addStore";
	}

	/**
	 * ÃÌº”µÍ∆Ã
	 */
	@RequestMapping("/addStore")
	public String addStore(@ModelAttribute("store") Store store,HttpSession session){
		System.out.println(store.getSname());
		System.out.println("Store name: " + store.getSname());
		return  userCenterService.addStore(store,session);
	}

	//Ã¯◊™µΩµÍ∆Ã≥‰÷µ
	@RequestMapping("/toRecharge")
	public String toRrecharge(Model model) {
		model.addAttribute("buser", new User());
		return "pages3/recharge";
	}

	//µÍ∆Ã≥‰÷µ
	@RequestMapping("/recharge")
	public String recharge(double count,HttpSession session) {
		return userCenterService.recharge(count,session);
	}
	
}
