﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0px auto;
	height: auto;
	width: 800px;
	border: 1px solid gray;
}

#header {
	height: 90px;
	width: 800px;
	margin: 0px 0px 3px 0px;
}

#header h1 {
	text-align: center;
	font-family: 华文彩云;
	color: #000000;
	font-size: 30px;
}

#navigator {
	height: 25px;
	width: 800px;
	font-size: 14px;
}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;
}
#navigator li a {
	color: #FFFFFF;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 98px;
	height: 22px;
	text-align: center;
	background-color: brown;
	margin-left: 2px;
}
#navigator li a:hover {
	background-color:darkred;
	color: #FFFFFF;
}
#navigator ul li ul {
   visibility: hidden;
   position: absolute;
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}

#content {
	height: auto;
	width: 780px;
	padding: 10px;
}

#content iframe {
	height: 300px;
	width: 780px;
}

#footer {
	height: 30px;
	width: 780px;
	line-height: 2em;
	text-align: center;
	background-color: gray;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎${auser.aname}进入后台管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a>商品审核</a>
				<ul>
					<li><a href="adminGoods/selectGoods" target="center">查看审核状态</a></li>
					<li><a href="adminGoods/selectGoods?act=updateSelect" target="center">审核商品</a></li>
				</ul>
			</li>
			<li><a>店铺审核</a>
				<ul>
					<li><a href="adminStores/selectStores" target="center">查看审核状态</a></li>
					<li><a href="adminStores/selectStores?act=updateSelect" target="center">审核店铺</a></li>
				</ul>
			</li>
			<li><a>管理员管理</a>
				<ul>
					<li><a href="adminMgr/toAddMgr" target="center">添加管理员</a></li>
					<li><a href="adminMgr/toDeleteMgr" target="center">删除管理员</a></li>
				</ul>
			</li>
			<li><a href="exit">安全退出</a></li>
		</ul>
	</div>
	<div id="content">
		<iframe src="adminGoods/selectGoods"  name="center" frameborder="0"></iframe>
	</div>
	<div id="footer"> </div>
</body>
</html>


