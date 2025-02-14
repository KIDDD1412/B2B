package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.AdminMapper;
import com.zzc.webshop.mapper.AdminMgrMapper;
import com.zzc.webshop.po.Manager;
import com.zzc.webshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminDao;
	@Autowired
	private AdminMgrMapper adminMgrDao;
	@Override
	public String login(Manager manager, Model model, HttpSession session) {
		if(adminDao.login(manager) != null && adminDao.login(manager).size() > 0) {
			session.setAttribute("manager", manager);
			//
			session.setAttribute("Mgr", adminMgrDao.selectMgr());
			return "jsp/admin/main";
		}
		model.addAttribute("msg", "昵称或密码错误");
		return "jsp/admin/login";
	}

}
