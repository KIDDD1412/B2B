package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDao")
@Mapper
public interface AdminMapper {
	public List<Manager> login(Manager manager);
}
