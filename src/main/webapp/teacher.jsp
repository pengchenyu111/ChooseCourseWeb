<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师管理端</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style6.css" />
<link rel="stylesheet" href="layui/css/layui.css">
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">教师系统欢迎你</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          欢迎您
        </a>
        
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed"><a class="" href="t_searchCla.jsp">查询选课信息</a></li>
        <li class="layui-nav-item"><a href="t_searchStu.jsp">查询学生信息</a></li>
        <li class="layui-nav-item"><a href="t_grade.jsp">录入学生成绩</a></li>
        <li class="layui-nav-item"><a href="t_teaMessg.jsp">查询个人信息</a></li>
      </ul>
    </div>
  </div>
  
  
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © hfut
  </div>
</div>
		
		
<script src="layui/layui.js"></script>
<script>
layui.use('element', function(){
  var element = layui.element;
  
});
</script>		
</body>
</html>