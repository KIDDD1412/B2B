package com.zzc.webshop.service;

import java.util.List;
import java.util.Map;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.Product;

public interface ProductService {
	Goods selectByPrimaryKey(Integer productid);//��Ʒ����
	void addBrowseRecord(Map<String, Object> record);
//	String selectlastproductid();
//	List<Product> selectall();
//	List<Product> selectname(String name);
//	int updateByPrimaryKeySelective(Product record);
//	int insertSelective(Product record);
}
