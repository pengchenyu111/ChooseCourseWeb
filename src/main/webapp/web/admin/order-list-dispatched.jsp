<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>已发货订单</title>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="../../css/datatables.net-bs/dataTables.bootstrap.min.css">
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
        <li><i class="fa fa-dashboard">&nbsp;课程</i></li>
        <li class="active">课程信息</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
                <div class="box box-primary">
                  <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>学分</th>
                        <th>课程种类</th>
                        <th>课程时间地点</th>
                        <th>课程时长</th>
                        <th>课程开始年份</th>
                        <th>课程开始学期</th>
                        <th>课程已选人数</th>
                        <th>课程最大人数</th>
                        <th>课程教材</th>
                        <th>课程编号</th>
                        <th>操作</th>
                      </tr>
                      </thead>
                     
                      <tfoot>
                      <tr>
                       <th>课程号</th>
                        <th>课程名</th>
                        <th>学分</th>
                        <th>课程种类</th>
                        <th>课程时间地点</th>
                        <th>课程时长</th>
                        <th>课程开始年份</th>
                        <th>课程开始学期</th>
                        <th>课程已选人数</th>
                        <th>课程最大人数</th>
                        <th>课程教材</th>
                        <th>课程编号</th>
                        <th>操作</th>
                      </tr>
                      </tfoot>
                      <%
	           				CourseDao dao = new CourseDao();
	           				List<Course> courses = dao.findAllCourses();
	           				for(int i=0;i<courses.size();i++){
								Course course = courses.get(i);
								String CourseNo = course.getCourseNo();
								String CourseName = course.getCourseName();
								String CourseCredit = course.getCourseCredit();
								String CourseType = course.getCourseType();
								String CourseTimePlace = course.getCourseTimePlace();
								Integer CourseHour = course.getCourseHour();
								String CourseStartYear = course.getCourseStartYear();
								String CourseStartTerm = course.getCourseStartTerm();
								Integer CourseMaxnum = course.getCourseMaxnum();
								Integer CourseChoosennum= course.getCourseChoosennum();
								String CourseTextbook = course.getCourseTextbook();
								String CourseCode = course.getCourseCode();
							%>
						<tr class="row<%=i%2+1%>">
								<td><%=CourseNo %></td>
								<td><%=CourseName %></td>
								<td><%=CourseCredit %></td>
								<td><%=CourseType %></td>
								<td><%=CourseTimePlace %></td>
								<td><%=CourseHour %></td>
								<td><%=CourseStartYear %></td>
								<td><%=CourseStartTerm %></td>
								<td><%=CourseChoosennum %></td>
								<td><%=CourseMaxnum %></td>
								<td><%=CourseTextbook %></td>
								<td><%=CourseCode %></td>
								<td>
									<a href="choose?CourseNo=<%=CourseNo%>">删除</a>&nbsp;
									<a href="choose?CourseNo=<%=CourseNo%>">修改</a>&nbsp;
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
<!-- DataTables -->
<script src="../../js/datatables.net/jquery.dataTables.min.js"></script>
<script src="../../js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../js/AdminLTE/adminlte.min.js"></script><!-- moment -->
<script src="../../js/moment/moment.min.js"></script>
<!-- page script -->
<!-- 
<script>
 $(function () {
   var url = 'getAllOrders.do';
   
   var href = window.location.href;   
   var index = href.indexOf("?shippingStatus="); //-1表示没查找到
   if(index!=-1){
	   var arg = href.substring(index, href.length);
	   url += arg;
   }
   
   $('#my_order').DataTable({
     'paging'      : true,
     'lengthChange': false,
     'searching'   : false,
     'ordering'    : false,
     'info'        : true,
     'autoWidth'   : false,
     'pagingType': 'full_numbers',
     'processing': true,
     'serverSide': true,
     'ajax': url,
     'columns': [
    	    { 'data': 'orderid' },// 订单编号219
    	    { 'data': 'shippingStatus' , 'render': function (data, type, row, meta) { 
    	    	var content = null;
    	    	//订单发货状态（订单等待商家处理待处理-0，处理中-1，已发货-2，已交付-3，已退货-4）
    	    	//switch(data){
    	    	//	case 0:content = '<span class="label bg-red">待处理</span>';break;
    	    	//	case 1:content = '<span class="label bg-yellow">处理中</span>';break;
    	    	//	case 2:content = '<span class="label bg-aqua">已发货</span>';break;
    	    	//	case 3:content = '<span class="label bg-green">已交付</span>';break;
    	    	//	case 4:content = '<span class="label bg-green">已退货</span>';break;
    	    	//	case 5:content = '<span class="label bg-green">已取消</span>';break;
    	    	}
    	    	return content;
		      }
		    },// 订单状态<span class="label bg-red">已交付</span>
    	    { 'data': 'tradetime' , 'render': function (data, type, row, meta) { 
	    	    	return moment(data).format('YYYY-MM-DD HH:mm');
		    	}
	    	},// 创建时间2014-11-7 11:31
    	    { 'data': 'payment' , 'render': function (data, type, row, meta) { 
	    	    	return '￥'+data.toFixed(2);
    	    	}
    	    },// 订单总额￥10.70
    	    { 'data': 'status' , 'render': function (data, type, row, meta) { 
    	    	var content = '<a href="showOrderInfo.do?orderid='+row.orderid+'">查看</a>丨';
    	    	if(data=='5'){
    	    		content+='处理';
    	    	}else{
    	    		content+='<a href="showOrderProcess.do?orderid='+row.orderid+'">处理</a>';
    	    	}
    	    	return content;
	    	  }
	    	}// 可选操作<a href="#">查看</a>丨处理
    	  ],
        language: {url: '../../js/datatables.net/zh-CN.json'}
   })
 })
</script>
 -->
</body>
</html>
