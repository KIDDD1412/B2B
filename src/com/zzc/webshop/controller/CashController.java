package com.zzc.webshop.controller;

import com.zzc.webshop.po.Order;
import com.zzc.webshop.po.Trade;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.OrderService;
import com.zzc.webshop.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cash")
public class CashController {
    @Autowired
    OrderService orderService;

    //确认结账的信息界面
    @RequestMapping(value = "cashcart.do")
    public String cashcart(HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        //cash前端可用oprice，查看订单总价
        map.put("oprice",cashOrder.getOprice());
        map.put("oid",oid);
        return "pages/cash";
    }

    //待商家同意（0），修改状态为1（待付款）
    @RequestMapping(value = "agree")
    public String agree(Trade trade, HttpSession session, Map map, @RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(1);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }


    //付款（1），修改状态为2（待发货）
    @RequestMapping(value = "cash.do")
    public String cash(Trade trade, HttpSession session, Map map, @RequestParam("oid")int oid){
        User loginUser = (User) session.getAttribute("ruser");
        //查找订单
        Order cashOrder= orderService.searchOrderByOid(oid);
        //可以余额不足
        Double totoprice=cashOrder.getOprice();
        if(loginUser.getUbalance()<totoprice){
            return "pages/error-1";
        }
        //账户扣款
        loginUser.setUbalance(loginUser.getUbalance()-totoprice);
        session.removeAttribute("ruser");
        session.setAttribute("ruser", loginUser);
        //付款后状态改为待发货
        cashOrder.setStatus(2);
        orderService.updateOrder2(cashOrder);

        //付款后添加至流水
        trade.setIn(cashOrder.getSid());
        trade.setOut(cashOrder.getBid());
        trade.setAmount(cashOrder.getOprice());
        orderService.addTrade(trade);

        //更新状态后重搜，将结果返回前端
        cashOrder= orderService.searchOrderByOid(oid);
        map.put("oid",oid);
        map.put("oprice",cashOrder.getOprice());
        return "pages/success";
    }

    //发货（2），修改状态为3（待收货）
    @RequestMapping(value = "send")
    public String send(Order order, HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(3);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }


    //收货（3），修改状态为4（已完成）
    @RequestMapping(value = "receive")
    public String receive(Order order, HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(4);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }
}
