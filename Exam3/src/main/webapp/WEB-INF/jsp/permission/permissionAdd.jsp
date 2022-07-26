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
<form action="/permission/add.do" method="post" class="layui-form" lay-filter="example">
    <div class="layui-form-item">
        <label class="layui-form-label">权限名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" required autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">访问路径</label>
        <div class="layui-input-inline">
            <input type="text" name="url" required autocomplete="off" class="layui-input">
        </div>
    </div>
    <input class="layui-btn layui-col-md1" style="margin-left: 50px" type="submit" value="添加"/><br>
</form>
<a href="/permission/getAll.do" class="layui-col-md12" style="margin:20px 50px">返回权限列表</a>
</body>
</html>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    function addPermission() {
        window.location.href = "permission/add.do"
        return true;
    }
</script>

