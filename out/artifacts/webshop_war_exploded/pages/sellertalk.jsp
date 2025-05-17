<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String jsUrl = request.getContextPath() + "/public/js/";
	String cssUrl = request.getContextPath() + "/public/css/";
	String imgUrl = request.getContextPath() + "/public/img/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>webshop商家聊天</title>
	<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=cssUrl%>login.css">
	<link rel="stylesheet" href="<%=cssUrl%>amazeui.min.css">
	<script src="<%=jsUrl%>login.js"></script>
	<link href="<%=cssUrl%>index.css" rel="stylesheet">
	<link href="/public/css/before/daohang.css" rel="stylesheet" type="text/css" />
	<link href="/public/css/before/common.css" rel="stylesheet" type="text/css" />
	<link href="/public/css/before/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="public/css/base.css">
	<link rel="stylesheet" type="text/css" href="public/css/home.css">
	<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
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
	当前位置： <a href="before?id=0">首页</a> > 个人中心 > 我的消息
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
<div class="admin-content">
	<div class="" style="width: 65%; float: left;">
		<!-- 聊天区 -->
		<div class="am-scrollable-vertical" id="chat-view"
			 style="height: 310px;">
			<ul class="am-comments-list am-comments-list-flip" id="chat">
				<c:forEach items="${messages}" var="message">
					<!-- 卖家自己发送的 -->
					<c:if test="${message.fromid eq ruser.uid }">
						<li class="am-comment am-comment-flip am-comment-primary">
							<a href="#link-to-user-home">
								<img width="48" height="48" class="am-comment-avatar" alt="" src="../public/img/talk/sell.jpg">
							</a>
							<div class="am-comment-main">
								<header class="am-comment-hd">
									<div class="am-comment-meta">
										<a class="am-comment-author" href="#link-to-user">${ruser.uname}</a> 发表于
										<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
									</div>
								</header>
								<div class="am-comment-bd">
									<p>${message.context }</p>
								</div>
							</div>
						</li>
					</c:if>
					<!-- 卖家接受到的 -->
					<c:if test="${message.toid eq ruser.uid }">
						<li class="am-comment am-comment-primary">
							<a href="#link-to-user-home">
								<img width="48" height="48" class="am-comment-avatar" alt="" src="../public/img/talk/buy.jpg">
							</a>
							<div class="am-comment-main">
								<header class="am-comment-hd">
									<div class="am-comment-meta">
										<a class="am-comment-author" href="#link-to-user">${message.fromname}</a> 发表于
										<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
									</div>
								</header>
								<div class="am-comment-bd">
									<p>${message.context }</p>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!-- 消息输入区 -->
		<form action="sellertalksend.do" method="post">
			<input type="hidden" name="fromid" value="${ruser.uid }">
			<input type="hidden" name="toid" value="${messagefromid }">
			<div class="am-form-group am-form">
                <textarea class="" id="message" name="context" rows="5"
						  placeholder="这里输入你想发送的信息..."></textarea>
			</div>
			<!-- 接收者 -->
			<div class="" style="float: left">
				<p class="am-kai">
					<!-- 发送给 : <span id="sendto">赵丽丽</span> -->
				</p>
			</div>
			<!-- 按钮 -->
			<div class="am-btn-group am-btn-group-xs" style="float: right;">
				<button class="am-btn am-btn-default" type="submit"
						onClick="sendMessage()">
					<i class="fa-solid fa-comment-dots"></i> 发送
				</button>
				<button class="am-btn am-btn-default" type="submit">
					<i class="fa-solid fa-file-invoice"></i>
					<a href="pages2/createOrder.jsp?uid=${ruser.uid}&bid=${orderbuy}">订单</a>
				</button>
			</div>
		</form>
	</div>
	<!-- 列表区 -->
	<div class="am-panel am-panel-default" style="float: right; width: 20%;">
		<div class="am-panel-hd">
			<!-- usersmap是sellertalk插入session内的 -->
			<h3 class="am-panel-title">客户列表 [${usersmap.size() }]</h3>
		</div>
		<c:forEach items="${users}" var="fromid">
			<c:if test="${fromid!=user.uid }">
				<ul class="am-list am-list-static am-list-striped">
					<li>
						<a href="sellertalk.do?messagefromid=${fromid}">${fromid}</a>
						<c:if test="${usersmap.get(fromid) }">
							<button class="am-btn am-btn-xs am-btn-danger" id="tuling" data-am-button>新消息！</button>
						</c:if>
					</li>
				</ul>
			</c:if>
		</c:forEach>
	</div>
</div>
</body>
</html>