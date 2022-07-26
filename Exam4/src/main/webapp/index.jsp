<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/15
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="denglu.do">
    id:<input name="userId"><br>
    <input type="submit" value="登录">
  </form>

  <script type="text/javascript">
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
          // $.post('logout.do');
          window.location.href="http://localhost:8083/user/logout.do";
        }else{//浏览器刷新
        }
      }
      window.onbeforeunload = function (){
        _beforeUnload_time = new Date().getTime();
        if(is_fireFox){//火狐关闭执行
          //执行浏览器关闭你所要做的事情比如登出
          // $.post('logout.do');
          window.location.href="http://localhost:8083/user/logout.do";
        }
      };
    }
  </script>
  </body>

</html>
