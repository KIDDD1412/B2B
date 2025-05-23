package com.zzc.webshop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.zzc.webshop.service.CartService;
import com.zzc.webshop.mapper.CartMapper;
import com.zzc.webshop.util.MyUtil;
import org.springframework.web.bind.annotation.RequestParam;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper cartDao;
	@Override
	public String focus(Model model, Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		return "forward:/goodsDetail?id=" + id;
	}

	//添加购物车
	@Override
	public String putCart(Model model,Integer shoppingnum,Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		map.put("shoppingnum", shoppingnum);
		//是否已添加购物车
		List<Map<String, Object>> list = cartDao.isPutCart(map);
		if(list.size() > 0)
			cartDao.updateCart(map);
		else
			cartDao.putCart(map);
		return "forward:/cart/selectCart";
	}

	//根据用户查询商品列表
	@Override
	public String selectCart(Model model, HttpSession session) {
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		double sum = 0;
		for (Map<String, Object> map : list) {
			sum = sum + (Double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "pages3/cart";
	}

	//删除购物车方法
	@Override
	public String deleteAgoods(Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		cartDao.deleteAgoods(map);
		return "forward:/cart/selectCart";
	}

	//清空购物车
	@Override
	public String clear(HttpSession session) {
		cartDao.clear(MyUtil.getUserId(session));
		return "forward:/cart/selectCart";
	}


	//购物车列表
	@Override
	public String orderConfirm(Model model, HttpSession session) {
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		double sum = 0;
		for (Map<String, Object> map : list) {
			sum = sum + (Double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "orderconfirm";
	}

}
