<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>订单历史</title>
  <link rel="stylesheet" href="/public/css/layui.css">
  <style>
    body{padding: 32px; /*overflow-y: scroll;*/}
    .layui-table-view{margin: 8px 0;}
  </style>
</head>
<body>
<a href="searchOrder" >返回</a>
<div class="layui-table">
				
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>订单编号</th>
						<th>商品编号</th>
						<th>商品数量</th>
						<th>商品单价</th>
						<th>订单总价</th>
						<th>卖家编号</th>
						<th>买家编号</th>
						<th>合同查看</th>
						<th>订单版本</th>
						<th>日期</th>
					</tr>
					<c:forEach items="${historylist }" var="mf">
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.oid }</td>
							<td bgcolor="#ffffff" align="center">${mf.gid }</td>
							<td bgcolor="#ffffff" align="center">${mf.gamount }</td>
							<td bgcolor="#ffffff" align="center">${mf.gprice }</td>
							<td bgcolor="#ffffff" align="center">${mf.oprice }</td>
							<td bgcolor="#ffffff" align="center">${mf.sid }</td>
							<td bgcolor="#ffffff" align="center" id="bid" name="bid">${mf.bid }</td>
							<td bgcolor="#ffffff" align="center"><a href="file/${mf.contract }" download="双方合同.docx" >${mf.contract }</a></td>
							<td bgcolor="#ffffff" align="center">${mf.oversion }</td>
							<td bgcolor="#ffffff" align="center">${mf.date }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
</body>
</html>
