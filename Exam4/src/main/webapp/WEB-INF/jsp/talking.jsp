<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/19
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="../../jquery-3.3.1.min.js"></script>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    .chat_commento{
        width: 450px;
        height: 650px;
        margin: auto;
        border-radius: 10px;
        border: 2px solid #f4f5f7;
    }
    .clearfix::after{
        content: "";
        display: block;
        clear: both;
        width: 0;
        height: 0;
        line-height: 0;
        visibility: hidden;
    }
    /* top */
    .chat_top{
        width: 100%;
        height: 50px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        padding-left: 20px;
        font-size: 20px;
        line-height: 50px;
        box-sizing: border-box;
        font-weight: 550;
        border-width: 0px;
    }
    /* middle */
    /* 左边 */
    .chat_middle{
        width: 450px;
        height: 455px;
        position: relative;
        box-sizing: border-box;
        overflow: auto;
        border-width: 0px;
    }
    .chat_left{
        width: 100%;
        height: 120px;
        margin-top: 20px;
        /*word-break: break-all;*/
    }
    .chat_left_item_1{
        width: 50px;
        height: 50px;
        background-color: #4459AB;
        float: left;
        margin-top: 10px;
        margin-left: 10px;
        margin-right: 10px;
        text-align: center;
        line-height: 50px;
        color: white;
        border-radius: 25px;
    }
    .chat_left_item_2{
        width: 55%;
        height: 100px;
        float: left;
        margin-top: 10px;
        word-wrap: break-word;
    }
    .chat_left_item_2 .chat_left_chat{
        float: left;
    }
    .chat_left_item_2 .chat_left_content{
        padding: 15px;
        margin-top: 10px;
        background-color: #f4f5f7;
        display: inline-block;
        border-radius: 10px;

        border-top-left-radius: 0px;
    }
    /* 右边 */
    .chat_right{
        width: 100%;
        height: 120px;
        margin-top: 20px;
        /*word-break: break-all;*/
    }
    .chat_right_item_1{
        width: 50px;
        height: 50px;
        background-color: #4459AB;
        float: right;
        margin-top: 10px;
        margin-left: 10px;
        margin-right: 10px;
        text-align: center;
        line-height: 50px;
        color: white;
        border-radius: 25px;

    }
    .chat_right_item_2{
        width: 55%;
        height: 100px;
        float: right;
        margin-top: 10px;
    }
    .chat_right_time{
        width: 100%;
        text-align: right;
    }
    .chat_right_content{
        float: right;
        padding: 15px;
        border-radius: 10px;
        margin-top: 10px;
        border-top-right-radius: 0px;
        background-color: #4F7cff;
        color: white;
    }
    /* foot */
    .chat_foot{
        width: 450px;
        height: 130px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        position: relative;
    }
    .chat_context{
        width: 100%;
        height: 100%;
        font-size: 17px;
        box-sizing: border-box;
        outline: none;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        border-width: 0px;
        padding: 16px;
    }
    .chat_commit{
        width: 80px;
        height: 30px;
        color: white;
        background-color: #4F7cff;
        line-height: 30px;
        text-align: center;
        border-radius: 5px;
        position: absolute;
        right: 10px;
        bottom: 20px;
        margin-right: 10px;
    }
    .chat_context{
        resize: none;
    }
    .chat_context::placeholder{
        color: black;
        font-weight: 500k;
    }
    .line{
        width: 100%;
        border-top: 1px;
        border-color: #f4f5f7;
        border-style: solid;
    }
</style>
<body>
<!-- entry -->
<div class="chat_commento">
    <!-- top -->
    <div class="chat_top">
        ${friend.user_name}
    </div>
    <!-- line -->
    <div class="line"></div>
    <!-- middle -->
    <div class="chat_middle" id="chat_middle_item">
    </div>
    <!-- line -->
    <div class="line"></div>
    <!-- foot -->
    <div class="chat_foot">
        <!-- context -->
        <textarea class="chat_context" id="chat_context_item" cols="30" rows="10" placeholder="请输入"></textarea>
        <div class="chat_commit" id="button" style="cursor: pointer">发送</div>
    </div>
</div>
<script type="text/javascript">
    var domBtm=document.getElementById("button");
    var index = setInterval(x,1000);
    function x() {
        $.post("http://localhost:8080/acceptMes.do","action=acceptMes",function (data) {
            console.log(data)

                let html = "";
                // let html = $("#chat_middle_item").html();
                $.each(data,function (n,value) {
                    html += y(value);
                })
                // $("#chat_middle_item").append(html)
                $("#chat_middle_item").html(html);


        },"json");
    }

    function y(data) {
        var mes = data.substring(data.indexOf(":")+1);
        var head = data.substring(0,data.indexOf(":"));

        var date=new Date();
        var hour=date.getHours();
        var mm=date.getMinutes();
        var time=hour+':'+mm;
        var nameleft = "${friend.user_name}";
        var nameR = "自己";
        // if (data==str){
        if (head==(<%=session.getAttribute("userId")%>+"-"+${friend.id})){
        return `<div class="chat_right">
                 <div class="chat_right_item_1 ">`+nameR+`</div>
                 <div class="chat_right_item_2">
                 <div class="chat_right_time">`+time+`</div>
                 <div class="chat_right_content">`+
        mes+
        `</div></div></div>`
        }
        return `<div class="chat_left clearfix">
                 <div class="chat_left_item_1 ">`+nameleft+`</div>
                 <div class="chat_left_item_2">
                 <div class="chat_time">`+time+`</div>
                 <div class="chat_left_content">`+
                    mes+
                `</div></div></div>`;
    }

    domBtm.addEventListener("click",function(){
        var message=document.getElementById("chat_context_item");
        var str = message.value;
        $.post("http://localhost:8080/talkfriend.do",str,function () {

        },"json");
        message.value="";
    });
    var domBtmKeydown=document.getElementById("chat_context_item");
    domBtmKeydown.addEventListener("keydown", function(event){
        if (event.keyCode=="13"){
        var message=document.getElementById("chat_context_item");
        // var str=message.value;
        var str = message.value;
        // alert(str);
        $.post("http://localhost:8080/talkfriend.do",str,function () {

        },"json");
        message.value=null;
        event.returnValue=null;
    }
    });

    // 浏览器关闭事件
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
    var isIE11 = userAgent.indexOf("rv:11.0") > -1; //判断是否是IE11浏览器
    var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
    if(!isIE && !isEdge && !isIE11) {//兼容chrome和firefox
        var _beforeUnload_time = 0, _gap_time = 0;
        var is_fireFox = navigator.userAgent.indexOf("Firefox")>-1;//是否是火狐浏览器
        window.onunload = function (){
            _gap_time = new Date().getTime() - _beforeUnload_time;
            if(_gap_time <= 5){
                //执行浏览器关闭你所要做的事情比如登出
                $.post('/user/logout.do');
            }else{//浏览器刷新
            }
        }
        window.onbeforeunload = function (){
            _beforeUnload_time = new Date().getTime();
            if(is_fireFox){//火狐关闭执行
                //执行浏览器关闭你所要做的事情比如登出
                $.post('/user/logout.do');
            }
        };
    }


</script>
</body>
</html>