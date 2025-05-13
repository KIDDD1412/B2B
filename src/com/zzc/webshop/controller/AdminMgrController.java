package com.zzc.webshop.controller;

import com.zzc.webshop.po.Manager;
import com.zzc.webshop.service.AdminMgrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminMgr")
public class AdminMgrController extends BaseController{
	@Autowired
	private AdminMgrService adminMgrService;
	/**
	 * 到添加管理员页面
	 */
	@RequestMapping("/toAddMgr")
	public String toAddMgr(@ModelAttribute Manager manager, Model model) {
		return adminMgrService.toAddMgr(manager,model);
	}
	/**
	 * 添加管理员
	 */
	@RequestMapping("/addMgr")
	public String addMgr(@ModelAttribute Manager manager, Model model) {
		return adminMgrService.addMgr(manager,model);
	}
	/**
	 * 到删除管理员页面
	 */
	@RequestMapping("/toDeleteMgr")
	public String toDeleteMgr(Model model) {
		return adminMgrService.toDeleteMgr(model);
	}
	/**
	 * 删除管理员
	 */
	@RequestMapping("/deleteMgr")
	public String deleteMgr(Integer id,Model model) {
		return adminMgrService.deleteMgr(id, model);
	}
	
}
