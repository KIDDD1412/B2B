package com.zzc.webshop.mapper;

import  com.zzc.webshop.po.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("goodsDao")
@Mapper
public interface GoodsMapper {
	public List<Goods> selectGoods();
	public List<Goods> selectAllGoodsByPage(Map<String, Object> map);
	public Goods selectGoodsById(Integer id);
	public  String getGoodsIntroduction(Integer id);
	public List<Map<String, Object>> selectCartGoods(Integer id);
	public List<Map<String, Object>> selectFocusGoods(Integer id);
	public List<Map<String, Object>> selectOrderdetailGoods(Integer id);
}
