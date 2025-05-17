<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="/public/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/pages-register.css"/>
	<link rel="stylesheet" type="text/css" href="/public/css/style.css"/>
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>

    <script type="text/javascript" src="/public/js/base.js"></script>
    <script type="text/javascript" src="/public/js/service/userService.js"></script>
    <script type="text/javascript" src="/public/js/controller/userController.js"></script>
	<script>
	//刷新验证码
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	//表单验证
	function checkForm(){
		document.registerForm.submit();
		return true;
	}
    </script>

</head>

<body ng-controller="userController">
<div class="register py-container ">
<!--注册账号-->
    <div class="registerArea">
        <h3>登陆<span class="go">还没有尚品购账号？去
                <a href="toRegister.do" >注册</a>
            </span>
        </h3>

<!--登录表单，login，uname，upassword-->
        <div class="info">
            <form id="registerForm" class="sui-form form-horizontal" action="login.do" method="post" modelAttribute="user" name="registerForm">
                <div class="control-group">
                    <label class="control-label">用户名：</label>
                    <div class="controls">
                        <input type="text" name="uname" placeholder="请输入用户名" ng-model="entity.username" class="input-xfat input-xlarge">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">登录密码：</label>
                    <div class="controls">
                        <input type="password" name="upassword" placeholder="请输入登录密码" class="input-xfat input-xlarge">
                    </div>
                </div>
                <div>
                    <a class="sui-btn btn-block btn-xlarge btn-danger"  href="javascript:checkForm();">登录</a>
                </div>
            </form>
            <div>${msg}</div>
<%--            <div><a href="before">先逛逛</a></div>--%>
        </div>
    </div>
</div>

<!--foot-->
    <div class="py-container copyright">
        <ul>
            <li>关于我们</li>
            <li>联系我们</li>
            <li>联系客服</li>
            <li>商家入驻</li>
            <li>营销中心</li>
            <li>手机尚品购</li>
            <li>销售联盟</li>
            <li>尚品购社区</li>
        </ul>
        <div class="address">地址：杭州市西湖区留和路288号 邮编：310000 电话：111-222-3333 传真：010-1111111</div>
        <div class="beian">京ICP备08001421号京公网安备110108007702
        </div>
    </div>
<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="js/pages/register.js"></script>
</body>

</html>