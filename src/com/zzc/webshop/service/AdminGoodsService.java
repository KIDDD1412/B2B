package com.zzc.webshop.service;

import com.zzc.webshop.po.Goods;
import org.springframework.ui.Model;

public interface AdminGoodsService {
	public String selectAGoods(Model model, Integer id, String act);
	public String addOrUpdateGoods(Goods goods, Model model);
	public String selectGoods(Model model, Integer pageCur, String act);
}
