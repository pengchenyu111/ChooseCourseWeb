<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>订单详情</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style-->
  <style>
  .my_itemtitle{
    font-size: 20px;
  }
  .my_info{
    width: 50% !important;
  }
  .my_print{
    text-align: right;
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
        <li><i class="fa fa-dashboard">&nbsp;订单管理</i></li>
        <li><a href="order-list.html"><i class="fa"></i>所有订单</a></li>
        <li class="active">查看订单</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa"></i>订单详情
            <small class="pull-right">日期: <jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now }" pattern="yyyy.MM.dd HH:mm:ss"/></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col my_info">
            <b class="my_itemtitle">收件人</b><br>
            <br>
            <b>姓名：</b>${orderInfo.recvName}<br>
            <b>地址：</b>${orderInfo.recvDistrict}${orderInfo.recvAddr}
            	<c:if test="${!empty orderInfo.recvZip}">
            		(邮编：${orderInfo.recvZip})
            	</c:if>
            	<br>
            <b>电话：</b>${orderInfo.recvPhone} ${orderInfo.recvTel}<br>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col my_info">
          <b class="my_itemtitle">#${orderInfo.orderid }</b><br>
          <br>
          <b>创建时间：</b><fmt:formatDate value="${orderInfo.tradetime}" pattern="yyyy.MM.dd HH:mm:ss"/><br>
          <b>订单总额：</b>￥${orderInfo.payment}<br>
          <b>付款状态：</b><span id="paymentStatus"></span><br>
          <b>发货状态：</b><span id="shippingStatus"></span><!-- ${orderInfo.shippingStatus} -->
        </div>
        <!-- /.col -->
      </div>
      <hr>
      <!-- /.row -->
      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>序号</th>
              <th>名称</th>
              <th>数量</th>
              <th>规格</th>
              <th>单价</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${orderInfo.listItems}" varStatus="s">
            <tr>
              <td>${s.count}</td>
              <td>${item.title }</td>
              <td>${item.count }</td>
              <td>${item.spec }</td>
              <td>￥${item.price }</td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <hr>
      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12 my_print">
          <a href="printOrder.do?orderid=${orderInfo.orderid}" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
        </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
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
<!-- FastClick -->
<script src="../../js/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../js/AdminLTE/adminlte.min.js"></script>
<!-- page script -->
<script src="../../js/common.js"></script>
<script>
$(function(){
	$("#paymentStatus").html(getPaymentStatusName( ${orderInfo.paymentStatus} ));
	$("#shippingStatus").html(getShippingStatusName( ${orderInfo.shippingStatus} ));
});
</script>
</body>
</html>
