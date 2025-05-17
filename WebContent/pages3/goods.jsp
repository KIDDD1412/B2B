<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

	<table border=1 style="border-collapse: collapse">
		<caption>
			<font size=4 face=华文新魏>商品详情</font>
		</caption>
		<tr>
			<td>商品名称</td>
			<td>
				${goods.gid }
			</td>
		</tr>
		<tr>
			<td>名称</td>
			<td>
				${goods.gname }
			</td>
		</tr>
		<tr>
			<td>价格</td>
			<td>
				${goods.gprice }
			</td>
		</tr>
		<tr>
			<td>商品说明</td>
			<td>
				${goods.gintroduction }
			</td>
		</tr>
		<tr>
			<td>库存</td>
			<td>
				${goods.gamount }
			</td>
		</tr>
		<tr>
			<td>图片</td>
			<td>
				<c:if test="${goods.gpicture != '' }">
					<img alt="" width="250" height="250"
					src="logos/${goods.gpicture}"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>审核状况</td>
			<td>
				<c:if test="${goods.gstatus==1 }" >已通过</c:if>
				<c:if test="${goods.gstatus==0 }" >未通过</c:if>
			</td>
		</tr>
	</table>
</body>
</html>