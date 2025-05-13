<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String jsUrl = request.getContextPath() + "/public/js/";
	String cssUrl = request.getContextPath() + "/public/css/";
	String imgUrl = request.getContextPath() + "/public/img/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
	<title>聊天框</title>
	<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=cssUrl%>login.css">
	<link rel="stylesheet" href="<%=cssUrl%>amazeui.min.css">
	<link rel="stylesheet" href="<%=cssUrl%>index.css">
	<link rel="stylesheet" type="text/css" href="public/css/base.css">
	<link rel="stylesheet" type="text/css" href="public/css/home.css">
	<link rel="stylesheet" type="text/css" href="/public/css/webbase.css"/>
	<link rel="stylesheet" type="text/css" href="/public/css/pages-register.css"/>
	<link rel="stylesheet" type="text/css" href="/public/css/style.css"/>
	<link rel="stylesheet" href="/public/css/talk.css" />
	<script type="text/javascript" src="/public/js/base.js"></script>
	<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
	<script type="text/javascript" src="/public/js/model/cartModel.js"></script>
	<script type="text/javascript" src="/public/js/czFunction.js"></script>
	<script type="text/javascript" src="/public/js/plugins/jquery.easing/jquery.easing.min.js"></script>
	<script type="text/javascript" src="/public/js/plugins/sui/sui.min.js"></script>
	<script type="text/javascript" src="/public/js/pages/index.js"></script>
	<script type="text/javascript" src="/public/js/widget/nav.js"></script>
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
							<!-- TODO 管理员登录 toLogin -->
							<a href="admin">管理员登录</a>&nbsp&nbsp&nbsp
							<!-- TODO 用户登录 toLogin -->
							<a href="toLogin.do">用户登录</a>&nbsp&nbsp&nbsp
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
										<li><a href="sellertalk.do" target="_blank">我的消息</a></li>
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
						<li class="f-item"><a href="home.html" target="_blank">我的尚品购</a></li>
						<li class="f-item space"></li>
						<li class="f-item">尚品购会员</li>
						<li class="f-item space"></li>
						<li class="f-item">企业采购</li>
						<li class="f-item space"></li>
						<li class="f-item">关注尚品购</li>
						<li class="f-item space"></li>
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
	当前位置： <a href="before?id=0">首页</a> > 询价
</div>
<!--整个聊天界面-->
<!--消息框-->
<div class="am-scrollable-vertical" id="chat-view" style="height: 400px; width: 1024px;margin: 0 auto;">
	<ul class="am-comments-list am-comments-list-flip" id="chat">
		<!-- 标签遍历 messages 列表 -->
		<c:forEach items="${messages}" var="message">
			<!-- 发送者是当前用户，则显示用户自己发送的消息样式 -->
			<c:if test="${message.fromid eq ruser.uid }">
				<li class="am-comment am-comment-flip am-comment-primary">
					<!-- TODO 跳转到用户主页 -->
					<a href="#link-to-user-home">
						<img width="48" height="48" class="am-comment-avatar" alt="" src="../public/img/talk/buy.jpg">
					</a>
					<div class="am-comment-main">
						<!-- 消息框上显示用户名、发送时间 -->
						<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">${ruser.uname }</a> 发送于
								<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
							</div>
						</header>
						<!-- 消息框内显示消息内容 -->
						<div class="am-comment-bd">
							<p>${message.context }</p>
						</div>
					</div>
				</li>
			</c:if>
			<!-- 接收者是当前用户，则显示对方发送的消息样式 -->
			<c:if test="${message.toid eq ruser.uid }">
				<li class="am-comment am-comment-primary">
					<a href="#link-to-user-home">
						<img width="48" height="48" class="am-comment-avatar" alt="" src="../public/img/talk/sell.jpg">
					</a>
					<div class="am-comment-main">
						<!-- 消息框显示用户名、发送时间、信息内容 -->
						<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">${message.fromname}</a> 发表于
								<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
							</div>
						</header>
						<div class="am-comment-bd">
							<p>${message.context}</p>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>
<!--消息框-->
<!--文字框+两个按钮-->
<div class="mt-38 flex-row">
	<form action="talksend" method="post" style="width:1024px;;margin: 0 auto;">
		<!--文字框-->
		<div class="flex-1 chat" style="width:800px;">
			<input type="hidden" name="fromid" value="${ruser.uid }">
			<div class="am-form-group am-form">
                <textarea class="" id="message" name="context" rows="5"
						  placeholder="这里输入你想发送的信息...最多可以输入255个汉字"></textarea>
			</div>
		</div>
		<!--文字框-->
		<!--两个右侧按钮-->
		<div class="ml-20 flex-col shrink-0 buttongroup">
			<!--发送按钮-->
			<div class="sendbutton">
				<button class="am-btn am-btn-default" type="submit">
					<i class="fa-solid fa-paper-plane"></i> 发送
				</button>
			</div>
			<!--订单按钮-->
			<!-- TODO 连接到订单生成界面 -->
			<div class="mt-52 sendbutton">
				<button class="am-btn am-btn-default" type="submit">
					<i class="fa-solid fa-file-invoice"></i>
					<a href="pages2/createOrder.jsp?bid=${ruser.uid}&uid=${ordersell}">订单</a>
				</button>
			</div>
			<!--订单按钮-->
		</div>
		<!--两个右侧按钮-->
	</form>
</div>
<!--文字框+两个按钮-->
<!--整个聊天界面-->
</body>
</html>