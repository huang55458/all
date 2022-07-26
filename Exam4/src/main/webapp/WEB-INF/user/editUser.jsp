<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/17
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
<%--    <script type="text/javascript">--%>
<%--        var objs=document.getElementsByName("status");--%>

<%--        if(objs=="1"){--%>
<%--             objs = parseInt(objs);--%>
<%--        }--%>
<%--        if(objs=="0"){--%>
<%--            objs = parseInt(objs);--%>
<%--        }--%>
<%--        var t = document.getElementsByName("type");--%>
<%--        if(t=="1"&&t=="2"&&t=="3"){--%>
<%--            t=parseInt(t);--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>


<form action="/user/toadd.do" method="post" enctype="multipart/form-data">
    <table>
<%--        <tr>--%>
<%--            <input type="hidden" name="id" class="form-control" value="#if($wxAccount)$!wxAccount.id#else 0#end">--%>
<%--        </tr>--%>
        <tr>
<%--            <a style="text-decoration-line: none; color: gray" href="javascript:;" onclick="$('#file').click()">请选择头像</a>--%>
<%--                <input name="myHead" onchange="show(this)" id="file" type="file" style="display: none">--%>
<%--            <img id="img" style="width: 80px;height: 80px;border-radius: 50%;cursor: pointer"  onclick="$('#file').click()" alt="图片一"/>--%>
            <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg" id="imgSrc" height="100" width="100">
            <input type="file" id="upload" name="file" class="upload" value="${user.img}">
<%--            <input type="hidden" value="${user.img}" id="img" name="img"/>--%>
        </tr>
        <tr>
            <td>登录名：</td>
            <td><input type="text" name="login_name" value="${user.login_name}"/></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="text" name="password" value="${user.password}"/></td>
        </tr>
        <tr>
            <td>电话号码：</td>
            <td><input type="text" name="tel" value="${user.tel}"/></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" name="email" value="${user.email}"/></td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="user_name" value="${user.user_name}"/></td>
        </tr>
        <tr>
            <td>状态：</td>
<%--            <td><input type="text" name="status" value="${user.status}"/></td>--%>
            <td>
                <label><input type="radio" name="status" value="0" onclick="s(0)">在线</label>
                <label><input type="radio" name="status" value="1" onclick="s(1)">离线</label>

            </td>
        </tr>
<%--        <tr>--%>
<%--            <td>创建日期：</td>--%>
<%--            <td><input type="date" name="create_time" value="${user.create_time}"/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>更新日期：</td>--%>
<%--            <td><input type="date" name="update_time" value="${user.update_time}"/></td>--%>
<%--        </tr>--%>
        <tr>
            <td>角色类型：</td>
<%--            <td><input type="text" name="type" value="${user.type}"/></td>--%>
            <td>
                <label><input type="radio" name="type" value="1">管理员</label>
                <label><input type="radio" name="type" value="2">教师</label>
                <label><input type="radio" name="type" value="3">学生</label>
            </td>

        </tr>
        <tr>
            <td colspan=2><input type="submit" value="保存" /></td>
        </tr>
    </table>
</form>

</body>
</html>
