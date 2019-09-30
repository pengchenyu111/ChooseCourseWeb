<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生选课信息查询</title>
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
    	<form action="setgrade" id="setgrade-form" method="post" name="form2">
	<div id="top_content">
		
		<div >
			<div id="t_sea_stu2">
				<table class="table">
					<thead>
						<tr class="table_header">
							<th>课程号</th>
							<th>课程名</th>
						</tr>
					</thead>
					<tbody>
					
		<%
		  String Tno = (String)session.getAttribute("name");
		%>
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
							</tr>
							<%
								}
							%>
					</tbody>
				</table>
			</div>
			<div id="t_sea_stu1">
				<div id="t_sea_inp1">
					<dev id="t_s1">
						<p>---根据课程号录入成绩---</p>
					</dev>
					<dev id="t_s2">
						<input type="text" value=""  name="button1">
					</dev>
				</div>
				<div id="t_sea_inp2">
					<dev id="t_s3">
						<p>---根据课程名录入成绩---</p>
					</dev>	
					<dev id="t_s4">
						<input type="text" value=""  name="button2">
					</dev>
					<dev id="t_s5">
						<input type="submit" value="进入成绩单"  id="submit2">
					</dev>
				</div>
			</div>
		</div>
	</div>
	</form>
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