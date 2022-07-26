<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/23
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${allUser}" var="user" varStatus="i">
    <c:if test="${user.id!=userId}">
        <div class="account-item">
            <div class="me-2 bg-white shadow-sm rounded-4 p-3 user-list-item d-flex justify-content-center my-2">
                <div class="text-center">
                    <div class="position-relative d-flex justify-content-center">
                        <a href="profile.html" class="text-decoration-none">
                            <img style="width:60px; height:50px" src="${user.img}" class="img-fluid rounded-circle mb-3" alt="profile-img">
                        </a>
                    </div>
                    <p class="fw-bold text-dark m-0">${user.user_name}</p>
                    <p class="small text-muted">
                        <c:if test="${user.status==1}" var="s">在线</c:if>
                        <c:if test="${!s}">离线</c:if>
                    </p>
                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                        <input type="checkbox" class="btn-check" id="btncheck${i.count}" onclick="addfrined(${user.id})">
                        <label class="btn btn-outline-primary btn-sm px-3 rounded-pill" for="btncheck${i.count}"><span class="follow" id="apply${user.id}">加好友</span><span class="following d-none" id="applying${user.id}">Following</span></label>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>
</body>
</html>
