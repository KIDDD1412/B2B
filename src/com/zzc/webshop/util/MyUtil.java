package com.zzc.webshop.util;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

import com.zzc.webshop.po.Store;
import com.zzc.webshop.po.User;
public class MyUtil {
	/**
	 * 获得时间字符串
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * 获得用户ID
	 */
	public static Integer getUserId(HttpSession session) {
		User ruser = (User)session.getAttribute("ruser");
		return ruser.getUid();
	}
	/**
	 * 获得店铺号
	 */
	public static Integer getStoreId(HttpSession session) {
		Store sstore = (Store)session.getAttribute("store");
		
		return sstore.getSid();
	}
}
