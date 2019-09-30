<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style6.css" />
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript">
    function display1(id){  
        var traget=document.getElementById(id);
   	    if(traget.style.display=="none"){  
            traget.style.display="";  
        }else{  
            traget.style.display="none";  
        }  
   }
    
    function display2(id){  
        var traget=document.getElementById(id);
   	    if(traget.style.display=="none"){  
            traget.style.display="";  
        }else{  
            traget.style.display="none";  
        }  
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
        <dl class="layui-nav-child">
          <dd><a onclick="display1('t_mesg3');">修改密码</a></dd>
          
        </dl>
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
        <li class="layui-nav-item"><a >查询个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<form action="teacher" id="teacher-form" method="post" name="form2">
	
	<div id="top_content">
		
		<div >
			<div id="t_mesg1">
				<p id="t_p1">老师，您好，以下是您的个人信息:</p>
			</div>
			<div id="t_mesg3" style="display:none">
				<div id="m1">
					<p id="xg1" class="xg">请输入原密码：</p>
					<input type="password" name="ymm"></input>
				</div>
				<div id="m2">
					<p id="xg2" class="xg">请输入新密码：</p>
					<input type="password" name="xmm"></input>
				</div>
				<div id="m3">
					<p id="xg3" class="xg">请再次输入新密码：</p>
					<input type="password" name="xmm2"></input>
				</div>	
				<input type="submit" value="提交" id="submit1">
			</div>
		<%
		  String Tno = (String)session.getAttribute("name");
		%>
			<div id="t_mesg2">
				
				<div id="list1" class="list">
					<ul>
						<li>教工号：</li>
						<li>姓名：</li>
						<li>性别：</li>
						<li>年龄：</li>
						<li>职位：</li>
						
					</ul>				
				</div>
				
				<%				
					  TeacherDao dao = new TeacherDao();
					  Teacher teacher= dao.findOneTeacher(Tno);	
						String Tname = teacher.getTname();
						String Tsex = teacher.getTSex();
						Integer Tage = teacher.getTage();
						String Tposition = teacher.getTposition();
						String Tcode = teacher.getTcode();
						String Tpower = teacher.getTpower();
				%>
				
				<div id="list2" class="list">
					<ul>
						<li><%=Tno %></li>
						<li><%=Tname %></li>
						<li><%=Tsex %></li>
						<li><%=Tage %></li>
						<li><%=Tposition %></li>
						
					</ul>
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