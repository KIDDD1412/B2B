package com.zzc.webshop.controller;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.impl.ItemBasedCFService;
import com.zzc.webshop.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RecommendationController {
    @Autowired
    private ItemBasedCFService itemBasedCFService;

    @RequestMapping("/getRecommendations")
    public String getRecommendations(Model model, HttpSession session) {
        Integer uid = MyUtil.getUserId(session);
        List<Goods> recommendedGoods = itemBasedCFService.recommendGoods(uid, 4);
        model.addAttribute("recommendedGoods", recommendedGoods);
        return "pages2/index";
    }
}