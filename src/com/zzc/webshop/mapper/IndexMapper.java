package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository("indexDao")
@Mapper
public interface IndexMapper {
	public List<Map<String, Object>> getSaleOrder();
	public List<Map<String, Object>> getFocusOrder();
	//public List<Map<String, Object>> selectNotice();
	public List<Map<String, Object>> getGoods(Goods goods);
	public Goods selectGoodsById(Integer id);
	public List<Goods> search(String mykey);
	public int getGoodsCount(Goods goods);
	public List<Goods> getGoodsByPage(Map<String, Object> map);
}
