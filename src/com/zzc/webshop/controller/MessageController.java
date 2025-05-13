package com.zzc.webshop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.zzc.webshop.po.MessageWithName;
import com.zzc.webshop.po.Product;
import com.zzc.webshop.service.impl.MessageBizImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.po.User;
import com.zzc.webshop.service.MessageBiz;
import com.zzc.webshop.po.Message;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MessageController {
	@Autowired
	MessageBizImpl messageBizImpl;
	@Autowired
	MessageBiz messageBiz;

	//computer的联系商家到pages/talk，显示所有信息
	@RequestMapping(value="talk")
	public String talk(HttpSession session,@RequestParam("toid") int toid) {
//TODO 根据卖家买家查找Message到前端
		//用于获取用户会话信息
		User loginUser = (User) session.getAttribute("ruser");
		//设置商家ID到session
		session.setAttribute("sellerId", toid);
		Integer fromid=loginUser.getUid();
		//根据用户搜索信息
		List<MessageWithName> messages = messageBizImpl.selectmessage(fromid,toid);
		session.setAttribute("messages", messages);
		session.setAttribute("ordersell", toid);
		//标记消息为已读
		messageBizImpl.updatereadmessage(loginUser.getUid());
		return "pages/talk";
	}

	//talk的输入框信息发送
	@RequestMapping(value="talksend")
	public String talksend(Message message,HttpSession session,RedirectAttributes redirectAttributes) {
		User loginUser = (User) session.getAttribute("ruser");
		if(loginUser==null) {
			return "redirect:";
		}
		//设置信息接受方，信息状态为未读，并将信息插入数据库
		Integer sellerId=(Integer) session.getAttribute("sellerId");
		Integer toId=(Integer)loginUser.getUid();
		message.setToid(sellerId);
		message.setFromid(toId);
		message.setType("0");
		messageBizImpl.insertSelective(message);
//		//如果发送消息的是卖家
//		if(loginUser.getType()!=null&&loginUser.getType().equals("seller")) {
//			return "redirect:sellertalk.do?messagefromid="+message.getToid();
//		}
		//使用重定向时将 toid 参数一并传递
		redirectAttributes.addAttribute("toid", sellerId);
		//返回到talk内查询数据库，将message渲染到前端
		return "redirect:talk.do";
	}

	//卖家在个人中心发送信息
	@RequestMapping(value="sellertalk")
	public String sellertalk(HttpSession session,Integer messagefromid) {
		//当没有指定特定用户的消息时,展示所有的未读
		if(messagefromid==null) {
			//在视图里查询“我的所有对话”
			User loginUser = (User) session.getAttribute("ruser");
			Integer myId=(Integer)loginUser.getUid();
			List<MessageWithName> messages = messageBiz.selectallmessage(myId);
			Map<Integer,Boolean> pmap = new HashMap<>();
			for(MessageWithName message:messages) {
				//发送者
				Integer fromid = message.getFromid();
				pmap.put(fromid,false);
				//未读消息
				if(message.getType().equals("0")) {
					pmap.put(fromid,true);
				}
			}
			session.setAttribute("users", pmap.keySet());
			session.setAttribute("usersmap", pmap);
			return "pages/sellertalk";
		}
		//用于创建订单的id号
		session.setAttribute("orderbuy", messagefromid);
		//即id从talksend发来，是和特定买家对话的时候
		//已读操作
		messageBiz.updatereadmessage(messagefromid);
		session.setAttribute("messagefromid", messagefromid);
		//根据双方id在视图里查询信息
		User loginUser = (User) session.getAttribute("ruser");
		Integer myid=loginUser.getUid();
		List<MessageWithName> messages = messageBiz.selectmessage(myid, messagefromid);
		session.setAttribute("messages", messages);
		session.setAttribute("messagefromid", messagefromid);
		return "pages/sellertalk";
	}


	//卖家talk的输入框信息发送
	@RequestMapping(value="sellertalksend")
	public String sellertalksend(Message message,HttpSession session,RedirectAttributes redirectAttributes) {
		User loginUser = (User) session.getAttribute("ruser");
		if(loginUser==null) {
			return "redirect:";
		}
		//卖家(myid=fromid)
		Integer myId=(Integer)loginUser.getUid();
		message.setFromid(myId);
		//买家(messagefromid=toid)
		Integer messagefromid=(Integer) session.getAttribute("messagefromid");
		message.setToid(messagefromid);
		//信息状态为未读
		message.setType("0");
		//将信息插入数据库
		messageBizImpl.insertSelective(message);
		//如果发送消息的是卖家
		return "redirect:sellertalk.do?messagefromid="+message.getToid();
	}


	//computer的竞价到pages/bid
	@RequestMapping(value="bid")
	public String bid(HttpSession session,@RequestParam("gid") int gid,@RequestParam("gname") String gname,@RequestParam("gprice") double gprice,@RequestParam("sellerid") int sellerid) {
		//将商品信息加到session
		session.setAttribute("gid", gid);
		session.setAttribute("gname", gname);
		session.setAttribute("gprice", gprice);
		session.setAttribute("sellerid", sellerid);
		return "pages/bid";
	}

}
