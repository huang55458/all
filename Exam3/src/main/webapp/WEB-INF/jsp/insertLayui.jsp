<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/20
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" href="./layui/css/layui.css">--%>
<%--</head>--%>

<%--<body class="layui-layout-body" >--%>
<%--<div class="layui-layout layui-layout-admin">--%>
<%--    <div class="layui-header">--%>
<%--        <div class="layui-logo">后台管理面板</div>--%>
<%--        <!-- 头部区域（可配合layui已有的水平导航）----------------------------------------- -->--%>
<%--        &lt;%&ndash;        <ul class="layui-nav layui-layout-left">&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item"><a href="">控制台</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item"><a href="">商品管理</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item"><a href="">用户</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <a href="javascript:;">其它系统</a>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <dl class="layui-nav-child">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <dd><a href="">邮件管理</a></dd>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <dd><a href="">消息管理</a></dd>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <dd><a href="">授权管理</a></dd>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </dl>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </ul>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <ul class="layui-nav layui-layout-right">&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <a href="javascript:;">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    贤心&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </a>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <dl class="layui-nav-child">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <dd><a href="">基本资料</a></dd>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <dd><a href="">安全设置</a></dd>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </dl>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <li class="layui-nav-item"><a href="">退出</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </ul>&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--        <div class="layui-side layui-bg-black">--%>
<%--            <div class="layui-side-scroll">--%>
<%--                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--                <ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--                    <li class="layui-nav-item layui-nav-itemed">--%>
<%--                        <a class="" href="javascript:;">题库管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="manageExam.form">题库列表</a></dd>--%>
<%--                            <dd><a href="insert.form">添加题目</a></dd>--%>
<%--                            <dd><a href="allHistory.form">考试记录</a></dd>--%>
<%--&lt;%&ndash;                            <dd><a href="">超链接</a></dd>&ndash;%&gt;--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">解决方案</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                            <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                            <dd><a href="">超链接</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item"><a href="">云市场</a></li>--%>
<%--                    <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="layui-body">--%>
            <!-- 内容主体区域 -->
<%--            <div style="padding: 15px;">--%>
                <form class="layui-form" action="insertExam.form" method="post">
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">题目: </label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" name="question" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">选项A:</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" name="a" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">选项B:</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" name="b" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">选项C:</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" name="c" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">选项D:</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" name="d" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">难度</label>
                        <div class="layui-input-block">
                            <input type="radio" name="level" value="1" title="简单" checked>
                            <input type="radio" name="level" value="2" title="困难" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <input type="radio" name="type" value="java" title="java" checked>
                            <input type="radio" name="type" value="html" title="html" >
                            <input type="radio" name="type" value="servlet" title="servlet" >
                        </div>
                    </div>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">答案</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="answer" value="a" title="A">
                            <input type="checkbox" name="answer" value="b" title="B">
                            <input type="checkbox" name="answer" value="c" title="C">
                            <input type="checkbox" name="answer" value="d" title="D">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>

<%@include file="footer.jsp" %>

<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;    <div class="layui-footer">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <!-- 底部固定区域 -->&ndash;%&gt;--%>
<%--        &lt;%&ndash;        test.&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--    </div>--%>
<%--</div>--%>
<%--    <script src="./layui/layui.js"></script>--%>
<%--    <script>--%>
<%--        // //JavaScript代码区域--%>
<%--        // layui.use('element', function(){--%>
<%--        //     var element = layui.element;--%>
<%--        //--%>
<%--        // });--%>
<%--    </script>--%>
<%--</body>--%>
<%--</html>--%>
