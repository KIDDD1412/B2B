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
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <title>尚品购，想购就购！</title>
    <link rel="icon" href="public/img/assets/img/favicon.ico">

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

    <script type="text/javascript" src="/public/js/model/cartModel.js"></script>
    <script type="text/javascript" src="/public/js/czFunction.js"></script>
    <script type="text/javascript" src="/public/js/plugins/jquery.easing/jquery.easing.min.js"></script>
    <script type="text/javascript" src="/public/js/plugins/sui/sui.min.js"></script>
    <script type="text/javascript" src="/public/js/pages/index.js"></script>
    <script type="text/javascript" src="/public/js/widget/nav.js"></script>
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
<%--                    顶部左模块--%>
                    	<ul class="fl">
                        <c:if test="${ruser!=null}">尚品购欢迎您，${ruser.uname }&nbsp&nbsp&nbsp</c:if>
                        <c:if test="${ruser==null}">
<%--TODO 管理员登录 toLogin--%>
                            <a href="admin">管理员登录</a>&nbsp&nbsp&nbsp
<%--TODO 用户登录 toLogin--%>
                            <a href="toLogin.do">用户登录</a>&nbsp&nbsp&nbsp
<%--TODO 注册 toRegister--%>
                            <a href="toRegister.do">注册</a>
                        </c:if>
                        <c:if test="${ruser!= null}">
						<td>
<%--TODO 用户中心 userCenter--%>
 						   <li class="f-item" id="service">
						        <span>用户中心</span>
  						      <ul class="service">
   						          <li><a href="userCenter_account.do" target="_blank">我的账户</a></li>
                                  <li><a href="userCenter_store.do" target="_blank">我的店铺</a></li>
                                  <li><a href="sellertalk.do" target="_blank">我的消息</a></li>
                                  <li><a href="userCenter_trade.do" target="_blank">流水统计</a></li>
   						     </ul>
   						 </li>
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

        <!--头部-->
        <div class="header">
            <div class="py-container">
                <div class="yui3-g Logo">
                    <div class="yui3-u Left logoArea">
                        <a class="logo-bd" title="尚品购" href="before" target="_blank"></a>
                    </div>
                    <div class="yui3-u Center searchArea">
<%--TODO 搜索栏 form search mykey--%>
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

<%--TODO 购物车 cart/selectCart--%>
                    <div class="yui3-u Right shopArea">
                        <div class="fr shopcar">
                            <div class="show-shopcar" id="shopcar">
                                <span class="car"></span>
                                <a class="sui-btn btn-default btn-xlarge" href="cart/selectCart" target="_blank">
                                    <span>我的购物车</span>
<%--                                    <i class="shopnum">0</i>--%>
                                </a>
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
<%--TODO 商店 loadStore--%>
                            <li class="f-item">商店</li>
                        </ul>
                    </div>
                    <div class="yui3-u Right"></div>
                </div>
            </div>
        </div>

<!--列表-->
<div class="sort">
    <div class="py-container">
        <div class="yui3-g SortList ">
            <div class="yui3-u Left all-sort-list">
                <div class="all-sort-list2">
                    <div class="item bo">
                        <h3><a href="">图书、音像、数字商品</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">家用电器</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">手机、数码</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">电脑、办公</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">家居、家具、家装、厨具</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">服饰内衣</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">个护化妆</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">运动健康</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">汽车用品</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">彩票、旅行</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">理财、众筹</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">母婴、玩具</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">箱包</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">运动户外</a></h3>
                    </div>
                    <div class="item">
                        <h3><a href="">箱包</a></h3>
                    </div>
                </div>
            </div>
            <div class="itemgood_nr clearfix">
                <ul>
