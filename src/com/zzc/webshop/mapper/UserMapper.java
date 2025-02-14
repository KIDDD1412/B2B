package com.zzc.webshop.mapper;


import com.zzc.webshop.po.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    public int register(User buser);
    public List<User> login(User buser);
    public boolean isUnameExists(String uname);
    public boolean isUidcardExists(String uidcard);
    public User findByName(String uname);

//
//	List<User> showuser();
//	User selectusername(String username);
//	User selectLoginUser(Map map);
//    int deleteByPrimaryKey(String userid);
//
//    int insert(User record);
//
//    int insertSelective(User record);
//
//    User selectByPrimaryKey(String userid);
//
//    int updateByPrimaryKeySelective(User record);
//
//    int updateByPrimaryKey(User record);
}