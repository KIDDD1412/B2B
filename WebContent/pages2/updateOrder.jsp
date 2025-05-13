<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/public/css/layui.css">
    <style>
      body{padding: 16px;}
    </style>
<title>修改订单</title>
</head>
<body>
  <form class="layui-form layui-form-pane1" action="updateOrder" lay-filter="first" enctype="multipart/form-data" method="post"><!-- enctype="multipart/form-data" -->
    <div class="layui-form-item">
      <label class="layui-form-label">订单号</label>
      <div class="layui-input-block">
      <%String oid=request.getParameter("oid"); %>
        <br/>
        <%=oid %> 
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">商品编号</label>
      <div class="layui-input-block">
        <input type="text" id="gid" name="gid" lay-verify="required" lay-reqText="商品编号不能为空" required placeholder="请输入商品编号" value="${order.gid}" class="layui-input" >
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">商品数量</label>
      <div class="layui-input-block">
        <input type="text" id="gamount" name="gamount" lay-verify="required" value="${order.gamount}" class="layui-input demo-phone">
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline" style="width: 100px;">
          <input type="text" id="gprice" name="gprice" placeholder="￥" value="${order.gprice}" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux">此商品优惠前的价格，仅供双方参考</div>
	</div>
	</div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-inline" style="width: 100px;">
          <input type="text" id="oprice" name="oprice" placeholder="￥" value="${order.oprice}" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux">该字段填写内容为您与顾客商议后的总价格，即该订单您的应得金额</div>
	</div>
	</div>
    <div class="layui-form-item">
      <label class="layui-form-label">卖家用户编号</label>
      <div class="layui-input-block">
      <br/>
      ${order.sid}
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">买家用户编号</label>
      <div class="layui-input-block">
        <input type="text" id="bid" name="bid" lay-verify="required"  lay-vertype="alert" value="${order.bid}" class="layui-input">
      </div>
    </div>
    <label for="contract"class="layui-form-label">合同上传</label>

	<input type="file" id="file" name="file" accept=".doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
    <c:if test="${not empty order.contract }"><a href="file/${order.contract}" download="合同.docx" >这里可以下载您上一版本的合同</a><br/><br/></c:if>
    <c:if test="${empty order.contract }"><a href="file/sample.docx" download="合同模板.docx" >您上一版本的订单尚未上传合同，这里为您提供了合同模板</a><br/><br/></c:if>
    <div class="layui-form-item">
      <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
      </div>
    </div>
  </form>

  <br><br><br>


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

  </script>

    </body>

</html>