<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登陆页面</title>
    <link href="css/header.css" rel="stylesheet"/>
    <link href="css/login.css" rel="stylesheet"/>
</head>
<body>
<!-- 页面顶部-->
<header id="top">
    <div class="top">
        <img src="../images/header/header.jpg" alt=""/>
        <span>欢迎登录</span>
    </div>
</header>
<div id="container">
    <div id="cover" class="rt">
        <form action="login" id="login-form" method="post" name="form1">
            <div class="txt">
                <p>
					登录选课系统
                </p>
                <div class="text">
                    <input type="text" placeholder="请输入您的用户名" name="name" id="username" required>
                    <span><img src="images/login/yhm.png"></span>
                   	<span></span>
                </div>   
                <div class="text">
                    <input type="password" id="password" placeholder="请输入您的密码" name="pwd" required minlength="6" maxlength="15">
                    <span><img src="images/login/mm.png"></span>
                    <%String msg = (String)request.getAttribute("login_failed"); %>
					<span style="font-size:20px;color:red;"><%=msg==null ? "": msg %></span>
                </div>
                <input class="button_login" type="submit" value="登  录" id="bt-login"/>
            </div>
        </form>
    </div>
</div>
<!--错误提示-->
<div id="showResult"></div>

<script src="js/jquery-3.1.1.min.js"></script>
<script>
    $("#username").blur(function(){
        var data = $("#username").val();
        if (data == null || data == "") {
            $("#showResult").text("用户名不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
    });
</script>
</body>
</html>