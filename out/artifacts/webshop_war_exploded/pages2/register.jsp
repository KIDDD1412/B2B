<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <title>个人注册</title>
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
		var password = document.registerForm.upassword.value;
		var repassword = document.registerForm.repassword.value;
		if(password != repassword){
			alert("两次密码不一致！");
			return false;
		}
		document.registerForm.submit();
		return true;
	}
</script>

</head>

<body ng-controller="userController">
<div class="register py-container ">
    <!--register-->
    <div class="registerArea">
        <h3>注册新用户<span class="go">我有账号，去<a href="pages2/login.jsp">登陆</a></span></h3>
        <div class="info">
            <form id="registerForm" class="sui-form form-horizontal" action="${pageContext.request.contextPath }/register" name="registerForm"method="post">
                <div class="control-group">
                    <label class="control-label">用户名：</label>
                    <div class="controls">
                        <input type="text" placeholder="请输入你的用户名" ng-model="entity.username"
                               class="input-xfat input-xlarge" name="uname">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">登录密码：</label>
                    <div class="controls">
                        <input type="password" placeholder="设置登录密码" name="upassword"class="input-xfat input-xlarge">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">确认密码：</label>
                    <div class="controls">
                        <input type="password" placeholder="再次确认密码"name="repassword" class="input-xfat input-xlarge">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">身份证号：</label>
                    <div class="controls">
                        <input type="text" placeholder="请输入身份证号"name="uidcard" class="input-xfat input-xlarge">
                    </div>
                </div>
                <div>
                    <label class="control-label">验证码：</label>
                    <div class="controls">
                        <input type="text" placeholder="验证码" name="code" class="input-xfat input-xlarge">   </div>           	
							<div class="controls">
							<img id="code" src="validateCode" /> 
							<a href="javascript:refreshCode();"><font color="blue">换一个</font></a>
							<div>${codeError}</div>
								
							
                    </div>
                </div>
                <div>
                    
                    <a class="sui-btn btn-block btn-xlarge btn-danger"  href="javascript:checkForm();">完成注册</a>
                </div>
            </form>
            <div>${msg}</div>
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