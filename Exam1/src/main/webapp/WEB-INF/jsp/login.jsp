<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/15
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@ include file="core.jsp"%>
        <title>登录</title>
        <style type="text/css">
            .login-bg{
                background:url(img/bg.png) no-repeat center;
                background-size: cover;
                overflow: hidden;
            }
            .container{
                width: 420px;
                height: 320px;
                min-height: 320px;
                max-height: 320px;
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
                margin: auto;
                padding: 20px;
                z-index: 130;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
                font-size: 16px;
            }
            .layui-input{
                border-radius: 5px;
                width: 300px;
                height: 40px;
                font-size: 15px;
            }
            .layui-form-item{
                margin-left: -20px;
            }
            #logoid{
                margin-top: -16px;
                padding-left:150px;
                padding-bottom: 15px;
            }
            .layui-btn{
                margin-left: -50px;
                border-radius: 5px;
                width: 350px;
                height: 40px;
                font-size: 15px;
            }
            .verity{
                width: 140px;
            }
            a:hover{
                text-decoration: underline;
            }
        </style>
        <script>
            if(self != top) {
                top.location = self.location;
            }
        </script>
    </head>
<body class="login-bg" id="large-header">
<canvas id="demo-canvas" width="1590" height="711"></canvas>
<form class="layui-form" action="" method="post">
    <div class="container">
        <div class="layui-form-mid layui-word-aux" style="margin-top: 10px">
            <img id="logoid" src="${ctx}/img/bg1.png" height="35">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <i class="layui-icon" style="font-size: 25px;">&#xe66f;</i>
            </label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <i class="layui-icon" style="font-size: 25px;">&#xe673;</i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <i class="layui-icon" style="font-size: 25px;">&#xe679;</i>
            </label>
            <div class="layui-input-inline" style="width: 160px">
                <input type="text" maxlength="4" name="code" id="code" required  lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input verity">
            </div>
            <img src="${ctx}/captcha/code" onclick="reloadCode();" id="codeImg" style="border: 1px solid rgba(111,116,136,0.3);border-radius: 5px;margin-left: 10px">
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="login" lay-filter="login">登录</button>
            </div>
        </div>
    </div>
</form>
<shiro:guest>
    <script>
        layui.use(['form'], function(){
            layer.msg('请先登录',{icon: 2,offset:280,time:1000});
        });
    </script>
</shiro:guest>
<script>
    $(function  () {
        layui.use(['form'], function(){
            var form = layui.form;
            //监听提交
            form.on('submit(login)', function(data){
                // 放行提交
                var loading = layer.load(0, {
                    shade: false,
                    time: 1000,
                    offset:300
                });
                axios.post('${ctx}/login',data.field).then(res => {

                    if (res.status == 200){
                        if (res.data.code == 200){
                            layer.close(loading);
                            layer.msg("登录成功",{icon:1,offset:280,time:500},function (){
                                location.href = res.data.data.url;
                            });
                        }else if (res.data.code == 201){
                            layer.msg(res.data.msg,{icon:5,offset:280,time:1000});
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        } else if (res.data.code == 202){
                            layer.msg(res.data.msg,{icon:4,offset:280,time:1000});
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        } else if(res.data.code == 203){
                            layer.msg(res.data.msg,{icon:2,offset:280,time:1000});
                            $('input[name="password"]').val('');
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        }else if(res.data.code == 204){
                            layer.msg(res.data.msg,{icon:2,offset:280,time:1000});
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        } else if(res.data.code == 405){
                            layer.msg(res.data.msg,{icon:2,offset:280,time:1000});
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        }else if (res.data.code == 403){
                            layer.alert(res.data.code + ":" + res.data.msg, {icon: 2,time: 1000});
                            //清空验证码栏
                            $('input[name="code"]').val('');
                            //更新验证码
                            reloadCode();
                        }

                    }
                });
                return false;
            });
        });
    });
    function reloadCode(){
        $('#codeImg').attr('src','${ctx}/captcha/code');
    }
</script>
<script src="${ctx}/js/TweenLite/TweenLite.min.js"></script>
<script src="${ctx}/js/TweenLite/EasePack.min.js"></script>
<script src="${ctx}/js/TweenLite/rAF.js"></script>
<script src="${ctx}/js/TweenLite/demo-1.js"></script>
</body>
</html>
