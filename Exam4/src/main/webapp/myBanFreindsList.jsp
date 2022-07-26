<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/22
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../jquery-3.3.1.min.js"></script>
</head>
<body>
<c:forEach items="${bansList}" var="ban">
<div href="#" class="p-3 d-flex text-dark text-decoration-none account-item">
    <img src="${pageContext.request.contextPath}/img/rmate3.jpg" class="img-fluid rounded-circle me-3" alt="profile-img">
    <div>
        <p class="fw-bold mb-0 pe-3 d-flex align-items-center">${ban.user_name}
<%--            <c:if test="${ban.status!=0}" var="fss">--%>
<%--            <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" id="status${ban.id}" style="background-color: green!important;">done</span>--%>
<%--            </c:if>--%>
<%--        <c:if test="${!fss}">--%>
<%--            <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" id="status${friend.id}" style="background-color: #c0c0c0">done</span>--%>
<%--        </c:if>--%>
        </p>
        <div class="text-muted fw-light">
            <p class="mb-1 small">${ban.email}</p>
<%--            <span class="text-muted d-flex align-items-center small">Artist/Author...</span>--%>
        </div>
    </div>
    <div class="ms-auto" style="position: relative;">


<%--                <div class="ms-auto btn-group" role="group" aria-label="Basic checkbox toggle button group" style="position: absolute;right: 25px;top: 15px">--%>
<%--                    <label class="btn btn-outline-primary btn-sm px-3 rounded-pill" onclick="accept(${user.id})" ><span class="follow" id="accept${user.id}">取消拉黑</span></label>--%>
<%--                </div>--%>

        <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
            <label class="btn btn-outline-primary btn-sm px-3 rounded-pill" onclick="banCaozuo(${ban.id})"><span class="follow">取消拉黑</span></label>
        </div>

    </div>
</div>
</c:forEach>
    <script>
        function banCaozuo(id) {
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/cancelBan.do?id="+id,
                contentType:"application/json;charset=utf-8",
                success(data){

                }
            })
        }
    </script>

</body>
</html>
