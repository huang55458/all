<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/16
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="../../jquery-3.3.1.min.js"></script>
</head>
<body>
    <form action="showFriends.do">
        <input type="submit" value="查询好友列表">
    </form>
    <ul style="list-style-type: none">
        <c:forEach items="${friends}" var="friend">
            <li>${friend.user_name}<input type="button" onclick="test(${friend.id})"></li>
        </c:forEach>
    </ul>





    <div id="showMessage" style="width: 200px; height: 200px; border: 1px solid black">

    </div>
<%--    <script type="text/javascript">--%>
<%--        var index = setInterval(x,300);--%>
<%--        function x() {--%>
<%--            $.post("http://localhost:8080/acceptMes.do","action=acceptMes",function (data) {--%>
<%--                // var str = "<h3>"+'data'+"</h3>";--%>
<%--                // $("#showMessage").children("a").after(str);--%>
<%--                // alert(data.length);--%>
<%--               /* for (var i=0;i<data.length;i++){--%>
<%--                    $("#showMessage").children("a").after(data[i]);--%>
<%--                }*/--%>
<%--                console.log(data)--%>
<%--                let html = "";--%>
<%--                $.each(data,function (n,value) {--%>
<%--                    html += y(value);--%>
<%--                })--%>
<%--                $("#showMessage").html(html)--%>
<%--            },"json");--%>
<%--        }--%>

<%--        function y(data) {--%>
<%--            return `<h3>`+data+`</h3>`;--%>
<%--        }--%>

<%--    </script>--%>
<%--    <form action="talkfriend.do">--%>
<%--        <input name="message">--%>
<%--        <input type="submit"  value="发送">--%>
<%--    </form>--%>
    <script>
        function test(friendId) {
            window.location.href="http://localhost:8080/findFriend.do?friendId="+friendId+":";
        }
    </script>
</body>
</html>
