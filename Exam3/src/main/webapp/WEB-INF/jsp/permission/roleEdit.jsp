<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/16
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <script src="/js/axios.min.js"></script>
        <script src="/js/qs.min.js"></script>
        <link rel="stylesheet" href="/css/font.css">
        <link rel="stylesheet" href="/css/xadmin.css">
        <link rel="stylesheet" href="/css/theme4.css">
        <link rel="stylesheet" href="/css/style.css">
        <script src="/static/layui-v2.7.5/layui/layui.js" ></script>
    </head>
    <body>
        <form action="/role/alterRole.do" method="post" class="layui-form" lay-filter="example">

                <div class="layui-form-item">
                    <label class="layui-form-label">用户编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="uid"  readonly value="${curUser.id}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username"  readonly value="${curUser.login_name}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">拥有角色</label>
                    <div class="layui-input-inline">
                        <c:if test="${user_role.size()==0}">
                            <span>暂无角色</span>
                        </c:if>
                        <c:forEach items="${user_role}" var="ur">
                            <span>
                                <c:if test="${ur.role_id==1}"> 学生 </c:if>
                                <c:if test="${ur.role_id==2}"> 教师 </c:if>
                                <c:if test="${ur.role_id==3}"> 管理员 </c:if>
                            </span>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">请选择更改后角色</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="rolelist" value="1" title="学生">
                        <input type="checkbox" name="rolelist" value="2" title="教师" >
                        <input type="checkbox" name="rolelist" value="3" title="管理员" >
                    </div>
                </div>
            <input class="layui-btn layui-col-md1" style="margin-left: 50px" type="submit" value="更新" onclick="return updateRole()"/><br>
        </form>
        <a href="/user/userList.do" class="layui-col-md12" style="margin:20px 50px">返回用户管理页面</a>

    </body>
</html>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    function updateRole() {
        var checkOne = false;                    //判断是否被选择条件
        var chboxVal = [];                       //存入被选中项的值
        var checkBox = $('input[name = rolelist]'); //获得得到所的复选框

        for (var i = 0; i < checkBox.length; i++) {

            //如果有1个被选中时（jquery1.6以上还可以用if(checkBox[i].prop('checked')) 去判断checkbox是否被选中）
            if (checkBox[i].checked) {
                checkOne = true;
                chboxVal.push(checkBox[i].value)//将被选择的值追加到
            }
        }

        if (!checkOne) {
            alert("至少选择一个角色哦：");
            return false;
        }
        return true;
    }
</script>

