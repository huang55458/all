<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/25
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    Object o = session.getAttribute("user");
    if (o == null){
        response.sendRedirect("/");
    }
    %>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">后台管理面板</div>
    <!-- 头部区域（可配合layui已有的水平导航）----------------------------------------- -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="/frontPage.form">首页</a></li>
                <li class="layui-nav-item"><a href="/user/logout3.do">登出</a></li>
<%--                <li class="layui-nav-item"><a href="">商品管理</a></li>--%>
<%--                <li class="layui-nav-item"><a href="">用户</a></li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">其它系统</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="">邮件管理</a></dd>--%>
<%--                        <dd><a href="">消息管理</a></dd>--%>
<%--                        <dd><a href="">授权管理</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
            </ul>
    <%--        <ul class="layui-nav layui-layout-right">--%>
    <%--            <li class="layui-nav-item">--%>
    <%--                <a href="javascript:;">--%>
    <%--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
    <%--                    贤心--%>
    <%--                </a>--%>
    <%--                <dl class="layui-nav-child">--%>
    <%--                    <dd><a href="">基本资料</a></dd>--%>
    <%--                    <dd><a href="">安全设置</a></dd>--%>
    <%--                </dl>--%>
    <%--            </li>--%>
    <%--            <li class="layui-nav-item"><a href="">退出</a></li>--%>
    <%--        </ul>--%>
    <%--    </div>--%>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
          <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">用户管理</a>
            <dl class="layui-nav-child">
              <dd><a href="/welcome.form">介绍</a></dd>
              <dd><a href="/user/userList.do">用户列表</a></dd>
              <dd><a href="/user/add.do">新增</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a class="" href="javascript:;">题库管理</a>
            <dl class="layui-nav-child">
              <dd><a href="/manageExam.form">题库列表</a></dd>
              <dd><a href="/insert.form">添加题目</a></dd>
              <dd><a href="/allHistory.form">考试记录</a></dd>
              <%--                                <dd><a href="">超链接</a></dd>--%>
            </dl>
          </li>
          <li class="layui-nav-item"><a href="/perms/list.do">权限管理</a></li>
          <li class="layui-nav-item"><a href="">发布商品</a></li>
        </ul>
      </div>
    </div>

    <div class="layui-body">
      <!-- 内容主体区域 -->
      <div style="padding: 15px;">
