package com.zzc.webshop.service;

import com.zzc.webshop.po.Store;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface StoreService {
	public String loadStore(Model model, HttpSession session, Store store);
}
