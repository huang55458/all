<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/15
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>欢迎界面</title>
</head>
<body>
<%--<c:forEach items="${user}" var="user">--%>
<%--<h3>111${user.user_name}</h3>--%>
<%--</c:forEach>--%>
${user.login_name}登录成功!
<p>欢迎来到在线考试系统</p>
</body>
</html>
