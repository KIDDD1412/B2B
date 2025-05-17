<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link href="<%=cssUrl%>bootstrapValidator.min.css" rel="stylesheet" />

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cssUrl%>webbase.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>pages-JD-index.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>widget-jquery.autocomplete.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>widget-cartPanelView.css"/>
<link href="<%=cssUrl%>daohang.css" rel="stylesheet" type="text/css" />
<link href="<%=cssUrl%>common.css" rel="stylesheet" type="text/css" />
<link href="<%=cssUrl%>style.css" rel="stylesheet" type="text/css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功！</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
<!-- 头部栏位 -->
<!--页面顶部-->
<div id="nav-bottom">
	<!--顶部-->
	<div class="nav-top">
		<div class="top">
			<div class="py-container">
				<div class="shortcut">
					<%--                    顶部左模块--%>
					<ul class="fl">
						<c:if test="${ruser!=null}">尚品购欢迎您，${ruser.uname }&nbsp&nbsp&nbsp</c:if>
						<c:if test="${ruser==null}">
							<%--TODO 登录 toLogin--%>
							<a href="toLogin.do">登录</a>&nbsp&nbsp&nbsp
							<%--TODO 注册 toRegister--%>
							<a href="toRegister.do">注册</a>
						</c:if>
						<c:if test="${ruser!= null}">
							<td>
									<%--TODO 退出 exit--%>
								<a href="exit">退出</a>
							</td>
						</c:if>
					</ul>

					<%--                    顶部右模块--%>
					<ul class="fr">
						<%--TODO 我的订单 searchOrder--%>
						<li class="f-item"><a href="searchOrder" target="_blank">我的订单</a></li>
						<li class="f-item space"></li>
						<%--TODO 我的尚品购 home.html--%>
						<li class="f-item">我的尚品购</li>
						<li class="f-item space"></li>
						<li class="f-item">尚品购会员</li>
						<li class="f-item space"></li>
						<li class="f-item">企业采购</li>
						<li class="f-item space"></li>
						<li class="f-item">关注尚品购</li>
						<li class="f-item space"></li>
						<li class="f-item" id="service">
							<span>客户服务</span>
							<ul class="service">
								<li><a href="cooperation.html" target="_blank">合作招商</a></li>
								<li><a href="shoplogin.html" target="_blank">商家后台</a></li>
								<li><a href="cooperation.html" target="_blank">合作招商</a></li>
								<li><a href="#">商家后台</a></li>
							</ul>
						</li>
						<li class="f-item space"></li>
						<li class="f-item">网站导航</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--顶部结束-->
</div>
<!--页面顶部结束-->

<div class="location ared">
	当前位置： <a href="before?id=0">首页</a> > 我的订单 >购买成功
</div>
		
	<div class="container">
		<div class="jumbotron" style="margin-top:30px;">
  			<h3>购买成功</h3>
  			<p>订单号码：${oid }</p>
  			<p>本次消费：￥${oprice }</p>
  			<p>账户余额：￥${ruser.ubalance }</p>
  			<p><a class="btn btn-primary btn-lg" href="/searchOrder" role="button">返回</a></p>
		</div>
	</div>

</body>
</html>