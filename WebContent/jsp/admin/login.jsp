<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%--%>
<%--    String path = request.getContextPath();--%>
<%--    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--    <base href="<%=basePath%>">--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <title>后台登录</title>--%>
<%--    <style type="text/css">--%>
<%--        table{--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        .textSize{--%>
<%--            width: 120px;--%>
<%--            height: 25px;--%>
<%--        }--%>
<%--        * {--%>
<%--            margin: 0px;--%>
<%--            padding: 0px;--%>
<%--        }--%>
<%--        body {--%>
<%--            font-family: Arial, Helvetica, sans-serif;--%>
<%--            font-size: 12px;--%>
<%--            margin: 10px 10px auto;--%>
<%--            background-image: url('../../public/img/admin/bb.jpg');--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script type="text/javascript">--%>
<%--        //确定按钮--%>
<%--        function gogo(){--%>
<%--            document.forms[0].submit();--%>
<%--        }--%>
<%--        //取消按钮--%>
<%--        function cancel(){--%>
<%--            document.forms[0].action = "";--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form:form action="admin/login" modelAttribute="manager" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><img src="../../public/img/admin/login.gif"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>昵称：</td>--%>
<%--            <td>--%>
<%--                <form:input path="mname" cssClass="textSize"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>密码：</td>--%>
<%--            <td>--%>
<%--                <form:password path="mpassword" cssClass="textSize" maxlength="20"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2">--%>
<%--                <input type="image" src="../../public/img/admin/ok.gif" onclick="gogo()" >--%>
<%--                <input type="image" src="../../public/img/admin/cancel.gif" onclick="cancel()" >--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form:form>--%>
<%--${msg }--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台登录</title>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        //确定按钮
        function gogo(){
            document.forms[0].submit();
        }
        //取消按钮
        function cancel(){
            document.forms[0].action = "";
        }
    </script>
    <link rel="stylesheet" type="text/css" href="/public/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/pages-register.css"/>
    <link rel="stylesheet" type="text/css" href="/public/css/style.css"/>
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="/public/js/base.js"></script>
    <script type="text/javascript" src="/public/js/service/userService.js"></script>
    <script type="text/javascript" src="/public/js/controller/userController.js"></script>
</head>

<body>
<div class="register py-container ">
    <!--注册账号-->
    <div class="registerArea">
        <h3>管理员登陆<span class="go">
                <a href="/before">首页</a>
            </span>
        </h3>

    <!--登录表单，login，uname，upassword-->
        <div class="info"  style="text-align: left;">
            <form:form class="sui-form form-horizontal" action="admin/login" modelAttribute="manager" method="post">
                <table>
                    <tr class="control-group">
                        <td class="control-label">昵 &nbsp; &nbsp; &nbsp;称：</td>
                        <td class="controls">
                            <form:input path="mname" class="input-xfat input-xlarge"/>
                        </td>
                    </tr>
                    <tr class="control-group">
                        <td class="control-label">密 &nbsp; &nbsp; &nbsp;码：</td>
                        <td class="controls">
                            <form:password path="mpassword" class="input-xfat input-xlarge"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a class="sui-btn btn-block btn-xlarge btn-danger" href="javascript:gogo();">登录</a>
                            <a class="sui-btn btn-block btn-xlarge btn-danger" href="javascript:cancel();">取消</a>
                        </td>
                    </tr>
                </table>
            </form:form>
            ${msg}
        </div>
    </div>
</div>
</body>
</html>

