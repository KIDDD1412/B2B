<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<%--<jsp:include page="head.jsp"></jsp:include>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>
<link href="/public/css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="/public/css/before/common.css" rel="stylesheet" type="text/css" />
<link href="/public/css/before/style.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
	//确认
	function  goOrderConfirm(){
		window.location.href="/cart/orderConfirm";
	}
	//清空
	function godelete(){
		if(window.confirm("真的清空购物车吗？")){
			window.location.href="/cart/clear";
			return true;
		}
		return false;
	}
	//删除
	function deleteAgoods(gno){
		if(window.confirm("真的删除该商品吗？")){
			window.location.href="/cart/deleteAgoods?id=" + gno;
			return true;
		}
		return false;
	}
</script>
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
						<li class="f-item"><a href="home.html" target="_blank">我的尚品购</a></li>
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

	<div class="blank"></div>
	<div class="block clearfix">
		<!--当前位置-->
		<div class="location ared">
			当前位置： <a href="before?id=0">首页</a> > 购物流程 > 购物车
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品信息</th>
						<th>单价（元）</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<!-- 这里使用了jstl标签-->
					<c:forEach var="ce" items="${cartlist}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">
<%--TODO 商品详情页--%>
								<a href="productdetail.do?productid=${ce.gid}">
								<img style="width: 100px; height: 100px;"
									src="logos/${ce.gpicture}" border="0"
									title="${ce.gname}" />
								</a>
								<br/>
<%--TODO 商品详情页--%>
								<a style="text-decoration: none;" href="productdetail.do?productid=${ce.gid}" class="f6">${ce.gname}
								</a>
							</td>

							<td bgcolor="#ffffff" width="110px" align="center"><span>${ce.gprice}</span></td>
							<td align="center" bgcolor="#ffffff" width="115px"
								valign="middle"><input type="text" name="goods_number"
								value="${ce.shoppingnum}" size="4"
								class="inputBg"
								style="text-align: center; width: 36px; color: #999999" />
							</td>

							<td align="center" bgcolor="#ffffff" width="115px">￥&nbsp;<span>${ce.smallsum}</span>&nbsp;</td>
							<td align="center" bgcolor="#ffffff" width="185px">
								<a style="text-decoration: none;" href="javaScript:deleteAgoods('${ce.id}')" class="f6" title="删除">
									<img src="../public/img/cart/sc.png" />
								</a>
							</td>

						</tr>
					</c:forEach>

					<tr>
						<td align="right" bgcolor="#ffffff" colspan="4" height="41px;" style="border-left: 0 none;">
							<font style="color: #a60401; font-size: 13px; font-weight: bold; letter-spacing: 0px;">购物金额总计 ￥&nbsp;<span id="stotal"></span>${total}元</font>
						</td>
						<td align="center" bgcolor="#ffffff">
<%--TODO 清空购物车--%>
							<input type="button" value="清空购物车" onclick="godelete()" class="bnt_blue_1" id="bnt11" />
						</td>
					</tr>

					<tr>
						<td bgcolor="#ffffff" colspan="4" align="right" style="padding: 5px; padding-left: 2px; border-right: 0 none">
							<a href="before">
								<img src="../public/img/cart/jxgw.jpg" alt="continue" />
							</a>
						</td>
						<td bgcolor="#ffffff" align="center" style="border-left: 0 none; padding: 5px; padding-right: 2px;">
							<a style="cursor: pointer;" href="javascript:goOrderConfirm()">
								<img src="../public/img/cart/qjs.jpg" alt="checkout" />
							</a>
						</td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</body>
</html>
