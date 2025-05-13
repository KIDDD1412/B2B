<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <jsp:include page="head.jsp"></jsp:include> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>搜索结果</title>
<link href="/public/css/daohang.css" rel="stylesheet" type="text/css" />
<link href="/public/css/common.css" rel="stylesheet" type="text/css" />
<link href="/public/css/style.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="/public/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/pages-JD-index.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/widget-jquery.autocomplete.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/widget-cartPanelView.css"/>
	<link href="/public/css/daohang.css" rel="stylesheet" type="text/css" />
<link href="/public/css/common.css" rel="stylesheet" type="text/css" />
<link href="/public/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="/public/js/base.js"></script>
    <script type="text/javascript" src="/public/js/service/contentService.js"></script>
    <script type="text/javascript" src="/public/js/controller/contentController.js"></script>
</head>

<body ng-app="youmai" ng-controller="contentController" ng-init="findByCategoryId(1)">
<!-- 头部栏位 -->
<!--页面顶部-->
<div id="nav-bottom">
    <!--顶部-->
    <div class="nav-top">
        <div class="top">
            <div class="py-container">
                <div class="shortcut">
                    	<ul class="fl">
                        <c:if test="${ruser!=null}">尚品购欢迎您，${ruser.uname }&nbsp&nbsp&nbsp  </c:if>
								<c:if test="${ruser==null}"><a href="toLogin">登录</a>&nbsp&nbsp&nbsp<a href="toRegister">注册</a></c:if>
                        <c:if test="${ruser!= null}">	
						<td><a href="userCenter">用户中心</a><span
							class="xx">|</span><a href="exit">退出</a></td>
						</c:if>
                    </ul>
                    <ul class="fr">
                        <li class="f-item">我的订单</li>
                        <li class="f-item space"></li>
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
        </div>

        <!--头部-->
        <div class="header">
            <div class="py-container">
                <div class="yui3-g Logo">
                    <div class="yui3-u Left logoArea">
                        <a class="logo-bd" title="尚品购" href="before" target="_blank"></a>
                    </div>
                    <div class="yui3-u Center searchArea">
                        <div class="search">
                            <form action="search" name="myForm" method="post"class="sui-form form-inline">
                                <!--searchAutoComplete-->
                                <div class="input-append">
						<div class="div2">
						
							<input type="text" name="mykey" class="input-error input-xxlarge" placeholder="请输入您要查询的内容"  onfocus="clearValue()" />
							<input type="submit" class="sui-btn btn-xlarge btn-danger"  value="搜索" />
						</div>
						
                                </div>
                            </form>
                        </div>
                        <div class="hotwords">
                            <ul>
                                <li class="f-item">尚品购首发</li>
                                <li class="f-item">亿元优惠</li>
                                <li class="f-item">9.9元团购</li>
                                <li class="f-item">每满99减30</li>
                                <li class="f-item">亿元优惠</li>
                                <li class="f-item">9.9元团购</li>
                                <li class="f-item">办公用品</li>

                            </ul>
                        </div>
                    </div>
                    <div class="yui3-u Right shopArea">
                        <div class="fr shopcar">
                            <div class="show-shopcar" id="shopcar">
                                <span class="car"></span>
                                <a class="sui-btn btn-default btn-xlarge" href="cart.html" target="_blank">
                                    <span>我的购物车</span>
                                    <i class="shopnum">0</i>
                                </a>
                                <div class="clearfix shopcarlist" id="shopcarlist" style="display:none">
                                    <p>"啊哦，你的购物车还没有商品哦！"</p>
                                    <p>"啊哦，你的购物车还没有商品哦！"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="yui3-g NavList">
                    <div class="yui3-u Left all-sort">
                        <h4>全部商品分类</h4>
                    </div>
                    <div class="yui3-u Center navArea">
                        <ul class="nav">
                            <li class="f-item">服装城</li>
                            <li class="f-item">美妆馆</li>
                            <li class="f-item">品优超市</li>
                            <li class="f-item">全球购</li>
                            <li class="f-item">闪购</li>
                            <li class="f-item">团购</li>
                            <li class="f-item">有趣</li>
                            <li class="f-item"><a href="loadStore" target="_blank">商店</a></li>
                        </ul>
                    </div>
                    <div class="yui3-u Right"></div>
                </div>
            </div>
        </div>

<!--列表-->

	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">当前位置： <a href="before?id=0">首页</a> > 搜索结果</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>详情页</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr>
					<c:forEach items="${searchlist }" var="mf">
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.gid }</td>
							<td bgcolor="#ffffff" align="center">${mf.gname }</td>
							<td align="center" bgcolor="#ffffff" height="60px"><img
								style="width: 50px; height: 50px;"
								src="logos/${mf.gpicture }" border="0" title="${mf.gname }" />
							</td>
							<td align="center" bgcolor="#ffffff">${mf.gprice }</td>
							<td align="center" bgcolor="#ffffff"><a
								style="text-decoration: none;" class="f6"
                                href="productdetail.do?productid=${mf.gid }">去看看</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
