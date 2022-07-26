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
<%
    request.getAttribute("login_name");
//    request.getRequestDispatcher("/user/userInfo.jsp").forward(request,response);

%>
<form action="/user/mod.do" method="post" enctype="multipart/form-data" class="layui-form" lay-filter="example">
   <p style="font-family: 楷体;font-size: larger">编号：${user.id}</p>
    <div class="layui-form-item">
        <label class="layui-form-label m-margin-tb">头像</label>
        <div class="layui-input-inline">
            <div class="layui-upload-list uploadHeadImage">
                <img style="height:50px;width:50px;border-radius:50%;line-height:50px!important;"
                     src="${pageContext.request.contextPath}/img/default_avatar.png"
                     id="imgSrc" style="width: 80px;height: 80px;border-radius: 50%;cursor: pointer">
                <input type="file" id="upload" name="file" class="upload" value="${user.img}">

            </div>
        </div>
    </div>
<%--        <img src="${pageContext.request.contextPath}/img/index_right/Rocket_robot.png" id="imgSrc" height="100" width="100">--%>
<%--        <input type="file" id="upload" name="file" class="upload" value="${user.img}"><br/>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-inline">
            <input id="login_name" type="text" name="login_name" lay-verify="required" placeholder="请输入登录名" autocomplete="off"
                   class="layui-input" value="${user.login_name}" onblur="checkname()"/>
            <span id="loerror"></span>
        </div>
    </div>
<%--    登录名：<input id="login_name" type="text" name = "login_name" value="${user.login_name}" onblur="checkname()">--%>
<%--    <span id="loerror"></span>--%>
<%--    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" name="password" lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input" value="${user.password}" id="password"/>
            <span id="pwerror"></span>
        </div>
    </div>
<%--    密码：<input id="password" type="text" name = "password" value="${user.password}">--%>
<%--    <span id="pwerror"></span>--%>
<%--    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline">
            <input id="tel" type="text" name="tel" lay-verify="required" placeholder="请输入联系电话"
                   autocomplete="off" class="layui-input" value="${user.tel}">
            <span id="telerror"></span>
        </div>
    </div>
<%--    电话：<input id="tel" type="text" name="tel" value="${user.tel}">--%>
<%--    <span id="telerror"></span>--%>
<%--    <br/>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input id="email" type="text" name="email" lay-verify="required" placeholder="请输入邮箱"
                   autocomplete="off" class="layui-input" value="${user.email}">
            <span id="emerror"></span>
        </div>
    </div>
<%--    邮箱：<input id="email" type="text" name="email" value="${user.email}">--%>
<%--    <span id="emerror"></span>--%>
<%--    <br/>--%>
    <input class="layui-btn" type="submit" value="修改" onclick="checked()"/><br>
</form>



<a href="/user/userList.do">返回用户管理页面</a>
</body>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

    function checkname(){
        var f=false;
        //javascript所有的变量都是以var定义的
        //javascript的变量属于弱类型
        //获取用户输入的用户名
        var name = document.getElementById("login_name").value;
        //去除字符串两端空格
        name=name.trim();
        //判断是否为空
        if(name==""){
            document.getElementById("loerror").innerHTML="登录名不能为空";
            document.getElementById("loerror").css("color","red");
        }else if(name.length<3||name.length>16){
            document.getElementById("loerror").innerHTML="登录名的长度为3-16位";
        }
        else{
            document.getElementById("loerror").innerHTML="登录名已存在";
            //校验用户名是否存在
            //使用ajax异步校验用户名
            $.ajax({
                url:"/user/checkName.do",
                type:"post",
                data:{"login_name":name},//json数据格式的用户名从jsp传递给controller
                dataType:"json",
                async:false,//让ajax执行代码顺序同步
                success:function(data){
                    if(data.msg=="false"){
                        document.getElementById("loerror").innerHTML="登录名已存在";
                    }else{
                        document.getElementById("loerror").innerHTML="登录名可用";
                        f=true;
                    }
                }
            });

        }
        return f;
    }

    <%--    //密码验证--%>
    var isPw = false;
    $("#password").blur(function () {
        if (password.value==null||password.value==""){
            $("#pwerror").css("color","red").html("请输入密码！");
            isPw = false;
        } else {
            $("#pwerror").css("color","green").html("密码可用！");
            isPw = true;
        }
    })

    <%--    //姓名验证--%>
    var isUn = false;
    $("#user_name").blur(function () {
        if (user_name.value==null||user_name.value=="") {
            $("#unerror").css("color", "red").html("请输入姓名！");
            isUn = false;
        } else {
            $("#unerror").css("color", "green").html("姓名可用！");
            isUn = true;
        }
    })

    <%--    //手机号验证--%>
    var isTel = false;
    $("#tel").blur(function () {
        if (tel.value==null||tel.value=="") {
            $("#telerror").css("color", "red").html("请输入手机号！");
            isTel = false;
        } else {
            var myreg = /^[1][3-9][0-9]{9}$/;
            if (!myreg.test(tel.value)) {
                $("#telerror").css("color", "red").html("无效的手机号！");
                isTel = false;
            } else {
                $("#telerror").css("color", "green").html("号码可用！");
                isTel = true;
            }
        }
    })

    <%--    //邮箱验证--%>
    var isEm = false;
    $("#email").blur(function () {
        if (email.value==null||email.value=="") {
            $("#emerror").css("color", "red").html("请输入email！");
            isEm = false;
        } else {
            var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            if (!myreg.test(email.value)) {
                $("#emerror").css("color", "red").html("无效的email！");
                isEm = false;
            } else {
                $("#emerror").css("color", "green").html("email可用！");
                isEm = true;
            }
        }
    })

    <%--    //头像--%>
    function show(obj) {
        var imgFile=obj.files[0];
        var src=window.URL.createObjectURL(imgFile);
        document.getElementById("img").setAttribute("src",src);
    }
    if (${!empty error}) {
        lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function () {
            lightyear.loading('hide');
            lightyear.notify('${error}', 'danger', 0);
        }, 0)
    }

    function checked() {
        if (isPw=="false" && isUn=="false" && isTel=="false" && isEm=="false") {
            window.alert("信息输入有误")
        }
        else return true;
    }
</script>
</html>