<%--TODO 商品详情 goodsDetail--%>
                    <c:forEach items="${lastedlist }" var="sg" varStatus="loop">
                        <li>
                            <div>
                                <p class="pic">
                                    <a href="productdetail.do?productid=${sg.gid }&pageCur=${pageCur }"><img src="logos/${sg.gpicture}" /></a>

                                </p>
                                <p class="wz">
                                    <strong><a href="productdetail.do?productid=${sg.gid }&pageCur=${pageCur }">${sg.gname }</a></strong>
                                    <em>现价:<span>￥${sg.gprice}</span></em>
                                </p>
                            </div>
                        </li>
                        <!-- 在每6个商品后加入换行 -->
                        <c:if test="${loop.index % 6 == 5}">
                            <ul></ul>
                        </c:if>
                    </c:forEach>
                </ul>

                <div class="pagination pagination-bottom">
                    总记录数：${totalCount}，总页数：${totalPage}，当前页：${pageCur}
                    <c:if test="${pageCur > 1}">
                        <a href="before?pageCur=${pageCur - 1}">上一页</a>
                    </c:if>
                    <c:if test="${pageCur < totalPage}">
                        <a href="before?pageCur=${pageCur + 1}">下一页</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="recommend-container"> <!-- 新增容器 -->
<h1>推荐商品</h1>
<div class="recommendgood_nr clearfix">
    <%-- 循环展示推荐商品 --%>
    <c:forEach items="${recommendedGoods}" var="sg" varStatus="loop">
        <li>
            <div>
                <p class="pic">
                    <a href="productdetail.do?productid=${sg.gid }"><img src="logos/${sg.gpicture}" /></a>
                </p>
                <p class="wz">
                    <strong><a href="productdetail.do?productid=${sg.gid }">${sg.gname }</a></strong>
                    <em>现价:<span>￥${sg.gprice}</span></em>
                </p>
            </div>
        </li>
    </c:forEach>
</div>
</div>
<!-- 底部栏位 -->
<!--页面底部-->
<div class="clearfix footer">
    <div class="py-container">
        <div class="footlink">
            <div class="Mod-service">
                <ul class="Mod-Service-list">
                    <li class="grid-service-item intro  intro1">
                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>正品保障</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                    <li class="grid-service-item  intro intro2">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>正品保障</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                    <li class="grid-service-item intro  intro3">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>正品保障</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                    <li class="grid-service-item  intro intro4">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>正品保障</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                    <li class="grid-service-item intro intro5">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>正品保障</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                </ul>
            </div>
            <div class="clearfix Mod-list">
                <div class="yui3-g">
                    <div class="yui3-u-1-6">
                        <h4>购物指南</h4>
                        <ul class="unstyled">
                            <li>购物流程</li>
                            <li>会员介绍</li>
                            <li>生活旅行/团购</li>
                            <li>常见问题</li>
                            <li>购物指南</li>
                        </ul>

                    </div>
                    <div class="yui3-u-1-6">
                        <h4>配送方式</h4>
                        <ul class="unstyled">
                            <li>上门自提</li>
                            <li>211限时达</li>
                            <li>配送服务查询</li>
                            <li>配送费收取标准</li>
                            <li>海外配送</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>支付方式</h4>
                        <ul class="unstyled">
                            <li>货到付款</li>
                            <li>在线支付</li>
                            <li>分期付款</li>
                            <li>邮局汇款</li>
                            <li>公司转账</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>售后服务</h4>
                        <ul class="unstyled">
                            <li>售后政策</li>
                            <li>价格保护</li>
                            <li>退款说明</li>
                            <li>返修/退换货</li>
                            <li>取消订单</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>特色服务</h4>
                        <ul class="unstyled">
                            <li>夺宝岛</li>
                            <li>DIY装机</li>
                            <li>延保服务</li>
                            <li>尚品购E卡</li>
                            <li>尚品购通信</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>帮助中心</h4>
                        <img src="../public/img/index/wx_cz.jpg">
                    </div>
                </div>
            </div>
            <div class="Mod-copyright">
                <ul class="helpLink">
                    <li>关于我们<span class="space"></span></li>
                    <li>联系我们<span class="space"></span></li>
                    <li>关于我们<span class="space"></span></li>
                    <li>商家入驻<span class="space"></span></li>
                    <li>营销中心<span class="space"></span></li>
                    <li>友情链接<span class="space"></span></li>
                    <li>关于我们<span class="space"></span></li>
                    <li>营销中心<span class="space"></span></li>
                    <li>友情链接<span class="space"></span></li>
                    <li>关于我们</li>
                </ul>
                <p>地址：杭州市西湖区留和路288号 邮编：310000 电话：111-222-3333 传真：010-1111111</p>
                <p>京ICP备08001421号京公网安备110108007702</p>
            </div>
        </div>
    </div>
