package com.zzc.webshop.exception;

import com.zzc.webshop.po.User;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
public class MyExceptionHandler implements HandlerExceptionResolver {
	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception arg3) {
	   	Map<String, Object> model = new HashMap<String, Object>();  
        model.put("ex", arg3); 
      if(arg3 instanceof UserLoginNoException){
        	arg0.setAttribute("ruser", new User());
        	arg0.setAttribute("msg", "没有登录，请登录！");
        	return new ModelAndView("/login", model);
       }else{  
        	return new ModelAndView("/error", model);  
        }  
	}
}
