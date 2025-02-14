package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Store;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("adminStoresDao")
@Mapper
public interface AdminStoresMapper {
	public List<Store> selectStores();
	public List<Store> selectAllStoresByPage(Map<String, Object> map);
	public Store selectStoresById(Integer id);
	public int updateStoresById(Store stores);
}
