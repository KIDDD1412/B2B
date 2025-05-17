<%@ page import="com.mysql.cj.x.protobuf.MysqlxDatatypes" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String jsUrl=request.getContextPath()+"/public/js/";
  String cssUrl=request.getContextPath()+"/public/css/";
  String imgUrl=request.getContextPath()+"/public/img/";
  String flieUrl = request.getContextPath()+"/WEB-INF/pages/";
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="/public/css/layui.css">
   <style>
      body{padding: 16px;}
   </style>
   <title>商品竞价</title>
   <script type="text/javascript">
     // 在页面加载时从本地存储中获取最高价的值
     document.addEventListener("DOMContentLoaded", function() {
       var savedGprice = localStorage.getItem('gprice');
       if (savedGprice) {
         // 如果本地存储中有最高价的值，则将其显示在页面中
         document.getElementById("gprice").innerText = savedGprice;
       }
     });
    function custCheck(){
      var oprice = parseFloat(document.getElementById("oprice").value);
      console.log("oprice",oprice);
      var gpriceElement = document.getElementById("gprice");
      var gprice = parseFloat(document.getElementById("gprice").innerText);
      console.log("gprice",gprice);
      // var gprice = session.getAttribute("gprice");
      if (oprice==null) {
        alert("出价不能为空!");
        return false;
      }
      if(oprice<gprice){
        alert("竞价失败!");
        return false;
      }
      // 更新最高竞价
      gpriceElement.innerText = oprice;
      // 将新的 gprice 存储在本地存储中
      localStorage.setItem('gprice', oprice);
      return true;
    }
  </script>
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
                <a href="/exit">退出</a>
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


<div class="location ared">
  当前位置： <a href="/before?id=0">首页</a> > 竞价
</div>
<form class="layui-form layui-form-pane1" action="pages2/createOrder.jsp?uid=${sellerid}&bid=${ruser.uid}" lay-filter="first" enctype="multipart/form-data" method="post" onSubmit="return custCheck()"><!-- enctype="multipart/form-data" -->
  <div class="layui-form-item">
    <label class="layui-form-label">商品编号</label>
    <div class="layui-form-label">
      ${gid}
    </div>
  </div>
    <div class="layui-form-item">
      <label class="layui-form-label">商品名称</label>
      <div class="layui-form-label">
        ${gname}
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">当前最高竞价</label>
      <div class="layui-form-label" id="gprice">
        ${gprice}
      </div>
	</div>
	</div>
    <div class="layui-form-item">
      <label class="layui-form-label">请您出价</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" id="oprice" name="oprice" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
	</div>
    <div class="layui-form-item">
      <div class="layui-input-block">
        <button type="submit" class="layui-btn" lay-submit lay-filter="*">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
      </div>
    </div>
  </form>
</body>
</html>