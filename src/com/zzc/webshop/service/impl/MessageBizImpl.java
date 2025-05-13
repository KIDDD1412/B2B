package com.zzc.webshop.service.impl;

import java.util.List;

import com.zzc.webshop.po.MessageWithName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.service.MessageBiz;
import com.zzc.webshop.po.Message;
import com.zzc.webshop.mapper.MessageMapper;
@Service(value="MessageBiz")
public class MessageBizImpl implements MessageBiz{
	@Autowired
	MessageMapper messageMapper;

	@Override
	public int insert(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insert(record);
	}

	@Override
	public int insertSelective(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insertSelective(record);
	}

	//talk��������ָ��id��Ϣ������ͼ��ȡ�û����֣�����Ϣ����ʾ˫������
	@Override
	public List<MessageWithName> selectmessage(int fromid, int toid) {
		// TODO Auto-generated method stub
		return messageMapper.selectmessage(fromid,toid);
	}

	@Override
	public List<MessageWithName> selectallmessage(Integer messagefromid) {
		// TODO Auto-generated method stub
		return messageMapper.selectallmessage(messagefromid);
	}

	@Override
	public int updatereadmessage(int fromid) {
		return messageMapper.updatereadmessage(fromid);
	}

}
