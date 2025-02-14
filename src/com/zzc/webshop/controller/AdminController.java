package com.zzc.webshop.controller;

import com.zzc.webshop.po.Manager;
import com.zzc.webshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute Manager manager) {
		return "jsp/admin/login";
	}

	@RequestMapping("/admin/login")
	public String login(@ModelAttribute Manager manager, Model model, HttpSession session) {
		return adminService.login(manager, model, session);
	}

//	@RequestMapping("/exit")
//	public String exit(@ModelAttribute Manager manager, HttpSession session) {
//		session.invalidate();
//		return "admin/login";
//	}
}
