package com.zzc.webshop.service.impl;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.IndexService;
import com.zzc.webshop.mapper.IndexMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexMapper indexDao;
	
	@Override
	public String before(Model model, HttpSession session, Goods goods) {
		model.addAttribute("salelist", indexDao.getSaleOrder());
		model.addAttribute("focuslist", indexDao.getFocusOrder());
		//model.addAttribute("noticelist", indexDao.selectNotice());
		if(goods.getGid() == 0) 
			goods.setGid(0);
		//Ê×Ò³ÉÌÆ·
		model.addAttribute("lastedlist", indexDao.getGoods(goods));
		return "pages2/index";
	}

	@Override
	public String toRegister(Model model) {
		model.addAttribute("ruser", new User());
		return "pages2/register";
	}

	//µÇÂ¼
	@Override
	public String toLogin(Model model) {
		model.addAttribute("luser", new User());
		return "pages2/login";
	}

	@Override
	public String search(Model model, String mykey) {
		List<Goods> list = indexDao.search(mykey);
		model.addAttribute("searchlist", list);
		System.out.println(mykey);
		return "pages2/searchResult";
	}
	
	
}
