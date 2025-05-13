<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>推荐商品</title>
</head>
<body>
<h1>为您推荐的商品</h1>
<ul>
    <c:forEach items="${recommendedGoods}" var="goods">
        <li>${goods.gname}</li>
    </c:forEach>
</ul>
</body>
</html>