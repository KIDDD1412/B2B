package com.zzc.webshop.mapper;

import java.util.List;

import com.zzc.webshop.po.Message;
import com.zzc.webshop.po.MessageWithName;
import org.apache.ibatis.annotations.Param;

public interface MessageMapper {
	//talk查找所有指定id消息
//	List<MessageWithName> selectmessage(int fromid, int toid);
	List<MessageWithName> selectmessage(@Param("fromid")int fromid,@Param("toid")int toid);
	List<MessageWithName> selectallmessage(@Param("messagefromid")Integer messagefromid);
	int updatereadmessage(int fromid);
    int insert(Message record);

    int insertSelective(Message record);
}