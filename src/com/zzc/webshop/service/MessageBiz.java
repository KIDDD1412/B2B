package com.zzc.webshop.service;

import java.util.List;

import com.zzc.webshop.po.Message;
import com.zzc.webshop.po.MessageWithName;

public interface MessageBiz {

	//talk��������ָ��id��Ϣ��������ͼ����˫������
	List<MessageWithName> selectmessage(int fromid, int toid);
	List<MessageWithName> selectallmessage(Integer messagefromid);
	int updatereadmessage(int fromid);
	int insert(Message record);

    int insertSelective(Message record);

}
