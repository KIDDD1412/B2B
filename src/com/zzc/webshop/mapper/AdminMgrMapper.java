package com.zzc.webshop.mapper;

import com.zzc.webshop.po.Manager;

import java.util.List;

public interface AdminMgrMapper {
    public List<Manager> selectMgr();
    public int addMgr(Manager manager);
    public int deleteMgr(Integer mid);
    public void auto();
}
