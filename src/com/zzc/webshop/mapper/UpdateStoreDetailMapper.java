package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Goods;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("updateStoreDetailMapper")
@Mapper
public interface UpdateStoreDetailMapper {
	public  void deleteAGoods(Integer id);
	public Integer selectSeller(Integer storen);
	public void deleteGoods(List<Integer> list) ;
	public List<Goods> selectCartGoods(Integer integer) ;
	public List<Goods> selectAllGoodsByPage(Map<String, Object> map);
	public Goods selectGoodsById(Integer id) ;
	public List<Goods> selectGoods(Integer storen);
	public int addGoods(Goods goods);
	public int updateGoodsById(Goods goods);

}
