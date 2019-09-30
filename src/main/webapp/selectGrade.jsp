<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>stu_home</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/tableStyle.css"/>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    	
    </script>
</head>
<body class="layui-layout-body">
       <div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">学生系统欢迎你</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        
        
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed"><a >选课</a></li>
        <li class="layui-nav-item"><a href="myCourse.jsp">我的课程</a></li>
        <li class="layui-nav-item"><a href="selectGrade.jsp">成绩查询</a></li>
        <li class="layui-nav-item"><a href="stu_home.jsp">个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<div id="content">        
           
           		<%
           			String userAccount =  (String)session.getAttribute("userAccount");
           			StudentDao dao = new StudentDao();
           			Student student = dao.findOneStudent(userAccount);
           		%>
           <div id="">
           		 <div id="content">
					<p id="whereami"></p>
					<h1>
						成绩详情
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>课程号</td>
							<td>课程名</td>
							<td>学分</td>
							<td>类型</td>
							<td>成绩</td>
						</tr>
						<%
							String useraccount =  (String)session.getAttribute("userAccount");
	           				CourseDao cdao = new CourseDao();
	           				List<SC> scs = cdao.findSCDetails(useraccount);
	           				
	           				for(int i=0;i<scs.size();i++){
	           					SC sc = scs.get(i);
	           					String CourseNo = sc.getCourseNo();
	           					String CourseName = sc.getCourseName();
	           					double CourseCredit = sc.getCourseCredit();
	           					String CourseType = sc.getCourseType();
	           					int grade = sc.getGrade();
								
							%>
						<tr class="row<%=i%2+1%>">
								<td><%=CourseNo %></td>
								<td><%=CourseName %></td>
								<td><%=CourseCredit %></td>
								<td><%=CourseType %></td>
								<td><%=grade %></td>
							</tr>
							<%
								}
							%>
							</table>
					</div> 
           </div>
           
       </div>
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