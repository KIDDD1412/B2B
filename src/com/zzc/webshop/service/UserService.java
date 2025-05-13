package com.zzc.webshop.service;

import com.zzc.webshop.po.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface UserService {
	public String register(User user,Model model, HttpSession session, String code);
	public String login(User user,Model model, HttpSession session, String code);
	public User queryByName(String name);
}

