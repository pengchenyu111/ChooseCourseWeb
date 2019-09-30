<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>教师界面</title>
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
        <li><i class="fa fa-dashboard">&nbsp;教师</i></li>
        <li class="active">教师信息</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
                <div class="box box-primary">
                  <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>教师工号</th>
                        <th>教师姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>职称</th>
                        <th>密码</th>
                        <th>权限</th>
                        <th>操作</th>
                      </tr>
                      </thead>
                     
                      <tfoot>
                      <tr>
                        <th>教师工号</th>
                        <th>教师姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>职称</th>
                        <th>密码</th>
                        <th>权限</th>
                        <th>操作</th>
                      </tr>
                      </tfoot>
                      <%
							//List<Course> courses = (List<Course>)request.getAttribute("courses");
					  		TeacherDao dao = new TeacherDao();
					  		List<Teacher> teachers = dao.FindAllTeachers();
							for(int i=0;i<teachers.size();i++){
								Teacher teacher = teachers.get(i);
								String Tno = teacher.getTno();
								String Tname = teacher.getTname();
								String TSex = teacher.getTSex ();
								int Tage = teacher.getTage();
								String Tposition = teacher.getTposition();
								String Tcode = teacher.getTcode();
								String Tpower = teacher.getTpower();
						%>
							<tr class="row<%=i%2+1%>">
								<td><%=Tno %></td>
								<td><%=Tname %></td>
								<td><%=TSex %></td>
								<td><%=Tage %></td>
								<td><%=Tposition %></td>
								<td><%=Tcode %></td>
								<td><%=Tpower %></td>
								<td>
									<a href="del1?Tno=<%=Tno%>">删除</a>&nbsp;
								</td>
							</tr>
							<%
								}
							%>
                    </table>
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
<!-- page script -->

</body>
</html>
