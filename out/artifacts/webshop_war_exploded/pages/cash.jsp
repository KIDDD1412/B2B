<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
	String flieUrl = request.getContextPath()+"/WEB-INF/pages/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结账</title>
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

<div class="location ared">
	当前位置： <a href="before?id=0">首页</a> > 我的订单 >确认付款
</div>
	
	<div class="container">
		<br><br><br>
		<div class="alert alert-info tip-success">
	          本次订单您应付: <b>￥  ${oprice}</b>
	  	</div>
		<c:if test="${requestScope.errors != null }">
			<div class="alert alert-danger text-center">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b>${requestScope.errors }</b>
			</div>
		</c:if>
		<div class="container">
			<form class="form-signin" id="form2" action="cash/cash.do?oid=${oid}" method="post" style="width:330px;margin:0 auto;">
				<h4>账户余额</h4>(剩余:￥${ruser.ubalance})
			</form>
			<button class="btn btn-lg btn-primary btn-block" style="margin-left:25%;margin-top:20px;width: 50%" onclick="window.location.href='cash.do?oid=${oid}'">确认支付</button>
		</div>
		
	</div>

</body>
</script>
</html>