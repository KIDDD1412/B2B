package com.zzc.webshop.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.zzc.webshop.po.Trade;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.zzc.webshop.po.Order;
public interface OrderService {
	public String orderSubmit(Order order, Model model,MultipartFile file);
	public String searchOrder(Model model, String uid);
	public void upload(MultipartFile file,int b,int s,int v);
	public String toUpdateOrder(String oid,Model model,HttpSession session);
	public String updateOrder(Order norder,Order oorder, Model model,MultipartFile file);
	public String searchOrderHistory(Model model,String oid);
	public Order searchOrderByOid(Integer oid);

	public void updateOrder2(Order norder);

	// 添加交易记录
	void addTrade(Trade trade);
}
