<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.User" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改密码</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style -->
  <style>
  .my_content{
    padding: 9% 30%;
    height: 60%;
    /*background: #f00;*/
  }
  </style>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../css/font-awesome/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../css/Ionicons/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../css/AdminLTE/AdminLTE.min.css">
  <!-- AdminLTE Skin -->
  <link rel="stylesheet" href="../../css/AdminLTE/skin/skin-blue.min.css">
  <!-- Google Font -->
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <jsp:include page="header.jsp"></jsp:include>
  
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="left.jsp"></jsp:include>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1><small></small></h1>
      <ol class="breadcrumb">
        <!-- <li><a href="#"><i class="fa fa-dashboard"></i> </a></li> -->
        <!-- <li class="active"></li> -->
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
      <div class="my_content">
        <!-- Horizontal Form -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">修改密码</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form class="form-horizontal" method="post" action="../../action/password-change.jsp">
            <input type="hidden" name="user.uname" id="cpassword" value="<%=((User)session.getAttribute("user")).getUsername() %>" >
            <div class="box-body">
              <div class="form-group">
                <div class="col-sm-10">
                  <input type="password" name="user.upwd" class="form-control" id="cpassword" placeholder="Current Password">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <input type="password" name="npwd" class="form-control" id="npassword" placeholder="New Password">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <input type="password" name="cpwd" class="form-control" id="cnpassword" placeholder="Confirm New Password">
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary pull-right">提交</button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      缔造年轻人的中国梦
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2021 <a href="http://www.tedu.cn">达内教育</a>.</strong> All rights reserved.
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="../../js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../js/AdminLTE/adminlte.min.js"></script>
<!-- page script -->
<script>

</script>
</body>
</html>
