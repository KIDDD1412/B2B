package com.zzc.webshop.service.impl;

import java.util.List;
import java.util.Map;

import com.zzc.webshop.po.User;
import com.zzc.webshop.service.UserCenterService;
import com.zzc.webshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.mapper.UserMapper;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service(value="UserService")
public class UserServiceImpl implements UserService {
	@Autowired
    UserMapper userMapper;

	@Override
	public String register(User user, Model model, HttpSession session, String code) {
		if(!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("codeError", "Wrong validate code!");
			return "pages2/register";
		}
		if (userMapper.isUnameExists(user.getUname())) {
			model.addAttribute("msg", "User name in use!");
			return "pages2/register";
		}

		// 检查身份证号是否已注册
		if (userMapper.isUidcardExists(user.getUidcard())) {
			model.addAttribute("msg", "Uidcard in use!");
			return "pages2/register";
		}
		int n = userMapper.register(user);
		if(n > 0) {
			return "pages2/login";
		}else {
			model.addAttribute("msg", "Fail to register!");
			return "pages2/register";
		}
	}
	@Override
	public String login(User user, Model model, HttpSession session, String code) {
		User ruser = null;
		List<User> list = userMapper.login(user);
		if(list.size() > 0) {
			ruser = list.get(0);
		}
		if(ruser != null) {
			session.setAttribute("ruser", ruser);
			System.out.println("登录成功");
			return "forward:/before";
		}
		else {
			model.addAttribute("msg", "Wrong password or id!");
			System.out.println("用户名或密码错误！");
			return "pages2/login";
		}
	}
	@Override
	public User queryByName(String uname) {
		User ruser=null;
		ruser=userMapper.findByName(uname);
		return ruser;
	}





//
//
//	@Override
//	public User selectLoginUser(Map map) {
//		// TODO Auto-generated method stub
//		return userMapper.selectLoginUser(map);
//	}
//	@Override
//	public User selectusername(String username) {
//		// TODO Auto-generated method stub
//		return userMapper.selectusername(username);
//	}
//	@Override
//	public int insertSelective(User record) {
//		// TODO Auto-generated method stub
//		return userMapper.insertSelective(record);
//	}
//	@Override
//	public int updateByPrimaryKeySelective(User record) {
//		// TODO Auto-generated method stub
//		return userMapper.updateByPrimaryKeySelective(record);
//	}
//	@Override
//	public User selectByPrimaryKey(String userid) {
//		// TODO Auto-generated method stub
//		return userMapper.selectByPrimaryKey(userid);
//	}
//	@Override
//	public List<User> showuser() {
//		// TODO Auto-generated method stub
//		return userMapper.showuser();
//	}

}
