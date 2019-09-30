<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选课信息查询</title>
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
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<div id="top_content">
		
		
	
		<%
		  String Tno = (String)session.getAttribute("name");
		%>
		<div >
			<div id="seaCla1">
				<div>
					<table class="table" >
						<tr class="table_header">
							<td>课程号</td>
							<td>课程名</td>
							<td>学分</td>
							<td>类型</td>
							<td>时间及地点</td>
							<td>课时</td>
							<td>开设学年</td>
							<td>开设学期</td>
							<td>已选人数</td>
							<td>最大容量</td>
							<td>教材</td>
						</tr>
					  <%				
					  TeacherDao dao = new TeacherDao();
					  List<Course> Courses= dao.getCourseMessage(Tno);	
							for(int i=0;i<Courses.size();i++){
								Course course = Courses.get(i);
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