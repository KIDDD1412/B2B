<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>我的订单</title>
  <link rel="stylesheet" href="/public/css/layui.css">
  <style>
    body{padding: 32px; /*overflow-y: scroll;*/}
	.layui-table-view{margin: 8px 0;}
  </style>

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


<div class="layui-table">
	<div class="location ared">
		当前位置： <a href="before?id=0">首页</a> > 我的订单
	</div>
				<h3>作为买方的订单</h3>
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>订单编号</th>
						<th>商品编号</th>
						<th>商品数量</th>
						<th>订单总价</th>
						<th>卖家编号</th>
						<th>合同查看</th>
						<th>订单版本</th>
						<th>状态</th>
						<th>  </th>
					</tr>
					<c:forEach items="${borderlist }" var="mf">
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.oid }</td>
							<td bgcolor="#ffffff" align="center">${mf.gid }</td>
							<td bgcolor="#ffffff" align="center">${mf.gamount }</td>
							<td bgcolor="#ffffff" align="center">${mf.oprice }</td>
							<td bgcolor="#ffffff" align="center">${mf.sid }</td>
							<td bgcolor="#ffffff" align="center"><a href="/file/${mf.contract }" download="双方合同.docx" >${mf.contract }</a></td>
							<td bgcolor="#ffffff" align="center"><a href=""><a href="searchOrderHistory?oid=${mf.oid }">${mf.oversion }</a></td>
							<td bgcolor="#ffffff" align="center">
<%--						<td bgcolor="#ffffff" align="center"><a href="">${mf.status }</a></td>--%>
	                            <c:if test="${mf.status==0 }">待商家同意</c:if>
								<c:if test="${mf.status==1 }">
									待
									<a href="cash/cashcart.do?oid=${mf.oid}" target="right_show">
									<b style="color: brown;">付款</b>
									</a>
								</c:if>
								<c:if test="${mf.status==2 }">待商家发货</c:if>
								<c:if test="${mf.status==3 }">
									待
									<a href="cash/receive.do?oid=${mf.oid}" target="right_show">
										<b style="color: brown;">收货</b>>
									</a>
								</c:if>
								<c:if test="${mf.status==4 }"><b style="color: darkseagreen;">已完成</b></c:if>
							</td>
<%--							<a class="btn btn-danger delete" href="orders.do?orderid=${order.oid }">查看详情</a>--%>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="layui-table">
				<h3>作为卖方的订单</h3><a href="pages2/createOrder.jsp?uid=${uid}">添加新订单</a>
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th align="center">订单编号</th>
						<th>商品编号</th>
						<th>商品数量</th>
						<th>订单总价</th>
						<th>买家编号</th>
						<th>合同查看</th>
						<th>订单版本</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${sorderlist }" var="mf">
						<tr>
							<td bgcolor="#ffffff" align="center" id="oid" name="oid">${mf.oid }</td>
							<td bgcolor="#ffffff" align="center" id="gid" name="gid">${mf.gid }</td>
							<td bgcolor="#ffffff" align="center" id="gamount" name="gamount">${mf.gamount }</td>
							<td bgcolor="#ffffff" align="center" id="oprice" name="oprice">${mf.oprice }</td>
							<td bgcolor="#ffffff" align="center" id="bid" name="bid">${mf.bid }</td>
							<td bgcolor="#ffffff" align="center" id="contract" name="contract"><a href="/file/${mf.contract }" download="双方合同.docx" >${mf.contract }</a></td>
							<td bgcolor="#ffffff" align="center" id="oversion" name="oversion"><a href="searchOrderHistory?oid=${mf.oid }">${mf.oversion }</a></td>
							<td bgcolor="#ffffff" align="center">
								<c:if test="${mf.status==0 }">待
									<a href="cash/agree?oid=${mf.oid}" target="right_show">
										<b style="color: brown;">同意</b>>
									</a>
								</c:if>
								<c:if test="${mf.status==1 }">待买家付款</c:if>
								<c:if test="${mf.status==2 }">
									待
									<a href="cash/send?oid=${mf.oid}" target="right_show">
										<b style="color: brown;">发货</b>>
									</a>
								</c:if>
								<c:if test="${mf.status==3 }">待买家收货</c:if>
								<c:if test="${mf.status==4 }"><b style="color: darkseagreen;">已完成</b></c:if>
							</td>
							<td bgcolor="#ffffff" align="center"><a href="toUpdateOrder?oid=${mf.oid }" >修改</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
</body>
</html>
