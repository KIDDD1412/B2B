<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <th width="200px">管理员ID</th>
            <th width="300px">管理员昵称</th>
            <th width="300px">管理员密码</th>
        </tr>
        <c:forEach items="${allMgr }" var="Mgr">
            <tr>
                <td>${Mgr.mid }</td>
                <td>${Mgr.mname }</td>
                <td>${Mgr.mpassword }</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<form:form action="adminMgr/addMgr" modelAttribute="manager" method="post">
    管理员昵称：
    <form:input path="mname" cssClass="textSize"/>
    <br>
    管理员密码：
    <form:password path="mpassword" cssClass="textSize" maxlength="20"/>
    <input type="submit" value="添加"/>
</form:form>
${msg }
</body>
</html>