package com.zzc.webshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zzc.webshop.mapper.OrderMapper;
import com.zzc.webshop.po.Order;
import com.zzc.webshop.po.OrderVo;
import com.zzc.webshop.po.Store;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.OrderService;

@Controller
public class OrderController extends BaseBeforeController{

	@Autowired
	private OrderService orderService;
	private OrderMapper orderDao;
	@RequestMapping("/orderSubmit")
	public String orderSubmit(OrderVo order,Model model,
							  @RequestParam("file")MultipartFile file,HttpSession session,
							  @RequestParam(value="uid", required = false) Integer uid,
							  @RequestParam(value="bid",required = false) Integer bid) {
		Order newOrder = new Order();
		User nu=(User)session.getAttribute("user");
		System.out.println("uid"+uid);
		// 检查并转换 gid
		if (order.getGid() != null && isValidInteger(order.getGid())) {
			newOrder.setGid(Integer.parseInt(order.getGid()));
		}

		// 检查并转换 gamount
		if (order.getGamount() != null && isValidInteger(order.getGamount())) {
			newOrder.setGamount(Integer.parseInt(order.getGamount()));
		}

		// 检查并转换 oprice 和 gprice
		if (order.getOprice() != null) {
			try {
				newOrder.setOprice(Double.parseDouble(order.getOprice()));
			} catch (NumberFormatException e) {
				// 处理异常，例如记录日志或返回错误页面
				e.printStackTrace();
			}
		}
		if (order.getGprice() != null) {
			try {
				newOrder.setGprice(Double.parseDouble(order.getGprice()));
			} catch (NumberFormatException e) {
				// 处理异常，例如记录日志或返回错误页面
				e.printStackTrace();
			}
		}

		// 卖家输入bid(买家)
		if(order.getBid()!=null && isValidInteger(order.getBid())){
			System.out.println("1111bid"+order.getBid());
			newOrder.setBid(Integer.parseInt(order.getBid()));
			newOrder.setSid(nu.getUid());
		}
		// 买家输入uid（sid，卖家）
		if(order.getSid()!=null && isValidInteger(order.getSid())){
			System.out.println("1111bid"+order.getSid());
			newOrder.setSid(Integer.parseInt(order.getSid()));
			newOrder.setBid(nu.getUid());
		}
		if(order.getSid()==null||order.getBid()==null){
			newOrder.setSid(uid);
			newOrder.setBid(bid);
		}
		System.out.println("用户1："+order.toString());
		String m=orderService.orderSubmit(newOrder,model,file);
		System.out.println("用户2："+order.toString());
		if(m.equals("提交成功"))return "forward:searchOrder";
		System.out.println("用户："+order.toString());
		System.out.println("用户："+order.toString());
		return orderService.orderSubmit(newOrder,model,file);
	}

	// 检查字符串是否为有效的整数
	private boolean isValidInteger(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	@RequestMapping("/toUpdateOrder")
	public String toUpdateOrder(String oid,Model model,HttpSession session){
		return orderService.toUpdateOrder(oid,model,session);

	}
	@RequestMapping("/updateOrder")
	public String updateOrder(OrderVo order,Model model,@RequestParam("file")MultipartFile file,HttpSession session) {
		Order lastOrder= (Order)session.getAttribute("oorder");
		System.out.println("lastOrder:"+lastOrder.toString());
		Order newOrder=new Order();
		User nu=(User)session.getAttribute("user");
		newOrder.setOid(lastOrder.getOid());
		newOrder.setGid(Integer.parseInt(order.getGid()));
		newOrder.setGamount(Integer.parseInt(order.getGamount()));
		newOrder.setOprice(Double.parseDouble(order.getOprice()));
		newOrder.setGprice(Double.parseDouble(order.getGprice()));
		newOrder.setBid(Integer.parseInt(order.getBid()));
		newOrder.setSid(nu.getUid());
		newOrder.setOversion(lastOrder.getOversion());
		String m=orderService.updateOrder(newOrder,lastOrder,model,file);
		if(m.equals("提交成功"))return "forward:searchOrder";
		System.out.println("用户："+order.toString());
		return "forward:searchOrder";
	}
	@RequestMapping("/searchOrder")
	public String searchOrder(Model model,HttpSession session){
		User u=(User)session.getAttribute("user");
		String uid=u.getUid()+"";
		return orderService.searchOrder(model, uid);
	}
	@RequestMapping("/searchOrderHistory")
	public String searchOrderHistory(Model model,HttpSession session,String oid){
		return orderService.searchOrderHistory(model, oid);
	}


}
