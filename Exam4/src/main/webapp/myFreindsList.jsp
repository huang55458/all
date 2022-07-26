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
<c:forEach items="${friendsList}" var="friend">
<div href="#" class="p-3 d-flex text-dark text-decoration-none account-item" id="myfriendANdcaozuo${friend.id}">
    <img src="${pageContext.request.contextPath}/img/rmate3.jpg" class="img-fluid rounded-circle me-3" alt="profile-img">
    <div>
        <p class="fw-bold mb-0 pe-3 d-flex align-items-center">${friend.user_name}
            <c:if test="${friend.status!=0}" var="fss">
            <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" id="status${friend.id}" style="background-color: green!important;">done</span>
            </c:if>
<%--        <c:if test="${!fss}">--%>
<%--            <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" id="status${friend.id}" style="background-color: #c0c0c0">done</span>--%>
<%--        </c:if>--%>
        </p>
        <div class="text-muted fw-light">
            <p class="mb-1 small">${friend.email}</p>
<%--            <span class="text-muted d-flex align-items-center small">Artist/Author...</span>--%>
        </div>
    </div>
    <div class="ms-auto" style="position: relative;">
        <c:if test="${friend.status!=0}" var="fss">
            <a href="javascript:realTalking(${friend.id})">
        <span class="material-icons md-20 me-2" id="talking${friend.id}" style="font-size: 30px;position: absolute; right: 25px;top: 15px">chat_bubble_outline</span>
            </a>
        </c:if>
        <div class="dropdown ms-auto">
            <a href="javascript:showCaozuo(${friend.id})" style="font-size: 10px!important;" class="text-muted text-decoration-none material-icons ms-2 md-20 rounded-circle bg-light p-1" id="dropdownMenuButton${friend.id}" data-bs-toggle="dropdown" aria-expanded="false">more_vert</a>
            <ul class="dropdown-menu fs-13 dropdown-menu-end" aria-labelledby="dropdownMenuButton5" style="display: none;position: absolute;right: 10px;top: 10px" id="tttt${friend.id}">
                <li><a class="dropdown-item text-muted" href="javascript:deleteMyFriend(${friend.id})"><span class="material-icons md-13 me-1">sentiment_very_dissatisfied</span>删除好友</a></li>
                <li><a class="dropdown-item text-muted" href="javascript:banMyFriend(${friend.id})"><span class="material-icons md-13 me-1">sentiment_very_dissatisfied</span>拉黑好友</a></li>
            </ul>
        </div>
    </div>
</div>
</c:forEach>
<script>
    function deleteMyFriend(id) {
        var r = confirm("确定要删除好友吗？");
        if (r==true){
            $("#myfriendANdcaozuo"+id).remove();
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/deleteMyFriendReal.do?id="+id,
                contentType:"application/json;charset=utf-8",
                success:function(data){
                }
            })
        }
    }


    function banMyFriend(id) {
        var s = confirm("确定要删除并拉黑该用户吗？");
        if (s==true){
            $("#myfriendANdcaozuo"+id).remove();
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/banMyFriendReal.do?id="+id,
                contentType:"application/json;charset=utf-8",
                success:function(data){
                }
            })
        }
    }



</script>
    <script>
        function showCaozuo(id) {
            $("#tttt"+id).show();
        }
    </script>
<script>
    function realTalking(friendId) {
        window.location.href="http://localhost:8080/findFriend.do?friendId="+friendId+":";
    }
</script>
</body>
</html>
