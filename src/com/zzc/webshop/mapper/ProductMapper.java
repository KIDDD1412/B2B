package com.zzc.webshop.mapper;


import java.util.List;
import com.zzc.webshop.po.Goods;

public interface ProductMapper {
    //…Ã∆∑œÍ«È
    Goods selectByPrimaryKey(Integer productid);
//	String selectlastproductid();
//	List<Goods> selectname(String name);
//	List<Goods> selectall();
//    int deleteByPrimaryKey(Integer productid);
//
//    int insert(Goods record);
//
//    int insertSelective(Goods record);
//
//    int updateByPrimaryKeySelective(Goods record);
//
//    int updateByPrimaryKey(Goods record);
}