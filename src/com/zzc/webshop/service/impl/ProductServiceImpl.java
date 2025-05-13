package com.zzc.webshop.service.impl;

import java.util.List;
import java.util.Map;

import com.zzc.webshop.po.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.service.ProductService;
import com.zzc.webshop.po.Product;
import com.zzc.webshop.mapper.ProductMapper;
@Service(value="ProductBiz")
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

	//…Ã∆∑œÍ«È
	@Override
	public Goods selectByPrimaryKey(Integer productid) {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(productid);
	}
	public void addBrowseRecord(Map<String, Object> record) {
		productMapper.addBrowseRecord(record);
	}
//	@Override
//	public List<Product> selectall() {
//		// TODO Auto-generated method stub
//		return productMapper.selectall();
//	}
//	@Override
//	public List<Product> selectname(String name) {
//		// TODO Auto-generated method stub
//		return productMapper.selectname(name);
//	}
//	@Override
//	public int updateByPrimaryKeySelective(Product record) {
//		// TODO Auto-generated method stub
//		return productMapper.updateByPrimaryKeySelective(record);
//	}
//	@Override
//	public String selectlastproductid() {
//		// TODO Auto-generated method stub
//		return productMapper.selectlastproductid();
//	}
//	@Override
//	public int insertSelective(Product record) {
//		// TODO Auto-generated method stub
//		return productMapper.insertSelective(record);
//	}

}
