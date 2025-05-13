package com.zzc.webshop.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.zzc.webshop.po.Store;

public interface UserCenterService {
	String userCenter_store(HttpSession session, Model model);
	String storeDetail(Model model, Integer storesn,HttpSession session);
	String userCenter_trade(HttpSession session, Model model);
	public String updateStoreByid(Integer storen, Model model);
	public String deleteStore(Integer storesn, Model model);
	public String updateStore(Store store, Model model);
	public String addStore(Store store,HttpSession session);
	public String recharge(double count,HttpSession session);
	public String userCenter_account(HttpSession session, Model model);

}
