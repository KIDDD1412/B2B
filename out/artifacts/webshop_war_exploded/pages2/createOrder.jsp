<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>body{padding: 16px;}</style>
<title>添加新订单</title>
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
            <li class="f-item"><a href="/searchOrder" target="_blank">我的订单</a></li>
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

<div class="location ared">
  当前位置： <a href="/before?id=0">首页</a> > 创建订单
</div>
<td>
<td>

<%--  action="/orderSubmit"--%>
  <form class="layui-form layui-form-pane1" id="myForm" lay-filter="first" enctype="multipart/form-data" method="post"><!-- enctype="multipart/form-data" -->
    <div class="layui-form-item">
      <label class="layui-form-label">商品编号</label>
      <div class="layui-input-block">
        <input type="text" id="gid" name="gid" lay-verify="required" lay-reqText="商品编号不能为空" required placeholder="请输入商品编号" autocomplete="off" class="layui-input" >
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">商品数量</label>
      <div class="layui-input-block">
        <input type="text" id="gamount" name="gamount" lay-verify="required" autocomplete="off" class="layui-input demo-phone">
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline" style="width: 100px;">
          <input type="text" id="gprice" name="gprice" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux">此商品优惠前的价格，仅供双方参考</div>
	</div>
	</div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-inline" style="width: 100px;">
          <input type="text" id="oprice" name="oprice" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux">该字段填写内容为您与顾客商议后的总价格，即该订单您的应得金额</div>
	</div>
	</div>
    <div class="layui-form-item">
      <label class="layui-form-label">卖家用户编号</label>
<%--      <div class="layui-input-block">--%>
<%--      <%String id=request.getParameter("uid"); %>--%>
<%--        <br/>--%>
<%--        <%=id %> --%>
<%--      </div>--%>
<%--    </div>--%>
      <div class="layui-input-block">
        <%
          String uid = request.getParameter("uid");
          if (uid == null) {
        %>
        <input type="text" id="sid" name="sid" lay-verify="required" lay-vertype="alert" autocomplete="off" class="layui-input">
        <% }
          else { %>
        <br/>
        <%= uid %>
        <% } %>
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">买家用户编号</label>
<%--      <div class="layui-input-block">--%>
<%--        <input type="text" id="bid" name="bid" lay-verify="required"  lay-vertype="alert" autocomplete="off" class="layui-input">--%>
<%--      </div>--%>
      <div class="layui-input-block">
        <%
          String bid = request.getParameter("bid");
          if (bid == null) {
        %>
        <input type="text" id="bid" name="bid" lay-verify="required" lay-vertype="alert" autocomplete="off" class="layui-input">
        <% } else { %>
        <%= bid %>
        <% } %>
      </div>
    </div>
    <label for="contract" class="layui-form-label">合同上传</label>

	<input type="file" id="file" name="file" accept=".doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
    <a href="/file/sample.docx" download="合同模板.docx" >不知道怎么撰写合同？这里为您提供了合同模板</a><br/><br/>
    
    <div class="layui-form-item">
      <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
      </div>
    </div>
  </form>

  <br><br><br>


  <script>
    var form = document.getElementById("myForm");
    var uid = "<%= uid %>"; // 获取 uid 的值
    var bid = "<%= bid %>"; // 获取 bid 的值

    // 判断 uid 和 bid 的值，设置对应的 action 路径
    if (uid.trim() !== '' && bid.trim() !== '') {
      form.action = "/orderSubmit?uid=" + uid + "&bid=" + bid;
    } else {
      form.action = "/orderSubmit";
    }
  </script>
  <script src="js/layui.js" src1="https://cdn.staticfile.org/layui/2.6.8/layui.js"></script>
  <script>

  layui.use(['form', 'util', 'laydate'], function(){
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;
    var util = layui.util;
    var laydate = layui.laydate;

    // 自定义验证规则
    form.verify({
      amount: function(value) {
        if (value && !/^\d+\.\b\d{2}\b$/.test(value)) { // 值若填写时才校验
          return '金额必须为小数保留两位';
        }
      }
    });
    
    /*
    form.on('submit(top)', function(data){
      console.log(data);
      return false;
    });
    */
    
    //方法提交
  $('#testSubmit').on('click', function(){
    form.submit('top', function(data){
      layer.confirm('确定提交么？', function(index){
        layer.close(index);

        // 验证均通过后执行提交
        setTimeout(function(){
          alert(JSON.stringify(data.field));
        })
        
      });
    });
    return false;
  });
    
    
    //日期
    laydate.render({
      elem: '#date'
    });
    
   

    // 自定义动态点缀事件
    form.on('input-affix(set)', function(data){
      var elem = data.elem;
      elem.value = '通过自定义事件设置的值';
    });
    
    //事件
    form.on('select(quiz111)', function(data){
      console.log('select: ', this, data);
    });
    
    form.on('select(quiz)', function(data){
      console.log('select.quiz：', this, data);
    });
    
    form.on('select(interest)', function(data){
      console.log('select.interest: ', this, data);
    });
    
    form.on('checkbox', function(data){
      console.log(this.checked, data.elem.checked);
    });
    
    form.on('switch', function(data){
      console.log(data);
    });
    
    form.on('radio', function(data){
      console.log(data);
    });
    
    // 提交事件
    form.on('submit(*)', function(data){
      console.log(data)
      alert(JSON.stringify(data.field));
      return false;
    });

    // 设置半选
    $('#ID-indeterminate').prop('indeterminate', true);
    form.render('checkbox');
  });
  </script>


    </body>

</html>