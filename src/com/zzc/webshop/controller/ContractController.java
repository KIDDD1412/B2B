package com.zzc.webshop.controller;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.IndexService;

@Controller("/contract")
public class ContractController extends HttpServlet {
	
public void service(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String name = request.getParameter("name");
		int mobile = Integer.parseInt(request.getParameter("mobile"));//获取的参数都是String的，遇到数字需要转换下类型
		request.setAttribute("a", 00);
	}


}
