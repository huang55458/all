<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/16
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.getAttribute("login_name");
//    request.getRequestDispatcher("/user/userInfo.jsp").forward(request,response);

%>
<form action="/user/mod.do" method="post">
    编号：${user.id}<br>
    登录名：<input type="text" name = "login_name" value="${user.login_name}"><br>
    密码：<input type="text" name = "password" value="${user.password}"><br>
    电话：<input type="text" name="tel" value="${user.tel}"><br/>
    邮箱：<input type="text" name="email" value="${user.email}"><br/>
    <input type="submit" value="修改"/><br>
</form>




</body>
</html>
