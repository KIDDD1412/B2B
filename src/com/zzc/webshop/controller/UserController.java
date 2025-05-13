package com.zzc.webshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zzc.webshop.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.service.MessageBiz;
import com.zzc.webshop.service.ProductService;
import com.zzc.webshop.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;

	@Autowired
	MessageBiz messageBiz;

	@RequestMapping("/register")
	public String register(@ModelAttribute User user, Model model, HttpSession session, String code) {
		return userService.register(user, model, session, code);
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute User user,Model model, HttpSession session, String code) {
		User nu=userService.queryByName(user.getUname());
		session.setAttribute("user",nu);
		return userService.login(user, model, session, code);
	}

	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "forward:/before";
	}


}
