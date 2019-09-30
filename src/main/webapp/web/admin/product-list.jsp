<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.User" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>所有商品</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style -->
  <style>

  </style>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../css/font-awesome/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../css/Ionicons/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../css/datatables.net-bs/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../css/AdminLTE/AdminLTE.min.css">
  <!-- AdminLTE Skin -->
  <link rel="stylesheet" href="../css/AdminLTE/skin/skin-blue.min.css">
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
        <li><i class="fa fa-dashboard">&nbsp;商品管理</i></li>
        <li class="active">所有商品</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
                <div class="box box-primary">
                  <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>添加时间</th>
                        <th>商品单价</th>
                        <th>可选操作</th>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
                      <tfoot>
                      <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>添加时间</th>
                        <th>商品单价</th>
                        <th>可选操作</th>
                      </tr>
                      </tfoot>
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
<script src="../js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../js/bootstrap/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../js/datatables.net/jquery.dataTables.min.js"></script>
<script src="../js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../js/AdminLTE/adminlte.min.js"></script>
<!-- moment -->
<script src="../js/moment/moment.min.js"></script>
<!-- page script -->
<script>
 $(function () {
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
     'ajax': 'getAllGoods.do',
     'columns': [
    	    { 'data': 'id' },
    	    { 'data': 'title' },
    	    { 'data': 'createdTime' , 'render': function (data, type, row, meta) {
	    	    	return moment(data).format('YYYY-MM-DD HH:mm:ss');
		    	}
	    	},
    	    { 'data': 'price' , 'render': function (data, type, row, meta) { 
	    	    	var content = null;
	    	    	switch(meta.row%4){
	    	    		case 0:content = '<span class="label bg-yellow">'+data.toFixed(2)+'</span>';break;
	    	    		case 1:content = '<span class="label bg-aqua">'+data.toFixed(2)+'</span>';break;
	    	    		case 2:content = '<span class="label bg-green">'+data.toFixed(2)+'</span>';break;
	    	    		case 3:content = '<span class="label bg-red">'+data.toFixed(2)+'</span>';break;
	    	    	}
	    	    	return content;
    	    	}
    	    },
    	    { 'data': null , 'render': function (data, type, row, meta) { 
    	    		return '<a target="_blank" href="../goods/showGoodsInfo.do?id='+row.id+'&categoryId='+row.categoryId+'">查看</a>丨<a href="#">编辑</a>';
	    		}
    	    }
    	  ],
    	language: {url: '../js/datatables.net/zh-CN.json'}
   })
 })
</script>
</body>
</html>
