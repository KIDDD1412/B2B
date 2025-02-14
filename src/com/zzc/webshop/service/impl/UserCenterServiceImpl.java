package com.zzc.webshop.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.zzc.webshop.po.Trade;
import com.zzc.webshop.service.UserCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.zzc.webshop.mapper.UserCenterMapper;
import com.zzc.webshop.po.Store;
import com.zzc.webshop.util.MyUtil;

@Service("userCenterService")
@Transactional
public class UserCenterServiceImpl implements UserCenterService {
	@Autowired
	private UserCenterMapper userCenterDao;
	@Override
	public String userCenter_store(HttpSession session, Model model) {
		model.addAttribute("myStore", userCenterDao.myStore(MyUtil.getUserId(session)));
		return "pages3/userCenter_store";
	}
	@Override
	public String userCenter_account(HttpSession session, Model model) {
		model.addAttribute("myAccount", userCenterDao.myAccount(MyUtil.getUserId(session)));
		return "pages3/userCenter_account";
	}
	@Override
	public String userCenter_trade(HttpSession session, Model model) {
		model.addAttribute("myTrade_in", userCenterDao.myTrade_in(MyUtil.getUserId(session)));
		model.addAttribute("myTrade_out", userCenterDao.myTrade_out(MyUtil.getUserId(session)));
		return "pages3/userCenter_trade";
	}
	@Override
	public String storeDetail(Model model, Integer storesn,HttpSession session) {
		  Store sstore=null;
		  sstore=userCenterDao.selectStoreByid(storesn);
			session.setAttribute("store", sstore);
			return "forward:/updateStoreDetail/selectGoods";
	}
	@Override
	public String updateStoreByid(Integer storen, Model model) {
		Store store=userCenterDao.selectStoreByid(storen);
		model.addAttribute("store", store);
			return "pages3/updateStore";
	}
	@Override
	public String updateStore(Store store, Model model) {
		userCenterDao.updateStore(store);
			return "forward:/userCenter_store";
	}
	@Override
	public String addStore(Store store,HttpSession session){
		store.setSellID(MyUtil.getUserId(session));
		store.setSstatus(0);
		userCenterDao.addStore(store);
		return "forward:/userCenter_store";
//		return "forward:/pages3/userCenter_store";
	}
	@Override
	public String recharge(double count,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("count", count);
		userCenterDao.recharge(map);
		return "forward:/userCenter_account";
	}
	@Override
	public String deleteStore(Integer storesn, Model model) {
		userCenterDao.deleteStore(storesn);
		return "forward:/userCenter_store";
	}

	public void addTrade(Trade trade){

	}
}
