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
    <script src="/js/axios.min.js"></script>
    <script src="/js/qs.min.js"></script>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/theme4.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/static/layui-v2.7.5/layui/layui.js" ></script>
<%--<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>--%>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath }/js/editUser.js"></script>--%>
<%--    <%--%>
<%--        String errorInfo = (String)session.getAttribute("error");         // 获取错误属性--%>
<%--        if(errorInfo != null) {--%>
<%--    %>--%>
<%--    <script type="text/javascript" language="javascript">--%>
<%--        alert("${error}");                                            // 弹出错误信息--%>

<%--        // window.location='/user/editUser.jsp' ;                            // 跳转到登录界面--%>
<%--    </script>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>

</head>
<body>
<div class="layui-layer layui-layer-iframe" id="layui-layer1"
     type="iframe" times="1" showtime="0" contype="string"
     style="z-index: 19891015; width: 700px; height: 800px; top: 100px; left: 393.5px;">
    <div class="layui-layer-title" style="cursor: move;">添加用户</div>
    <div id="" class="layui-layer-content">
<%--    <iframe scrolling="auto" allowtransparency="true" id="layui-layer-iframe1"--%>
<%--            name="layui-layer-iframe1" onload="this.className='';"--%>
<%--            class="" frameborder="0" src="/user/add.do" style="height: 457px;">--%>


<%--    </div>--%>
<%--    <span class="layui-layer-setwin">--%>
<%--        <a class="layui-layer-min" href="javascript:;">--%>
<%--            <cite></cite></a>--%>
<%--        <a class="layui-layer-ico layui-layer-max" href="javascript:;"></a>--%>
<%--        <a class="layui-layer-ico layui-layer-close layui-layer-close1" href="javascript:;">--%>

<%--        </a>--%>
<%--    </span>--%>
<%--    <span class="layui-layer-resize"></span>--%>
<form id="user-form" action="/user/toadd.do" method="post" enctype="multipart/form-data" class="layui-form" lay-filter="user-form">
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
    <div class="layui-form-item">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-inline">
            <input id="login_name" type="text" name="login_name" lay-verify="required" placeholder="请输入登录名" autocomplete="off"
                   class="layui-input" value="${user.login_name}" onblur="checkname()"/>
            <span id="loerror"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" name="password" lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input" value="${user.password}" id="password"/>
            <span id="pwerror"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline">
            <input id="tel" type="text" name="tel" lay-verify="required" placeholder="请输入联系电话"
                   autocomplete="off" class="layui-input" value="${user.tel}">
            <span id="pherror"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input id="email" type="text" name="email" lay-verify="required" placeholder="请输入邮箱"
                   autocomplete="off" class="layui-input" value="${user.email}">
            <span id="emerror"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input id="user_name" type="text" name="user_name" lay-verify="required" placeholder="请输入姓名" autocomplete="off"
                   class="layui-input" value="${user.user_name}">
            <span id="unerror"></span>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block" id="status" lay-filter="status">
            <input type="radio" name="status" value="0" title="在线">
            <div class="layui-unselect layui-form-radio">
                <i class="layui-anim layui-icon"></i>
                <div>在线</div></div>
            <input type="radio" name="status" value="1" title="离线">
            <div class="layui-unselect layui-form-radio">
                <i class="layui-anim layui-icon"></i><div>离线</div></div>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block" id="roles">
            <input type="radio" name="type" value="1" title="admin">
            <div class="layui-unselect layui-form-radio">
                <i class="layui-anim layui-icon"></i>
                <div>管理员</div>
            </div>

            <input type="radio" name="type" value="2" title="teacher">
            <div class="layui-unselect layui-form-radio">
                <i class="layui-anim layui-icon"></i>
                <div>教师</div>
            </div>

            <input type="radio" name="type" value="3" title="student">
            <div class="layui-unselect layui-form-radio">
                <i class="layui-anim layui-icon"></i>
                <div>学生</div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
<%--            <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
    <input type="submit" class="layui-btn" value="保存" />
        </div>
    </div>

    <%--    <table>--%>
<%--        &lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <input type="hidden" name="id" class="form-control" value="#if($wxAccount)$!wxAccount.id#else 0#end">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        <tr>--%>
<%--            <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg" id="imgSrc" style="width: 80px;height: 80px;border-radius: 50%;cursor: pointer">--%>
<%--            <input type="file" id="upload" name="file" class="upload" value="${user.img}">--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>登录名：</td>--%>
<%--            <td><input id="login_name" type="text" name="login_name" value="${user.login_name}" onblur="checkname()"/>--%>
<%--                <span  id="loerror" ></span>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>密码：</td>--%>
<%--            <td><input type="text" name="password" value="${user.password}" id="password"/>--%>
<%--                <span id="pwerror"></span>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>电话号码：</td>--%>
<%--            <td><input id="tel" type="text" name="tel" value="${user.tel}"/>--%>
<%--            <span id="pherror"></span>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>邮箱：</td>--%>
<%--            <td><input id="email" type="text" name="email" value="${user.email}"/>--%>
<%--            <span id="emerror"></span>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>用户名：</td>--%>
<%--            <td><input id="user_name" type="text" name="user_name" value="${user.user_name}" onblur="ajaxValidate()"/>--%>
<%--            <span id="unerror" ></span>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>状态：</td>--%>
<%--            &lt;%&ndash;            <td><input type="text" name="status" value="${user.status}"/></td>&ndash;%&gt;--%>
<%--            <td>--%>
<%--                <label><input type="radio" name="status" value="0" onclick="s(0)">在线</label>--%>
<%--                <label><input type="radio" name="status" value="1" onclick="s(1)">离线</label>--%>

<%--            </td>--%>
<%--        </tr>--%>
<%--        &lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <td>创建日期：</td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <td><input type="date" name="create_time" value="${user.create_time}"/></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <td>更新日期：</td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <td><input type="date" name="update_time" value="${user.update_time}"/></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        <tr>--%>
<%--            <td>角色类型：</td>--%>
<%--            &lt;%&ndash;            <td><input type="text" name="type" value="${user.type}"/></td>&ndash;%&gt;--%>
<%--            <td>--%>
<%--                <label><input type="radio" name="type" value="1">管理员</label>--%>
<%--                <label><input type="radio" name="type" value="2">教师</label>--%>
<%--                <label><input type="radio" name="type" value="3">学生</label>--%>
<%--            </td>--%>

<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan=2><input type="submit" value="保存" />${error}--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
</form>
    </div>
    </div>
<%--</iframe>--%>
<a href="/user/userList.do">返回用户管理页面</a>
</body>
<script type="text/javascript" src="/js/editUser.js"></script>
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
                    if(data === "false"){
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
            $("#pherror").css("color", "red").html("请输入手机号！");
            isTel = false;
        } else {
            var myreg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
            if (!myreg.test(tel.value)) {
                $("#pherror").css("color", "red").html("无效的手机号！");
                isTel = false;
            } else {
                $("#pherror").css("color", "green").html("号码可用！");
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
        if (isPw  && isUn && isTel && isEm) return true;
        else return false;
    }
</script>
<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form;
        var table = layui.table;
        initRole(form);
        form.on('submit(add)', function (data) {
            axios.post("/user/toadd.do", data.field).then(res => {
                if (res.data.code == 403) {
                    layer.alert(res.data.code + ":" + res.data.msg, {icon: 2,time: 1000});
                    return;
                }
                let iconNum;
                if (res.data.code==100){
                    iconNum = 1;
                }else {
                    iconNum = 2;
                }
                layer.alert(res.data.msg, {icon: iconNum}, function() {
                    //关闭当前frame
                    xadmin.close();
                    // 可以对父窗口进行刷新
                    xadmin.father_reload();
                });
            });
            return false;
        });
    });

    function initRole(form) {
        axios.get("/role/getRoles").then(res => {
            // console.log(res.data);
            for (let i = 0; i < res.data.length; i++) {
                let roleHtml = "<input type='radio' name='type' value='" + res.data[i].id + "' title='" + res.data[i].rolename + "'>";
                $("#roles").append(roleHtml);
            }
            form.render();
        });
    }

</script>
</html>

