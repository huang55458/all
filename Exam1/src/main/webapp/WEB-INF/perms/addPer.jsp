<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/20
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/perms/toadd.do" method="post">
    <table>
        <tr>
        <td>角色：
            <label><input type="radio" name="role_id" value="1" onclick="s(1)">管理员</label>
            <label><input type="radio" name="role_id" value="2" onclick="s(2)">教师</label>
            <label><input type="radio" name="role_id" value="3" onclick="s(3)">学生</label>
        </td>
        </tr>
            <tr>
                <td>权限规则：</td>
                <td><input  type="text" name="pre" value="${perms.pre}" />
                    <span  id="loerror" ></span>
                </td>
            </tr>
            <tr>
                <td>权限说明：</td>
                <td><input type="text" name="remark" value="${perms.password}" id="password"/>
                    <span id="pwerror"></span>
                </td>
            </tr>
        <tr>
            <td colspan=2><input type="submit" value="保存" />${error}
            </td>
        </tr>
    </table>
</form>
</body>
</html>
