package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.StoreMapper;
import com.zzc.webshop.po.Store;
import com.zzc.webshop.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service("storeService")
@Transactional
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreMapper storeDao;
	public String loadStore(Model model, HttpSession session, Store store) {
		model.addAttribute("storelist", storeDao.selectStore(store));
		return "pages2/store";
	}
}
