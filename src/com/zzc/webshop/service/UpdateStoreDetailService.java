package com.zzc.webshop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.Store;

public interface UpdateStoreDetailService {
	public String selectAGoods(Model model, Integer id, String act);
	public String deleteGoods(Integer ids[], Model model);
	public String deleteAGoods(Integer id, Model model);
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct,HttpSession session);
	public String selectGoods(Model model, Integer pageCur, String act,Integer storen);
	
	
}
