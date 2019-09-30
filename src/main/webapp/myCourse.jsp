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
    <link rel="stylesheet" href="layui/css/layui.css">
    <title>stu_home</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/tableStyle.css"/>
    
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    function totalCredit(){
		var total = 0;
		$("table:last tr").each(function(){
			var credit = parseFloat($(this).children().eq(2).text());
			if(!isNaN(credit)){
				total += credit;
			}
			
		});
		alert("总学分为："+total);
	}	
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
        
        <dl class="layui-nav-child">
          
        </dl>
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed"><a  href="selectCourse.jsp">选课</a></li>
        <li class="layui-nav-item"><a href="">我的课程</a></li>
        <li class="layui-nav-item"><a href="selectGrade.jsp">成绩查询</a></li>
        <li class="layui-nav-item"><a href="stu_home.jsp">个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<div id="content"> 
           <div id="">
           		 <div id="content1">
					<p id="whereami">
					</p>
					<h1>
						我的课程
					</h1>
					<table class="table">
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
							<td>操作</td>
						</tr>
						<%
							String userAccount =  (String)session.getAttribute("userAccount");
	           				StudentDao dao = new StudentDao();
	           				CourseDao cdao = new CourseDao();
	           				Student student = dao.findOneStudent(userAccount);
	           				List<Course> courses = cdao.findStuCourses(student.getSno());
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
								<td>
									<a href="quitcourse?userAccount=<%=student.getSno() %>&CourseNo=<%=CourseNo%>">退课</a>&nbsp;
								</td>
							</tr>
							<%
								}
							%>
							</table>
						</div>
						<div id="total">
							<p id="total_p" onclick="totalCredit()">查看总学分</p>
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