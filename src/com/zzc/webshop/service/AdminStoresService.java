package com.zzc.webshop.service;

import com.zzc.webshop.po.Store;
import org.springframework.ui.Model;

public interface AdminStoresService {
	public String selectAStores(Model model, Integer id, String act);
	public String addOrUpdateStores(Store stores, Model model);
	public String selectStores(Model model, Integer pageCur, String act);
}
