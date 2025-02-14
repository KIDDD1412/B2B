package com.zzc.webshop.service;

import com.zzc.webshop.po.Goods;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;


public interface IndexService {
	public String toRegister(Model model);
	//µÇÂ½½çÃæ
	public String toLogin(Model model);
	public String before(Model model, HttpSession session, Goods goods);
	public String search(Model model,String mykey);
}
