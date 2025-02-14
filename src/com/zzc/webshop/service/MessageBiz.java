package com.zzc.webshop.service;

import java.util.List;

import com.zzc.webshop.po.Message;
import com.zzc.webshop.po.MessageWithName;

public interface MessageBiz {

	//talk查找所有指定id消息，用于视图返回双方名字
	List<MessageWithName> selectmessage(int fromid, int toid);
	List<MessageWithName> selectallmessage(Integer messagefromid);
	int updatereadmessage(int fromid);
	int insert(Message record);

    int insertSelective(Message record);

}
