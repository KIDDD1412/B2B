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

    //ȷ�Ͻ��˵���Ϣ����
    @RequestMapping(value = "cashcart.do")
    public String cashcart(HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        //cashǰ�˿���oprice���鿴�����ܼ�
        map.put("oprice",cashOrder.getOprice());
        map.put("oid",oid);
        return "pages/cash";
    }

    //���̼�ͬ�⣨0�����޸�״̬Ϊ1�������
    @RequestMapping(value = "agree")
    public String agree(Trade trade, HttpSession session, Map map, @RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(1);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }


    //���1�����޸�״̬Ϊ2����������
    @RequestMapping(value = "cash.do")
    public String cash(Trade trade, HttpSession session, Map map, @RequestParam("oid")int oid){
        User loginUser = (User) session.getAttribute("ruser");
        //���Ҷ���
        Order cashOrder= orderService.searchOrderByOid(oid);
        //��������
        Double totoprice=cashOrder.getOprice();
        if(loginUser.getUbalance()<totoprice){
            return "pages/error-1";
        }
        //�˻��ۿ�
        loginUser.setUbalance(loginUser.getUbalance()-totoprice);
        session.removeAttribute("ruser");
        session.setAttribute("ruser", loginUser);
        //�����״̬��Ϊ������
        cashOrder.setStatus(2);
        orderService.updateOrder2(cashOrder);

        //������������ˮ
        trade.setIn(cashOrder.getSid());
        trade.setOut(cashOrder.getBid());
        trade.setAmount(cashOrder.getOprice());
        orderService.addTrade(trade);

        //����״̬�����ѣ����������ǰ��
        cashOrder= orderService.searchOrderByOid(oid);
        map.put("oid",oid);
        map.put("oprice",cashOrder.getOprice());
        return "pages/success";
    }

    //������2�����޸�״̬Ϊ3�����ջ���
    @RequestMapping(value = "send")
    public String send(Order order, HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(3);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }


    //�ջ���3�����޸�״̬Ϊ4������ɣ�
    @RequestMapping(value = "receive")
    public String receive(Order order, HttpSession session, Map map,@RequestParam("oid")int oid){
        Order cashOrder= orderService.searchOrderByOid(oid);
        cashOrder.setStatus(4);
        orderService.updateOrder2(cashOrder);
        return "redirect:/searchOrder";
    }
}
