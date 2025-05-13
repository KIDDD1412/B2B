package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Store;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("storeDao")
@Mapper
public interface StoreMapper {
	public List<Map<String, Object>> selectStore(Store store);
}
