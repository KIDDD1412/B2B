package com.zzc.webshop.controller;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.service.impl.ItemBasedCFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/recommendation")
public class RecommendationController {
    @Autowired
    private ItemBasedCFService itemBasedCFService;

    @RequestMapping("/getRecommendations")
    public String getRecommendations(Model model, @RequestParam("userId") Integer userId, @RequestParam("topN") int topN) {
        List<Goods> recommendedGoods = itemBasedCFService.recommendGoods(userId, topN);
        model.addAttribute("recommendedGoods", recommendedGoods);
        return "recommendedGoods";
    }
}