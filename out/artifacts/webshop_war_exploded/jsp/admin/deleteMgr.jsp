<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../../css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: gray;
		}
	</style>
</head>
<body>
	<c:if test="${allMgr.size() == 0 }">
		您还没有管理员。
	</c:if>
	<c:if test="${allMgr.size() != 0 }">
		<table border="1" bordercolor="gray" >
			<tr>
				<th width="300px">管理员ID</th>
				<th width="300px">管理员昵称</th>
				<th width="300px">管理员密码</th>
				<th width="300px">操作</th>
			</tr>
			<c:forEach items="${allMgr }" var="Mgr">
				<tr>
					<td>${Mgr.mid }</td>
					<td>${Mgr.mname }</td>
					<td>${Mgr.mpassword }</td>
					<td><a href="adminMgr/deleteMgr?id=${Mgr.mid }" target="center" >删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	${msg }
</body>
</html>