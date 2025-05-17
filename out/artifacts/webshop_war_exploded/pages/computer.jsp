<%@ page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>商品详情  ${product.gname } </title>
	<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
	<link href="<%=cssUrl%>index.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=cssUrl %>login.css">
	<script src="<%=jsUrl %>login.js"></script>
	<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
	<link rel="icon" href="public/img/assets/img/favicon.ico">
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
	<script type="text/javascript" src="/public/js/model/cartModel.js"></script>
	<script type="text/javascript" src="/public/js/czFunction.js"></script>
	<script type="text/javascript" src="/public/js/plugins/jquery.easing/jquery.easing.min.js"></script>
	<script type="text/javascript" src="/public/js/plugins/sui/sui.min.js"></script>
	<script type="text/javascript" src="/public/js/pages/index.js"></script>
	<script type="text/javascript" src="/public/js/widget/nav.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
	<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
<div id="nav-bottom">
	<!--顶部-->
	<div class="nav-top">
		<div class="top">
			<div class="py-container">
				<div class="shortcut">
					<!-- 顶部左模块 -->
					<ul class="fl">
						<c:if test="${ruser!=null}">尚品购欢迎您，${ruser.uname }&nbsp&nbsp&nbsp</c:if>
						<c:if test="${ruser==null}">
							<!-- TODO 登录 toLogin -->
							<a href="toLogin.do">登录</a>&nbsp&nbsp&nbsp
							<!-- TODO 注册 toRegister -->
							<a href="toRegister.do">注册</a>
						</c:if>
						<c:if test="${ruser!= null}">
							<td>
								<!-- TODO 用户中心 userCenter -->
								<li class="f-item" id="service">
									<span>用户中心</span>
									<ul class="service">
										<li><a href="userCenter_account.do" target="_blank">我的账户</a></li>
										<li><a href="userCenter_store.do" target="_blank">我的店铺</a></li>
										<li><a href="userCenter_account.do" target="_blank">我的账户</a></li>
										<li><a href="userCenter_trade.do" target="_blank">流水统计</a></li>
									</ul>
								</li>
								<!-- TODO 退出 exit -->
								<a href="exit">退出</a>
							</td>
						</c:if>
					</ul>
					<!-- 顶部右模块 -->
					<ul class="fr">
						<!-- TODO 我的订单 searchOrder -->
						<li class="f-item"><a href="searchOrder" target="_blank">我的订单</a></li>
						<li class="f-item space"></li>
						<!-- TODO 我的尚品购 home.html -->
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
	当前位置： <a href="before?id=0">首页</a> > 商品详情
</div>
<center>
	<div class="thumbnail">
		<img src="logos/${product.gpicture}" style="width:400px;height:400px;"/>
	</div>
	<div class="caption" style="width: 500px;">
		<br><br>
		名称：${product.gname}
		<br><br>
		编号：${product.gid}
		<br><br>
		价格: ${product.gprice}
		<br><br>
		<span style="text-indent: 50px;">商品介绍: ${product.gintroduction}</span>
		<br><br>
		<!-- TODO  继续购物  products.do -->
		<a href="before?pageCur=${pageCur }" class="btn btn-default">继续购物</a>
		<!-- TODO  购物车  addcart -->
		<a href="/cart/putCart?shoppingnum=1&id=${product.gid}" class="btn btn-primary addToCart" role="button">
			<i class="fa-solid fa-cart-shopping" aria-hidden="true"></i> 加入购物车
		</a>
		<!-- 用户登录了才会出现这个按钮 -->
		<c:if test="${ruser!=null }">
			<!-- TODO  询价  talk -->
			<a href="talk.do?toid=${product.sellerId}" target="_blank" class="btn btn-primary addToCart">
				<i class="fa-solid fa-comment" aria-hidden="true"></i> 询价
			</a>
			<!-- TODO  竞价  bid -->
			<a href="bid?gid=${product.gid}&gname=${product.gname}&gprice=${product.gprice}&sellerid=${product.sellerId}" target="_blank" class="btn btn-primary addToCart">
				<i class="fa-solid fa-comment" aria-hidden="true"></i> 竞价
			</a>
		</c:if>
	</div>
</center>
</body>
<script type="text/javascript">
</script>
</html>