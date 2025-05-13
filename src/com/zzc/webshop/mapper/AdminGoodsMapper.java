package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("adminGoodsDao")
@Mapper
public interface AdminGoodsMapper {
	public List<Goods> selectGoods();
	public List<Goods> selectAllGoodsByPage(Map<String, Object> map);
	public Goods selectGoodsById(Integer id);
	public int updateGoodsById(Goods goods);
}