</div>
<!--页面底部END-->
<!-- 楼层位置 -->
<div id="floor-index" class="floor-index">
    <ul>
        <li>
            <a class="num" href="javascript:;" style="display: none;">1F</a>
            <a class="word" href="javascript;;" style="display: block;">家用电器</a>
        </li>
        <li>
            <a class="num" href="javascript:;" style="display: none;">2F</a>
            <a class="word" href="javascript;;" style="display: block;">手机通讯</a>
        </li>
        <li>
            <a class="num" href="javascript:;" style="display: none;">3F</a>
            <a class="word" href="javascript;;" style="display: block;">电脑办公</a>
        </li>
        <li>
            <a class="num" href="javascript:;" style="display: none;">4F</a>
            <a class="word" href="javascript;;" style="display: block;">家居家具</a>
        </li>
        <li>
            <a class="num" href="javascript:;" style="display: none;">5F</a>
            <a class="word" href="javascript;;" style="display: block;">运动户外</a>
        </li>
    </ul>
</div>

<!--侧栏面板开始-->
<div class="J-global-toolbar">
    <div class="toolbar-wrap J-wrap">
        <div class="toolbar">
            <div class="toolbar-panels J-panel">

                <!-- 购物车 -->
                <div style="visibility: hidden;" class="J-content toolbar-panel tbar-panel-cart toolbar-animate-out">
                    <h3 class="tbar-panel-header J-panel-header">
                        <a href="" class="title"><i></i><em class="title">购物车</em></a>
                        <span class="close-panel J-close" onclick="cartPanelView.tbar_panel_close('cart');"></span>
                    </h3>
                    <div class="tbar-panel-main">
                        <div class="tbar-panel-content J-panel-content">
                            <div id="J-cart-tips" class="tbar-tipbox hide">
                                <div class="tip-inner">
                                    <span class="tip-text">还没有登录，登录后商品将被保存</span>
                                    <a href="#none" class="tip-btn J-login">登录</a>
                                </div>
                            </div>
                            <div id="J-cart-render">
                                <!-- 列表 -->
                                <div id="cart-list" class="tbar-cart-list">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 小计 -->
                    <div id="cart-footer" class="tbar-panel-footer J-panel-footer">
                        <div class="tbar-checkout">
                            <div class="jtc-number"><strong class="J-count" id="cart-number">0</strong>件商品</div>
                            <div class="jtc-sum"> 共计：<strong class="J-total" id="cart-sum">¥0</strong></div>
                            <a class="jtc-btn J-btn" href="#none" target="_blank">去购物车结算</a>
                        </div>
                    </div>
                </div>

                <!-- 我的关注 -->
                <div style="visibility: hidden;" data-name="follow" class="J-content toolbar-panel tbar-panel-follow">
                    <h3 class="tbar-panel-header J-panel-header">
                        <a href="#" target="_blank" class="title"> <i></i> <em class="title">我的关注</em> </a>
                        <span class="close-panel J-close" onclick="cartPanelView.tbar_panel_close('follow');"></span>
                    </h3>
                    <div class="tbar-panel-main">
                        <div class="tbar-panel-content J-panel-content">
                            <div class="tbar-tipbox2">
                                <div class="tip-inner"><i class="i-loading"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="tbar-panel-footer J-panel-footer"></div>
                </div>

                <!-- 我的足迹 -->
                <div style="visibility: hidden;" class="J-content toolbar-panel tbar-panel-history toolbar-animate-in">
                    <h3 class="tbar-panel-header J-panel-header">
                        <a href="#" target="_blank" class="title"> <i></i> <em class="title">我的足迹</em> </a>
                        <span class="close-panel J-close" onclick="cartPanelView.tbar_panel_close('history');"></span>
                    </h3>
                    <div class="tbar-panel-main">
                        <div class="tbar-panel-content J-panel-content">
                            <div class="jt-history-wrap">
                                <ul>
                                    <!--<li class="jth-item">
                                        <a href="#" class="img-wrap"> <img src=".portal/img/like_03.png" height="100" width="100" /> </a>
                                        <a class="add-cart-button" href="#" target="_blank">加入购物车</a>
                                        <a href="#" target="_blank" class="price">￥498.00</a>
                                    </li>
                                    <li class="jth-item">
                                        <a href="#" class="img-wrap"> <img src="portal/img/like_02.png" height="100" width="100" /></a>
                                        <a class="add-cart-button" href="#" target="_blank">加入购物车</a>
                                        <a href="#" target="_blank" class="price">￥498.00</a>
                                    </li>-->
                                </ul>
                                <a href="#" class="history-bottom-more" target="_blank">查看更多足迹商品 &gt;&gt;</a>
                            </div>
                        </div>
                    </div>
                    <div class="tbar-panel-footer J-panel-footer"></div>
                </div>

            </div>

            <div class="toolbar-header"></div>

            <!-- 侧栏按钮 -->
            <div class="toolbar-tabs J-tab">
                <div onclick="cartPanelView.tabItemClick('cart')" class="toolbar-tab tbar-tab-cart" data="购物车" tag="cart">
                    <i class="tab-ico"></i>
                    <em class="tab-text"></em>
                    <span class="tab-sub J-count " id="tab-sub-cart-count">0</span>
                </div>
                <div onclick="cartPanelView.tabItemClick('follow')" class="toolbar-tab tbar-tab-follow" data="我的关注"
                     tag="follow">
                    <i class="tab-ico"></i>
                    <em class="tab-text"></em>
                    <span class="tab-sub J-count hide">0</span>
                </div>
                <div onclick="cartPanelView.tabItemClick('history')" class="toolbar-tab tbar-tab-history" data="我的足迹"
                     tag="history">
                    <i class="tab-ico"></i>
                    <em class="tab-text"></em>
                    <span class="tab-sub J-count hide">0</span>
                </div>
            </div>

            <div class="toolbar-footer">
                <div class="toolbar-tab tbar-tab-top"><a href="#"> <i class="tab-ico  "></i> <em
                        class="footer-tab-text">顶部</em> </a></div>
                <div class="toolbar-tab tbar-tab-feedback"><a href="#" target="_blank"> <i class="tab-ico"></i> <em
                        class="footer-tab-text ">反馈</em> </a></div>
            </div>

            <div class="toolbar-mini"></div>

        </div>

        <div id="J-toolbar-load-hook"></div>

    </div>
