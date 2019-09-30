<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 Not Found</title>
</head>
<body>
 <h1>两次输入的新密码不一致</h1>
 <span id="totalSecond">3</span>秒后自动返回
</body>
<script language="javascript" type="text/javascript">

    
    var second = document.getElementById('totalSecond').textContent;
    if (navigator.appName.indexOf("Explorer") > -1)  //判断是IE浏览器还是Firefox浏览器，采用相应措施取得秒数
    {
        second = document.getElementById('totalSecond').innerText;
    } else
    {
        second = document.getElementById('totalSecond').textContent;
    }
    setInterval("redirect()", 1000);  //每1秒钟调用redirect()方法一次
    function redirect()
    {
        if (second < 0)
        {
            location.href = 't_teaMessg.jsp';
        } else
        {
            if (navigator.appName.indexOf("Explorer") > -1)
            {
                document.getElementById('totalSecond').innerText = second--;
            } else
            {
                document.getElementById('totalSecond').textContent = second--;
            }
        }
    }
</script>
</html>
