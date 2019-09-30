<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.tedu.dao.*,cn.tedu.entity.*,java.util.*" %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="layui/css/layui.css">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stu_home</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"> 
    <link rel="stylesheet" type="text/css" href="css/tableStyle.css"/>
   
    <script type="text/javascript">
    	function display1(id){  
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
    <div class="layui-logo">学生系统欢迎你</div>
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
      <li class="layui-nav-item"><a href="login.jsp" onclick="">退出登录</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed"><a class="" href="selectCourse.jsp">选课</a></li>
        <li class="layui-nav-item"><a href="myCourse.jsp">我的课程</a></li>
        <li class="layui-nav-item"><a href="selectGrade.jsp">成绩查询</a></li>
        <li class="layui-nav-item"><a href="">个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 70px;">
    			<%
           			String userAccount =  (String)session.getAttribute("userAccount");
           			StudentDao dao = new StudentDao();
           			Student student = dao.findOneStudent(userAccount);
           			request.setAttribute("useracct", userAccount);
           		%>
           <div id="">
           		<div id="t_mesg1">
				
				</div>
			<div id="t_mesg3" style="display:none">
					
				<form action="changepwd" method="post">
				<div id="m1">
					<p id="xg1" class="xg">请输入原密码：</p>
					<input type="password" name="ymm"></input>
					<%String msg = (String)request.getAttribute("False"); %>
					<span style="font-size:20px;color:red;"><%=msg==null ? "": msg %></span>
				</div>
				<div id="m2">
					<p id="xg2" class="xg">请输入新密码：</p>
					<input type="password" name="xmm"></input>
					<%String msg2 = (String)request.getAttribute("False2"); %>
					<span style="font-size:20px;color:red;"><%=msg2==null ? "": msg2 %></span>
				</div>
				<div id="m3">
					<p id="xg3" class="xg">请再次输入新密码：</p>
					<input type="password" name="xmm2"></input>
					<%String msg3 = (String)request.getAttribute("success"); %>
					<span style="font-size:20px;color:red;"><%=msg3==null ? "": msg3 %></span>
					
				</div>
				<input type="submit" value="提交" id="submit1" ></input>
				</form>
			</div>
			
			<div id="t_mesg2">
				
				<div id="list1" class="list">
					<ul>
						<li>学号：</li>
						<li>姓名：</li>
						<li>性别：</li>
						<li>年龄：</li>
						<li>专业：</li>
						
					</ul>				
				</div>
				<div id="list2" class="list">
					<ul>
						<li><%=student.getSno() %></li>
						<li><%=student.getSname() %></li>
						<li><%=student.getSsex() %></li>
						<li><%=student.getSage() %></li>
						<li><%=student.getMajor() %></li>
						
					</ul>
				</div>
			</div>
    
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © hfut
  </div>
</div>    
       
   
      
      
       <!-- 放置layui连接 -->
       <script src="layui/layui.js"></script>
       <script>
			layui.use('element', function(){
  			var element = layui.element;
  
});
</script>
</body>
</html>