<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/21
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${applyUsers}" var="user">
<div class="d-flex align-items-center px-3 pt-3" id="fatherDom${user.id}">
    <img src="${pageContext.request.contextPath}/img/rmate2.jpg" class="img-fluid rounded-circle" alt="profile-img">
    <div class="ms-3">
        <h6 class="mb-0 d-flex align-items-start text-body fs-6 fw-bold">${user.user_name}<span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon">done</span></h6>
        <p class="text-muted mb-0">${user.email}</p>
    </div>
    <div class="ms-auto btn-group" role="group" aria-label="Basic checkbox toggle button group">

        <label class="btn btn-outline-primary btn-sm px-3 rounded-pill" onclick="accept(${user.id})" ><span class="follow" id="accept${user.id}">接受</span></label>
        <label class="btn btn-outline-primary btn-sm px-3 rounded-pill" onclick="refuse(${user.id})" ><span class="follow" id="refuse${user.id}">拒绝</span></label></div>

</div>
</body>
</c:forEach>
<%--<a href="profile.html" class="p-3 d-flex text-dark text-decoration-none account-item">--%>
<%--    <img src="img/rmate3.jpg" class="img-fluid rounded-circle me-3" alt="profile-img">--%>
<%--    <div>--%>
<%--        <p class="fw-bold mb-0 pe-3 d-flex align-items-center">Konex <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon">done</span></p>--%>
<%--        <div class="text-muted fw-light">--%>
<%--            <p class="mb-1 small">@Konex</p>--%>
<%--            <span class="text-muted d-flex align-items-center small">Artist/Author...</span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="ms-auto">--%>

<%--    </div>--%>
<%--</a>--%>
<script>
    function accept(id) {
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/acceptApply.do?id="+id,
            contentType:"application/json;charset=utf-8",
            success(data){
                $("#fatherDom"+id).remove();
            }
        })
    }
    function refuse(id){
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/refuseApply.do?id="+id,
            contentType:"application/json;charset=utf-8",
            success(data){
                $("#fatherDom"+id).remove();
            }
        })
    }
</script>
</html>
