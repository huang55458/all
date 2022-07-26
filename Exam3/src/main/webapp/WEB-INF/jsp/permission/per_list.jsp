<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/20
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.6.0.js"></script>

    <script type="text/JavaScript">


        function test(){
            var a = document.getElementById("cehckAll");
            var d = document.getElementsByName("q");
            for(var i=0;i<d.length;i++){
                d[i].checked = a.checked;
            }
        }
        function test1(){
            var a = document.getElementById("cehckAll");
            var d = document.getElementsByName("q");
            for(var i=0;i<d.length;i++){
                if(d[i].checked == false){
                    a.checked = false;
                    return;
                }
            }
            a.checked = true;
        }

        function modify(id) {
            window.location.href="/user/tomod.do?id="+id;

        }

        function del(id) {
            window.location.href="/user/delUser.do?id="+id;

        }



    </script>
</head>
<body>
<a href="/perms/add.do">新增权限</a>
<a id="deleteMore" onclick="todel()" href="javascript:;">批量删除</a>&nbsp;&nbsp;

<%--<!-- 主要区域 --> <form action="/user/ser.do" method="post">--%>
<div id="main">
    <!-- 操作区域 -->
    <div id="operate">
        <div id="operate_left" style="float: left;margin-top:2px;">
            <form action="${pageContext.request.contextPath}/perms/list.do?type=1" method="post">
                <div style="float:left;margin-top: 5px">
                    角色:<input name="role_id" />
                    <%--                    用户名:<input name="login_name" />--%>
                    <button id="btn_search">搜索</button>
                </div>
            </form>

            <%--            ID:<input type="text" name="id" value="${user.id}"/>--%>
            <%--                姓名:<input type="text" name="user_name" value="${user.user_name}"/>--%>
            <%--                角色:<select id="type" name="type">--%>
            <%--                    <option value="1">管理员</option>--%>
            <%--                    <option value="2">教师</option>--%>
            <%--                    <option value="3">学生</option>--%>
            <%--                    </select>--%>
            <%--                <input type="submit" value="搜索" name="search"/>--%>

        </div>
    </div>

    <div id="data">
        <%--<table style="width:100%;border:1px solid;">--%>

        <table id="datalist" style="width: 100%;border: 1px solid skyblue">
            <tr id="d1">
                <th><input type="checkbox" value="全选"  id="checkAll"  onclick="test(q);">
                    <span>全选</span></th>
                <td>序号</td>
                <td>角色</td>
                <td>权限规则</td>
                <td>权限说明</td>
                <td>操作</td>
            </tr>
            <tbody>
            <c:forEach items="${permsList}" var="per">
                <tr>
                    <td><input type="checkbox" value="${per.id}" id="q" name="q" onclick="test1()"></td>
                    <td>${per.id}</td>
                    <td>${per.role_id}</td>
                    <td>${per.pre}</td>
                    <td>${per.remark}</td>
                    <td><input type="button" class="btn_modify" value="修改" onclick="modify(${per.id});">
                        <input type="button" class="btn_delete" value="删除" onclick="del(${per.id});">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
