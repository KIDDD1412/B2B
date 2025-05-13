<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>updateAgoods.jsp</title>
<link href="../../../css/admin/common.css" type="text/css" rel="stylesheet">
</head>    
<body>
	<form:form action="adminGoods/addGoods" method="post" modelAttribute="goods">
		<table border=1 style="border-collapse: collapse">
			<caption>
				<font size=4 face=华文新魏>审核商品</font>
				<form:hidden path="gid"/>
			</caption>
			<tr>
				<td>名称</td>
				<td>
					<form:input path="gname"/>
				</td>
			</tr>
			<tr>
				<td>价格</td>
				<td>
					<form:input path="gprice"/>
				</td>
			</tr>
			<tr>
				<td>介绍</td>
				<td>
					<form:input path="gintroduction"/>
				</td>
			</tr>
			<tr>
				<td>库存</td>
				<td>
					<form:input path="gamount"/>
				</td>
			</tr>
			<tr>
				<td>审核</td>
				<td>
					<form:input path="gstatus"/>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="提交"/>
				</td>
				<td align="left">
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form:form>
	${msg }
</body>
</html>
