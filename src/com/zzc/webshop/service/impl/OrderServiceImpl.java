package com.zzc.webshop.service.impl;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.zzc.webshop.mapper.OrderMapper;
import com.zzc.webshop.mapper.UserCenterMapper;
import com.zzc.webshop.po.Trade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zzc.webshop.controller.OrderController;
import com.zzc.webshop.mapper.UserMapper;
import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.Order;
import com.zzc.webshop.service.OrderService;

@Service("orderService")
@Transactional

public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper orderDao;
	@Autowired
	private UserCenterMapper userCenterDao;

	@Override
	public void upload(MultipartFile file,int b,int s,int v){
        try {
            if (file.isEmpty()){
               System.out.println("文件为空");
            }
            else System.out.println("文件不为空");
            //获取文件名
            String fileName = String.format("%d_%d_%d_%s", b, s, v, file.getOriginalFilename());
            System.out.println("新文件名：" + fileName);
            //设置文件存储路径
            String filePath = "D:\\javaEE\\Eshop-master\\out\\artifacts\\webshop_war_exploded\\file";
            String path = filePath+"\\"+fileName;
            
            System.out.println("新路径："+path);
            
            File dest = new File(filePath);
            System.out.println("test1");
            //检测是否存在该目录
            if (!dest.exists()){
                dest.mkdirs();
                System.out.println("test2");
            }
            System.out.println("test3");
            //写入文件
            file.transferTo(new File(path));
            System.out.println("上传成功！");
        } catch (IOException e) {
        	System.out.println("上传失败");
            e.printStackTrace();
        }
        
    }

	@Override
	public String orderSubmit(Order order, Model model,MultipartFile file) {
		String uid=order.getSid()+"";
		
		//获取文件名
       
        order.setContract(String.format("%d_%d_%d_%s", order.getBid(),order.getSid(),order.getOversion(), file.getOriginalFilename()));
		
		int n = orderDao.addOrder(order);
		if(n > 0) {
			System.out.println("订单添加开始");
			model.addAttribute("order",order);
			
//			System.out.println(order.toString());
			
			upload(file,order.getBid(),order.getSid(),order.getOversion());
			System.out.println("订单添加成功");
			return "提交成功";
		}
		System.out.println("订单添加失败");
		return "添加失败";
	}
	@Override
	public String searchOrder(Model model, String uid) {
		List<Order> blist = orderDao.searchBorder(uid);
		List<Order> slist = orderDao.searchSorder(uid);
		model.addAttribute("borderlist", blist);
		model.addAttribute("sorderlist", slist);
		model.addAttribute("uid",uid);
		System.out.println(uid);
		System.out.println(uid);
		return "pages2/orderList";
	}

	@Override
	public String searchOrderHistory(Model model,String oid) {
		List<Order> list = orderDao.findOrderHistory(oid);
		model.addAttribute("historylist", list);
		return "pages2/historyList";
	}

	@Override
	public String toUpdateOrder(String oid,Model model,HttpSession session) {
		Order order=orderDao.findOrder(oid);
		order.setOversion(order.getOversion()+1);
		model.addAttribute("order",order);
		session.setAttribute("oorder",order);
		System.out.println("用户："+order.toString());
		return "pages2/updateOrder";
	}
	@Override
	public String updateOrder(Order norder,Order oorder, Model model,MultipartFile file) {

		norder.setContract(String.format("%d_%d_%d_%s", norder.getBid(),norder.getSid(),norder.getOversion(), file.getOriginalFilename())); 
		System.out.println("更新前："+oorder.toString());
		System.out.println("更新后："+norder.toString());
		int n = orderDao.updateOrder(norder);
		int m= orderDao.addOrderHistory(oorder);
		if(n > 0 && m > 0) {
			System.out.println("订单更新开始");
			model.addAttribute("order",norder);
			upload(file,norder.getBid(),norder.getSid(),norder.getOversion());
			System.out.println("订单更新成功");
			return "提交成功";
		}
		System.out.println("订单更新失败");
		return "添加失败";
	}

	@Override
	public Order searchOrderByOid(Integer oid) {
		return orderDao.serchOrderByOid(oid);
	}

	//更改信息
	@Override
	public void updateOrder2(Order norder) {
		orderDao.updateOrder(norder);
	}

	@Override
	public void addTrade(Trade trade) {
		userCenterDao.addTrade(trade);
	}
}
