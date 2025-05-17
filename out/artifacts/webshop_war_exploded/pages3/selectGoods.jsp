<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>店铺详情</title>
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
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
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

	<div class="blank"></div>
	<div class="block clearfix">
	<div class="location ared">
			当前位置： <a href="userCenter_trade">个人中心</a> >  <a href="userCenter_store">我的店铺 </a>> 店铺详情
		</div>
		<div class="AreaL">
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="updateStoreDetail/toAddGoods" target="center">商品上架申请</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="updateStoreDetail/selectGoods?act=deleteSelect" target="center">商品下架</a><span></span>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="title_bt">
						<span></span><a href="updateStoreDetail/selectGoods?act=updateSelect" target="center">商品信息修改</a><span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="AreaR">
			<c:if test="${allGoods.size() == 0 }">您还没有商品。</c:if>
			<c:if test="${allGoods.size() != 0 }">
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品编号</th>
						<th>商品名</th>
						<th>商品图片</th>
						<th>价格</th>
						<th>库存</th>
						<th>商品状态</th>
					</tr>
					<tr>
						<td colspan="5" height="15px" style="border: 0 none; background: #FFF"></td>
					</tr> 
			<c:forEach items="${allGoods }" var="goods">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td align="center" bgcolor="#dddddd" width="80px">${goods.gid}</td>
					<td align="center" bgcolor="#dddddd" width="200px">${goods.gname }</td>
					<td bgcolor="#dddddd" align="center">
						<a href="updateStoreDetail/selectAGoods?id=${goods.gid }">
							<img title="${goods.gname}" style="width: 100px; height: 90px;" src="logos/${goods.gpicture}" border="0"/>
						</a>
					</td>
					<td>${goods.gprice }</td>
					<td>${goods.gamount }</td>
					<td>
						<c:if test="${goods.gstatus==1}">通过</c:if>
						<c:if test="${goods.gstatus==0}">未通过</c:if>
					</td>
				</tr>
			</c:forEach>

					<tr>
						<td colspan="5" align="right">
					&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;共${totalPage}页&nbsp;&nbsp;
					第${pageCur}页&nbsp;&nbsp;
					<c:url var="url_pre" value="updateStoreDetail/selectGoods">
						<c:param name="pageCur" value="${pageCur - 1 }"/>
					</c:url>
					<c:url var="url_next" value="updateStoreDetail/selectGoods">
						<c:param name="pageCur" value="${pageCur + 1 }"/>
					</c:url>
					<!-- 第一页没有上一页 -->
					<c:if test="${pageCur != 1 }">
						<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<!-- 最后一页，没有下一页 -->
					<c:if test="${pageCur != totalPage && totalPage != 0}">
						<a href="${url_next}">下一页</a>
					</c:if>
						</td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>




