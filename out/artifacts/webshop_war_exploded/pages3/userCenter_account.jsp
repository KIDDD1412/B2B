<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<%System.out.print(basePath); %>
<title>用户中心</title>
<link href="/public/css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="/public/css/before/common.css" rel="stylesheet" type="text/css" />
<link href="/public/css/before/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=cssUrl%>webbase.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cssUrl%>pages-JD-index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cssUrl%>widget-jquery.autocomplete.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cssUrl%>widget-cartPanelView.css"/>
	<link href="<%=cssUrl%>daohang.css" rel="stylesheet" type="text/css" />
	<link href="<%=cssUrl%>common.css" rel="stylesheet" type="text/css" />
	<link href="<%=cssUrl%>style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/public/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/public/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="/public/js/base.js"></script>
	<script type="text/javascript" src="/public/js/service/contentService.js"></script>
	<script type="text/javascript" src="/public/js/controller/contentController.js"></script>
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


	<div class="blank"></div>
	<div class="block clearfix">
	<div class="location ared">
			当前位置： <a href="before?id=0">首页</a> > 个人中心 > 我的账户
		</div>
		<div class="AreaL">
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="sellertalk.do" target="center">我的消息</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="toAddStore" target="center">申请店铺</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="userCenter_store" target="center">我的店铺</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="userCenter_account" target="center">我的账户</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="userCenter_trade" target="center">流水统计</a><span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="AreaR">
			  <div class="location ared">
			                                 我的订单</div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>账户ID</th>
						<th>余额</th>
						<th>充值</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
						<c:forEach var="mo" items="${myAccount}"> 
						<tr>
							<td bgcolor="#ffffff"  align="center">${mo.uid}</td>
								<td bgcolor="#ffffff"  align="center">${mo.ubalance}</td>
							<td align="center" bgcolor="#ffffff">
							<a style="text-decoration: none;" class="f6" href="toRecharge" target="_blank">充值</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		</div>
</body>
</html>