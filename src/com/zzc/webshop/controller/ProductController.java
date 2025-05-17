package com.zzc.webshop.controller;

import com.zzc.webshop.mapper.ProductMapper;
import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.Order;
import com.zzc.webshop.po.User;

import com.zzc.webshop.service.OrderService;
import com.zzc.webshop.service.ProductService;
import com.zzc.webshop.service.impl.OrderServiceImpl;
import com.zzc.webshop.util.DateUtil;
import com.zzc.webshop.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ProductController {
	@Autowired
	ProductService productService;

	// 展示商品详情
	@RequestMapping(value = "productdetail")
	public String productdetail(HttpSession session, int productid ,int pageCur) {
		Goods product = productService.selectByPrimaryKey(productid);
		//computer页面中通过 ${product} 获得商品信息
		session.setAttribute("product", product);
		session.setAttribute("pageCur", pageCur);
		// 获取用户ID
		Integer userId = MyUtil.getUserId(session);

		// 只有在两个id都不为空时才进行添加浏览记录操作
		if (userId != null && productid != 0) {
			Map<String, Object> browseRecord = new HashMap<>();
			browseRecord.put("uid", userId);
			browseRecord.put("gid", productid);
			productService.addBrowseRecord(browseRecord);
		}
		//返回商品详情路径
		return "pages/computer";
	}

}