</div>
<!--购物车单元格 模板-->
<script type="text/template" id="tbar-cart-item-template">
    <div class="tbar-cart-item">
        <div class="jtc-item-promo">
            <em class="promo-tag promo-mz">满赠<i class="arrow"></i></em>
            <div class="promo-text">已购满600元，您可领赠品</div>
        </div>
        <div class="jtc-item-goods">
            <span class="p-img"><a href="#" target="_blank"><img src="{2}" alt="{1}" height="50" width="50"/></a></span>
            <div class="p-name">
                <a href="#">{1}</a>
            </div>
            <div class="p-price"><strong>¥{3}</strong>×{4}</div>
            <a href="#none" class="p-del J-del">删除</a>
        </div>
    </div>
</script>
<!--侧栏面板结束-->
<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#service").hover(function () {
            $(".service").show();
        }, function () {
            $(".service").hide();
        });
        $("#shopcar").hover(function () {
            $("#shopcarlist").show();
        }, function () {
            $("#shopcarlist").hide();
        });

    })
</script>
<script type="text/javascript" src="/public/js/model/cartModel.js"></script>
<script type="text/javascript" src="/public/js/czFunction.js"></script>
<script type="text/javascript" src="/public/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="/public/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="/public/js/pages/index.js"></script>
<script type="text/javascript" src="/public/js/widget/cartPanelView.js"></script>
<script type="text/javascript" src="/public/js/widget/jquery.autocomplete.js"></script>
<script type="text/javascript" src="/public/js/widget/nav.js"></script>
</body>


</html>