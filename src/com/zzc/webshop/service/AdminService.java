package com.zzc.webshop.service;

import com.zzc.webshop.po.Manager;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface AdminService {
	public String login(Manager manager, Model model, HttpSession session);
}
