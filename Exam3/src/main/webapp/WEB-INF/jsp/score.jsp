<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/18
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body {
        margin:0;
        padding:0;
        font-family: 楷体,sans-serif;
        background: linear-gradient(#141e30, #243b55);
        color: #fff;
    }
</style>
<style>
    div{
        width: 200px;
        margin: 200px auto;
        font-size: 30px;
    }
</style>
<body>
<div>
    <span>你的得分为${requestScope.score}</span>
    <button onclick="location.href='/frontPage.form'">返回首页</button>
</div>
</body>
</html>
