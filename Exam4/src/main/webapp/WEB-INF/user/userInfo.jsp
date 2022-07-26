
<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/17
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
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
<%--    <script>--%>
<%--        form.type.value = "${user.type}";--%>
<%--    </script>--%>
</head>
<body>
<a href="/user/add.do">新增数据</a>
<!-- 主要区域 -->
<div id="main">
    <!-- 操作区域 -->
    <div id="operate">
        <div id="operate_left" style="float: left;margin-top:2px;">
            <form action="/user/findAll.do" method="post">
<%--            ID:<input type="text" name="id" value="${user.id}"/>--%>
                姓名:<input type="text" name="user_name" value="${user.user_name}"/>
<%--                角色:<select id="type" name="type">--%>
<%--                    <option value="1">管理员</option>--%>
<%--                    <option value="2">教师</option>--%>
<%--                    <option value="3">学生</option>--%>
<%--                    </select>--%>
                <input type="submit" value="搜索" name="search"/>
            </form>
        </div>
    </div>

    <div id="data">
        <%--<table style="width:100%;border:1px solid;">--%>

        <table id="datalist" style="width: 100%;border: 1px solid skyblue">
            <tr id="d1">
                <th><input type="checkbox" value="全选"  id="cehckAll" onclick="test();">
                    <span>全选</span></th>
                <td>用户id</td>
                <td>头像</td>
                <td>登录名</td>
                <%--    <td>密码</td>--%>
                <td>联系电话</td>
                <td>邮箱</td>
                <td>用户名</td>
                <td>状态</td>
                <td>创建时间</td>
                <td>更新时间</td>
                <td>用户类型</td>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><input type="checkbox" value="全选" name="q" onclick="test1()"></td>
                    <td>${user.id}</td>
                    <td><img src="${pageContext.request.contextPath}/${user.img}" style="width: 60px;height: 60px;"></td>
                    <td>${user.login_name}</td>
                        <%--    <td>${user.password}</td>--%>
                    <td>${user.tel}</td>
                    <td>${user.email}</td>
                    <td>${user.user_name}</td>
                    <td>${user.status}</td>
                    <td>${user.create_time}</td>
<%--                    <td><fmt:formatDate value="${user.create_time}" pattern="yyyy-MM-dd"/></td>--%>
                    <td>${user.update_time}</td>
                    <td>${user.type}</td>
                    <td><input type="button" class="btn_modify" value="修改" onclick="modify(${user.id});">
                        <input type="button" class="btn_delete" value="删除" onclick="del(${user.id});">
                </tr>
            </c:forEach>
        </table>

    </div>
<%--    --%>
<%--        <td><fmt:formatDate value="${user.create_date }" pattern="yyyy-MM-dd"/></td>--%>
<%--        <td><a href="/user/delUser?id=${user.id }">删除</a>--%>
<%--            <a href="/user/renewalUser?id=${user.id }">更新</a></td>--%>
    </div>

<!-- 分页 -->
<div class="box-tools pull-right">
    <ul class="pagination">
        <li><a href="/user/findAll.do" aria-label="Previous">首页</a></li>
        <li><a href="/user/findAll.do?currentPage=${pageInfo.currentPage-1}">上一页</a></li>
        <c:forEach begin="1" end="${pageInfo.totalPage}" var="pageNum">
            <li><a href="/user/findAll.do?currentPage=${pageNum}">${pageNum}</a></li>
        </c:forEach>
        <li><a href="/user/findAll.do?currentPage=${pageInfo.currentPage+1}">下一页</a></li>
        <li><a href="/user/findAll.do?currentPage=${pageInfo.totalPage}" aria-label="Next">尾页</a></li>
    </ul>
</div>
<hr/>

</body>
</html>
