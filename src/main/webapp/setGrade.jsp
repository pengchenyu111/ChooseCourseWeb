<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生成绩录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style6.css" />
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript">
				window.onload = function(){
					var tableCont = document.querySelector('#table-cont');
					function scrollHandle(e){
						console.log(this);
						var scrollTop = this.scrollTop;
						this.querySelector('thead').style.transform = 'translateY(' + scrollTop + 'px)';
					}
					tableCont.addEventListener('scroll',scrollHandle);
				}
			</script>
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
		
		<div >
		<form action="setGradewithNo" id="setGradewithNo-form" method="post" name="form1">
			<div id="grade2">
					<%
		  String CCno = (String)session.getAttribute("CCno");
		  String TTname = (String)session.getAttribute("TTname");
		%>
				<table class="table" id="table-cont">
					<thead>
					<tr class="table_header">
						<th>学号</th>
						<th>姓名</th>
						<th>成绩</th>
					</tr>
					</thead>
					
				<%				
					  TeacherDao dao = new TeacherDao();
					  List<Student> Students= dao.getStudentMessage2(CCno ,TTname);	
					  List<Integer> a= dao.getGrade(CCno ,TTname);
							for(int i=0;i<Students.size();i++){
								Student student = Students.get(i);
								String Sno = student.getSno();
								String Sname = student.getSname();
								String Ssex = student.getSsex();
								Integer Sage = student.getSage();
								String ClassNo = student.getClassNo();
								String major = student.getMajor();
								String Scode = student.getScode();
								String Spower = student.getSpower();
								Integer grade = a.get(i);
				%>
					<tr class="row1">
						
						<td><%=Sno %><input type="hidden" value = "<%=Sno %>" name = Sno<%=i %>></td>
						<td><%=Sname %></td>
						<td><input type="text" value="" name = "<%=i %>" ></td>
					</tr>
						<%}%>	
				</table>
			</div>
			
			<div id="grade3">
				<div id="buchong1"></div>
			<input type="submit" value="提交" id="sub1">
			</div>
				</form>
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