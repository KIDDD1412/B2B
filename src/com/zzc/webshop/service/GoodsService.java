package com.zzc.webshop.service;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import  com.zzc.webshop.po.Goods;

public interface GoodsService {
    public String selectAGoods(Model model, Integer id, String act);
    public String selectGoods(Model model, Integer pageCur, String act);
}
