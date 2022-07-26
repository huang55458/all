<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/25
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/startExam.form">开始考试</a><br/>
<a href="http://localhost:8080/denglu.do?userId=${sessionScope.user.id}">交友</a><br/>
<a href="/welcome.form">个人中心</a><br/>
</body>
</html>
