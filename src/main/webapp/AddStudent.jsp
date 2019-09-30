<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>增加教师界面</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style -->
  <style>

  </style>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/Ionicons/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="css/datatables.net-bs/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE/AdminLTE.min.css">
  <!-- AdminLTE Skin -->
  <link rel="stylesheet" href="css/AdminLTE/skin/skin-blue.min.css">
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
        <li><i class="fa fa-dashboard">&nbsp;学生</i></li>
        <li class="active">学生信息</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
                <div class="box box-primary">
                  <div class="box-body">
                  <form action="addstudent" method="post">
                            <table cellpadding="0" cellspacing="0" border="0"
                                class="form_table">
                                <tr>
                                    <td valign="middle" align="right">
                                        学生学号:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="sno" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                       学生姓名：
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="name" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        性别:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="sex" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        年龄:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="age" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        班级号:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="class" />
                                    </td>
                                </tr>
                                <tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        专业:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="major" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        密码:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="pwd" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="right">
                                        权限:
                                    </td>
                                    <td valign="middle" align="left">
                                        <input type="text" class="inputgri" name="power" />
                                    </td>
                                </tr>
                            </table>
                            <p>
                                <input type="submit" class="button" value="Confirm" />
                            </p>
                        </form>
                  </div>
                  <!-- /.box-body -->
                </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      合肥工业大学的发展梦
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2021 <a href="http://www.tedu.cn">合肥工业大学</a>.</strong> All rights reserved.
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="js/datatables.net/jquery.dataTables.min.js"></script>
<script src="js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="js/AdminLTE/adminlte.min.js"></script><!-- moment -->
<script src="js/moment/moment.min.js"></script>

</body>
</html>
