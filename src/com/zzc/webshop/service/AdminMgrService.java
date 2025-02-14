package com.zzc.webshop.service;

import com.zzc.webshop.po.Manager;
import org.springframework.ui.Model;

public interface AdminMgrService {
	public String toAddMgr(Manager manager,Model model);
	public String addMgr(Manager manager, Model model);
	public String toDeleteMgr(Model model);
	public String deleteMgr(Integer mid,Model model);
}
