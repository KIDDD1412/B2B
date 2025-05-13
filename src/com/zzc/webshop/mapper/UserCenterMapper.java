package com.zzc.webshop.mapper;

import java.util.List;
import java.util.Map;

import com.zzc.webshop.po.Trade;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.zzc.webshop.po.Store;

@Repository("userCenterMapper")
@Mapper
public interface UserCenterMapper {
	public List<Map<String, Object>> myStore(Integer bid);
	public List<Map<String, Object>> myTrade_in(Integer bid);
	public List<Map<String, Object>> myTrade_out(Integer bid);
	public List<Map<String, Object>> orderDetail(Integer ordersn);
	public  List<Map<String, Object>> selectItem(Integer storen);
	public Store selectStoreByid(Integer storesn);
	public int updateStore(Store store);
	public void deleteStore(Integer storesn);
	public void addStore(Store store);
	public void recharge(Map<String, Object> map);
	public List<Map<String, Object>> myAccount(Integer userId);
	public void addTrade(Trade trade);
	
}
