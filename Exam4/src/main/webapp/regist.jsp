<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/15
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="regist.do" method="post" enctype="multipart/form-data">
        用户名：<input name="login_name"><br>
        头像：<input type="file" name="file"><br>
        姓名：<input name="user_name"><br>
        密码：<input name="password" type="password"><br>
        email：<input name="email"><br>
        电话号码：<input name="tel"><br>
        <input type="submit" value="注册">
    </form>
</body>
</html>
