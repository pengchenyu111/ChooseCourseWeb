<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加商品</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- page style -->
<style>
.my-input {
	width: 33.33333333% !important;
}

.my-input-file {
	display: inline-block !important;
	width: 0;
	position: absolute;
	clip: rect(0px, 0px, 0px, 0px);
}

.datepicker {
	z-index: 9999 !important;
}
</style>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../../css/font-awesome/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="../../css/Ionicons/ionicons.min.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="../../css/bootstrap-datepicker/bootstrap-datepicker.min.css">
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
				<h1>
					<small></small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard">&nbsp;商品管理</i></li>
					<li class="active">添加商品</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content container-fluid">
				<!-- Horizontal Form -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">信息录入</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form class="form-horizontal" id="fm-add" role="form" action=""
						method="post" enctype="multipart/form-data">
						
						<input type="hidden" name="createdUser" value="${admin.username}"/>
						
						<div class="box-body">
							<div class="form-group">
								<div class="col-sm-10 my-input">
									
									<select class="form-control" name="cat1Id" 
												id="cat1" 
												onchange="getCat2Category(this.value, -1, -1)">
										<option selected>选择商品类别</option>
									</select>
								</div>
								<div class="col-sm-10 my-input">
									<select class="form-control" name="cat2Id" id="cat2"
												onchange="getCat3Category(this.value, -1)">
										<option selected>选择商品子类别</option>
									</select>
								</div>
								<div class="col-sm-10 my-input">
									<select class="form-control" name="categoryId" id="cat3">
										<option selected>选择商品子类别</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="title" id="title"
										placeholder="商品标题">
								</div>
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="sellPoint" id="sellPoint"
										placeholder="商品销售卖点 副标题">
								</div>
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="price"
										id="price" placeholder="单价">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="num" id="num"
										placeholder="商品上架数量 库存">
								</div>
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="barcode" id="barcode"
										placeholder="商品条形码">
								</div>
								<div class="col-sm-10 my-input">
									<input type="text" class="form-control" name="spec" id="spec"
										placeholder="商品规格简要描述">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 my-input">
									<label for="index" class="btn btn-default">索引图</label>
									<input type="file" name="index" id="index" class="my-input-file">
									<span id="indexfile">只支持: .jpg .jpeg .png格式</span>
								</div>
								<div class="col-sm-10 my-input">
									<label for="detail1" class="btn btn-default">详图 1</label> 
									<input type="file" name="detail1" id="detail1" class="my-input-file">
									<span id="detail1file"></span>
								</div>
								<div class="col-sm-10 my-input">
									<label for="detail2" class="btn btn-default">详图 2</label>
									<input type="file" name="detail2" id="detail2" class="my-input-file">
									<span id="detail2file"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 my-input">
									<label for="detail3" class="btn btn-default">详图 3</label>
									<input type="file" name="detail3" id="detail3" class="my-input-file">
									<span id="detail3file"></span>
								</div>
								<div class="col-sm-10 my-input">
									<label for="detail4" class="btn btn-default">详图 4</label>
									<input type="file" name="detail4" id="detail4" class="my-input-file">
									<span id="detail4file"></span>
								</div>
								<div class="col-sm-10 my-input">
									<label for="detail5" class="btn btn-default">详图 5</label>
									<input type="file" name="detail5" id="detail5" class="my-input-file">
									<span id="detail5file"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="editor">商品详细描述信息</label>
								<textarea class="form-control" rows="3" name="detail" id="editor"
											placeholder="商品详细描述信息"></textarea>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
									<span id="info"></span>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" id="bt-submit" class="btn btn-primary pull-right">提交</button>
						</div>
						<!-- /.box-footer -->
					</form>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">缔造年轻人的中国梦</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2021 <a href="http://www.tedu.cn">达内教育</a>.
			</strong> All rights reserved.
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
	<!-- bootstrap datepicker -->
	<script src="../../js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="../../js/bootstrap-datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../js/AdminLTE/adminlte.min.js"></script>
	
	<!-- kindeditor-4.1.11富文本编辑器 -->
	<link  href="../../js/kindeditor-4.1.11/themes/default/default.css" rel="stylesheet"/>
	<script charset="utf-8" src="../../js/kindeditor-4.1.11/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="../../js/kindeditor-4.1.11/lang/zh-CN.js"></script>
	
	
	<!-- page script -->
	<script type="text/javascript">
		

		
	
		//查询被选中类别中的子类别
		function getCat1Category(cat1Id, cat2Id, cat3Id){
			console.log(cat1Id);
			
			$.ajax({
				"url":"getCategoryByParentId.do",
				"data":"parentId=" + cat1Id,
				"type":"GET",
				"dataType":"json",
				"success":function(obj){
					console.log(obj.state);
					console.log(obj);
					
					$("#cat1").html("<option value='0'>--选择商品类别--</option>");
					for(var i = 0;i<obj.data.length;i++){
						var str="<option value="+obj.data[i].id+">"+obj.data[i].name+"</option>";
						$("#cat1").append(str);
					}
					if(cat1Id!=-1){
						$("#cat1").val(cat1Id);
					}
					
				}
							
			});
			
			getCat2Category(cat1Id, cat2Id, cat3Id);
		}
	
		//页面加载完毕后，立即加载商品的大类别
		$(function(){
			getCat1Category(0,-1,-1);
		});
		
		function getCat2Category(cat1Id, cat2Id, cat3Id){
			if(cat1Id==0){
				return;
			}
			
			console.log(cat2Id);
			
			$.ajax({
				"url":"getCategoryByParentId.do",
				"data":"parentId=" + cat1Id,
				"type":"GET",
				"dataType":"json",
				"success":function(obj){
					console.log(obj.state);
					console.log(obj);
					
					$("#cat2").html("<option value='-1'>--选择商品类别--</option>");
					for(var i = 0;i<obj.data.length;i++){
						var str="<option value="+obj.data[i].id+">"+obj.data[i].name+"</option>";
						$("#cat2").append(str);
					}
					//if(cat2Id!=-1){
						$("#cat2").val(cat2Id);
					//}
					
				}
							
			});
			
			getCat3Category(cat2Id, cat3Id);
		}
		
		function getCat3Category(cat2Id, cat3Id){
			
			
			console.log(cat3Id);
			
			$.ajax({
				"url":"getCategoryByParentId.do",
				"data":"parentId=" + cat2Id,
				"type":"GET",
				"dataType":"json",
				"success":function(obj){
					console.log(obj.state);
					console.log(obj);
					
					$("#cat3").html("<option value='-1'>--选择商品类别--</option>");
					for(var i = 0;i<obj.data.length;i++){
						var str="<option value="+obj.data[i].id+">"+obj.data[i].name+"</option>";
						$("#cat3").append(str);
					}
					//if(cat3Id!=-1){
						$("#cat3").val(cat3Id);
					//}
					
				}
							
			});
			
		}
		

		//判断获取是哪个浏览器，目前safari测试不稳定，其他ie chrome浏览器测试正常，文件上传功能
		//safari测试时，需要将所有上传文件设置值，并要求上传文件较小图片
		var userAgent = navigator.userAgent; 
		var browser = navigator.appName;
		/**判断是否是IE浏览器*/
		if(browser=="Microsoft Internet Explorer") {
			//$(".my-input-file").removeClass();
		}
		/**判断是否是safari*/
		if(/Safari/.test(navigator.userAgent) 
				&& !/Chrome/.test(navigator.userAgent)){
			//alert("是safari");
		}
		
		
		$('#index').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			// var fileExt = str.substring(str.lastIndexOf('.') + 1);
			// alert(fileName);
			$('#indexfile').html(fileName);
		});

		$('#detail1').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			$('#detail1file').html(fileName);
		});

		$('#detail2').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			$('#detail2file').html(fileName);
		});

		$('#detail3').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			$('#detail3file').html(fileName);
		});

		$('#detail4').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			$('#detail4file').html(fileName);
		});
		
		$('#detail5').change(function() {
			var str = $(this).val();
			var fileName = str.substring(str.lastIndexOf("\\") + 1);
			$('#detail5file').html(fileName);
		});

		var editor;
		KindEditor.ready(function(K) {
            editor = K.create('#editor', {
                uploadJson : '../../image/uploadImg.do',// 上传图片接口
                filePostName: 'imgFile',// name属性默认值
                afterBlur: function(){this.sync();}//将编辑器的内容设置到原来的textarea控件里
        	});
            //通过js的 submit()提交则为空值，解决办法就是在初始化kindeditor时加入一行代码：
			//afterBlur: function(){this.sync();}
            //这行代码的意思就是在textarea失去焦点之后执行this.sync();
            //这个函数就是同步KindEditor的值到textarea文本框。
            //官方解释：sync()：将编辑器的内容设置到原来的textarea控件里
 		});
		$('#bt-submit').click(function() {
			//读取用户的输入——表单序列化
			var formData = new FormData($('#fm-add').get(0));
			//console.log( editor.html() );

			//异步提交请求，进行验证
			$.ajax({
				async : true,
				type : 'POST',
				url : 'addGoods.do',
				data : formData,
				processData : false,// 不对数据进行转换
				contentType : false,// 避免jQuery对contentType操作，失去请求头分界符，使服务器不能正常解析文件
				success : function(obj) {
					
					if (obj.state==1) { //成功
						alert("添加成功！");
						window.location.href = "toAddGoods.do";
					} else { //失败
						$('#info').html('添加失败！');
						$("#info").css("color", "red");
						$('#bt-submit').attr("disabled", false);
					}
				}
			});
			$('#bt-submit').attr("disabled", true);
			
		});
	</script>
</body>
</html>
