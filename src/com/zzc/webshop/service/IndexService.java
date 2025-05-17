package com.zzc.webshop.service;

import com.zzc.webshop.po.Goods;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;


public interface IndexService {
	public String toRegister(Model model);
	//µÇÂ½½çÃæ
	public String toLogin(Model model);
	public String before(Model model, HttpSession session, Goods goods, Integer pageCur);
	public String search(Model model,String mykey);
	double cosineSimilarity(double[] vector1, double[] vector2);
	double[] buildUserVector(Integer userId, List<Goods> allGoods);
	public List<Goods> recommendGoods(Integer userId, int topN);
	double[] buildGoodsVector(Integer goodsId, List<Goods> allGoods);
	double[] extractTextFeatureVector(String text, List<Goods> allGoods);
}
