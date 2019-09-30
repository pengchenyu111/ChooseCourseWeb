<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style -->
  <style>

  </style>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../css/font-awesome/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../css/Ionicons/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../css/AdminLTE/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../css/iCheck/square/blue.css">
  <!-- Google Font -->
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../page/index.jsp"><b>学子商城管理系统</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">管理员登录</p>
	<span id="showResult"></span>
    <form method="post">
      <div class="form-group has-feedback">
        <input type="text" name="username" id='name' class="form-control" placeholder="Name">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" id="pwd" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="bt-login" type="button" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <!-- /.social-auth-links -->
    <a href="#">忘记密码？</a><br>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="../../js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../js/iCheck/icheck.min.js"></script>
<!-- page script -->
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
    $('#name').blur(function(){
    	var data = $("#name").val();
        if (data == null || data == "") {
            $("#showResult").text("用户名不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
        $.get('../../admin/validateUsername.do',{username:$('#name').val()},function(obj){
			//console.log(obj);
			if(obj.state==0){
	            $("#showResult").text(obj.message);
	            $("#showResult").css("color","red");
			} else {
				$("#showResult").text("");
			}
        })
      });
    
    
	$('#bt-login').click(function(){
		
		console.log("click");
		
        //异步提交请求，进行验证
       $.ajax({
    	   "url":"${pageContext.request.contextPath}/admin/login.do",
    	   "data":"username="+$("#name").val()+"&password="+$("#pwd").val(),
    	   "type":"POST",
    	   "dataType":"json",
    	   "success":function(obj){
    		   console.log(obj);
    		   if(obj.state==1){
    			   $("#showResult").text("");
    			   location.href="${pageContext.request.contextPath}/admin/showIndex.do";
    		   }else{
					$("#showResult").text(obj.message);
					$("#showResult").css("color","red");
    		   }
    		   
    	   }
       });
    });
    
  });
</script>
</body>
</html>
