<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/20
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table{
        margin : 200px auto;
        font-size: 18px;
        text-align:center;
        border-collapse: collapse;
    }
    td{
        padding:4px 8px;
        border:1px solid black;
    }
</style>
<body>
<table>
    <tr style="font-size:18px">
        <td>id</td>
        <td>username</td>
        <td>userid</td>
        <td>date</td>
        <td>score</td>
    </tr>
    <c:forEach items="${requestScope.list}" var="examHistory">
        <tr>
            <td>${examHistory.id}</td>
            <td>${examHistory.username}</td>
            <td>${examHistory.userid}</td>
            <td>${examHistory.date}</td>
            <td>${examHistory.score}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
