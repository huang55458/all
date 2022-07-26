<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/19
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object o = session.getAttribute("user");
    if (o != null){
        response.sendRedirect("/frontPage.form");

    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/login2.css">
<%--    <script type="text/javascript" src="js/login2.js"></script>--%>
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>

</head>
<body>

<!--用户登录-->
<div class="wrap">
    <div  style="margin-top:50px;z-index: 9999999999999;width: 100%;height: 70px;position:absolute;" >
    <p style="color: #4e7199;font-size: 50px;text-align: center;">在线考试系统</p>
    </div>
    <div class="wrap-box">

        <div class="box-content">
            <div class="sign">
                <h2 class="title">没有账号吗？</h2>
                <p class="desc">点击这里注册一个账号</p>
                <button type="button" class="get-register">注册</button>
            </div>
            <div class="login">
                <h2 class="title">已经有账号了吗？</h2>
                <p class="desc">点击这里登录</p>
                <button type="button" class="get-login">登录</button>
            </div>
        </div>

        <div class="manager-box">

            <div class="sign-part">

                <div>
                    <h3>注册</h3>
                    <form action="register/register.do" method="post" enctype="multipart/form-data" >
                    <div class="input-box">
                        <img src="img/login/logName.png" width="20" height="20" alt=""/>
                        <input name="login_name" type="text" id="login_name" placeholder="请输入用户名"><span id="loerror"></span>
                        <i class="iconfont icon-wo"></i>
                    </div>
                    <div class="input-box">
                        <img src="img/login/logPwd.png" width="20" height="20" alt=""/>
                        <input name="password" type="password" id="password" placeholder="请输入密码"><span id="pwerror"></span>
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="input-box">
<%--                        <img src="img/login/logName.png" width="20" height="20" alt=""/>--%>
                        <input name="user_name" type="text" id="user_name" placeholder="请输入姓名"><span id="unerror"></span>
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="input-box">
<%--                        <img src="img/login/phone.png" width="20" height="20" alt=""/>--%>
                        <input name="tel" type="text" id="tel" placeholder="请输入手机号"><span id="pherror"></span>
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="input-box">
<%--                        <img src="img/login/email_address.png" width="20" height="20" alt=""/>--%>
                        <input name="email" type="text" id="email" placeholder="请输入email"><span id="emerror"></span>
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="input-box">
                        <span id="myerror"></span><a style="text-decoration-line: none; color: gray" href="javascript:;" onclick="$('#file').click()">请选择头像</a>
                        <input name="file" onchange="show(this)" id="file" type="file" style="display: none">
                        <p><img id="img" style="width: 80px;height: 80px;border-radius: 50%;cursor: pointer"  onclick="$('#file').click()" alt="图片一"></p>
                    </div>
                    <div class="buttons clearfix">
                        <button type="submit" class="btn-register fr" id="sub" >注册</button>
                    </div>
                    </form>
                </div>

            </div>


            <div class="login-part">
                <div>
                    <form action="test/to.do" method="post">
                    <h3>登录</h3>
                    <div class="input-box">
                        <img src="img/login/logName.png" width="20" height="20" alt=""/>
                        <input id="login_name1" type="text" name="login_name"
                               placeholder="输入用户名" />
                        <span id="loerror1"></span>
                        <i class="iconfont icon-wo"></i>
                    </div>
                    <div class="input-box">
                        <img src="img/login/logPwd.png" width="20" height="20" alt=""/>
                        <input id="password1" type="password" name="password"
                               placeholder="输入用户密码" />
                        <span id="pwerror1"></span>
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="input-box">
                        <input type="text" id="vcode" name="vcode" placeholder="验证码" />
                        <img src="code" id="code" alt="点击更换" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
                        ${requestScope.msg}
                        <i class="iconfont icon-mima"></i>
                    </div>
                    <div class="buttons clearfix">
<%--                        <a href="javascript:;">忘记密码？</a>--%>
                        <button type="submit" class="btn-login fr">登录</button>
                        ${msg}${sessionScope.error}
                    </div>
                    </form>
                </div>
            </div>

        </div>

    </div>
</div>
<!--加载-->
<div class="loading">
    <div class="loading-wrapper active">
        <div class="loading-spinner active">
            <div class="loading-clipper left">
                <div class="loading-circle"></div>
            </div>
            <div class="loading-gap-patch">
                <div class="loading-circle"></div>
            </div>
            <div class="loading-clipper right">
                <div class="loading-circle"></div>
            </div>
        </div>
    </div>
</div>

</body>
<%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>

<script type="text/javascript">



    <%--    //姓名验证--%>
    // var isUn1 = false;
    // $("#login_name1").blur(function () {
    //     if (login_name.value==null||login_name.value=="") {
    //         $("#loerror1").css("color", "red").html("请输入姓名！");
    //         isUn1 = false;
    //     } else {
    //         $("#loerror1").css("color", "green").html("");
    //         isUn1 = true;
    //     }
    // })
    // var isPw1 = false;
    // $("#password1").blur(function () {
    //     if (password.value==null||password.value==""){
    //         $("#pwerror1").css("color","red").html("请输入密码！");
    //         isPw1 = false;
    //     }
    //     else{
    //         $("#unerror1").css("color", "green").html("");
    //         isUn1 = true;
    //     }
    // })


    //用户名验证
    var isExit = false;
    $("input[name='login_name']").blur(function () {
        var value = $(this).val();
        $.post('/user/checkLoginName.do?login_name=' + value, function (a) {
            if (a == "该用户名已存在!") {
                $("#loerror").css("color", "red").html(a);
                isExit = false;
            } else {
                $("#loerror").css("color", "green").html(a);
                isExit = true;
            }
        })
    })



    //密码验证
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

    //姓名验证
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

    //手机号验证
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

    //邮箱验证
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

    //头像
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
        if (isExit && isPw  && isUn && isTel && isEm) return true;
        else return false;
    }

    $(".get-register").click(function () {
        $(".manager-box").removeClass("right").addClass("left").removeClass("active");
    });

    $(".get-login").click(function () {
        $(".manager-box").removeClass("left").addClass("right").addClass("active");
    });

    $(".btn-register,.btn-login").click(function () {
        $(".loading").fadeIn("slow");
    });
</script>

</html>
