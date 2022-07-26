<%--
  Created by IntelliJ IDEA.
  User: 0.0
  Date: 2022/7/16
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object o = session.getAttribute("user");
//    System.out.println("开始验证");
    if (o == null){
        response.sendRedirect("/");
//        System.out.println("重定向");
    }
%>
<html>
  <head>
    <title>$Title$</title>

      <script src="/js/jquery-3.6.0.js"></script>

    <style>
      /*!
     * CSS3 3D图书展示 (3D Book Showcase)
     * Copyright (c) 2013, 梦幻神化
     * http://www.bluesdream.com
     *
     * Create: 2013.01.28
     *
     */

      /* = Reset
      -------------------------------------------------------------- */
      *{ margin:0; padding:0;}

      /* = Global
      -------------------------------------------------------------- */
      body {
        font-family: 'Cardo',Arial,sans-serif;
        /*background:url(img.jpg);*/
      }
      .txt-right{
        text-align:right;
      }
      .demo-title{
        height:32px;
        font-size:32px; color:#92684F; text-align:center;
        margin:30px 0 44px 0;
        text-shadow:0 2px 4px rgba(41,48,58,0.3);
      }
      #book {
        width: 420px;
        margin: 0 auto;
        position: relative;
        -webkit-transition-duration: .5s;
        -moz-transition-duration: .5s;
        -ms-transition-duration: .5s;
        -o-transition-duration: .5s;
        transition-duration: .5s;
        -webkit-perspective: 2000px;
        -moz-perspective: 2000px;
        -ms-perspective: 2000px;
        -o-perspective: 2000px;
        perspective: 2000px;
      }
      .main {
        width: 420px;
        height: 560px;
        color: #92684F;
        position: relative;
        -webkit-transform-style: preserve-3d;
        -moz-transform-style: preserve-3d;
        -ms-transform-style: preserve-3d;
        transform-style: preserve-3d;
        -webkit-transition-duration: .5s;
        -moz-transition-duration: .5s;
        -ms-transition-duration: .5s;
        -o-transition-duration: .5s;
        transition-duration: .5s;
      }

      /* = Book Font
      -------------------------------------------------------------- */
      .book-font{
        width:420px; height:560px;
        position:absolute; top:0; bottom:0;
        font-size:15px; text-align:center;
        text-shadow:0 2px 0 rgba(30,35,45,1);
        box-shadow:inset 3px 0 10px rgba(0,0,0,0.1); /* 给书本添加光照阴影 */
        z-index:10;
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        -o-transform-style:preserve-3d;
        transform-style:preserve-3d;

        -webkit-transform-origin:0% 50%;
        -moz-transform-origin:0% 50%;
        -ms-transform-origin:0% 50%;
        -o-transform-origin:0% 50%;
        transform-origin:0% 50%;

        -webkit-transition-duration:.5s;
        -moz-transition-duration:.5s;
        -ms-transition-duration:.5s;
        -o-transition-duration:.5s;
        transition-duration:.5s;

        -webkit-transform:translate3d(0,0,25px); /* 对应关系-1 */
        -moz-transform:translate3d(0,0,25px);
        -ms-transform:translate3d(0,0,25px);
        -o-transform:translate3d(0,0,25px);
        transform:translate3d(0,0,25px);
      }
      .book-cover{
        width:420px; height:560px;
        overflow:hidden;
        position:absolute; top:0; bottom:0;
        background:#29303A url(/img/img.jpg) 0 200px no-repeat;
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        -o-transform-style:preserve-3d;
        transform-style:preserve-3d;

        -webkit-backface-visibility:hidden;
        -moz-backface-visibility:hidden;
        -ms-backface-visibility:hidden;
        -o-backface-visibility:hidden;
        backface-visibility:hidden;
      }
      .book-cover-back{
        width:420px; height:560px;
        position:absolute; top:0; bottom:0;
        background:#29303A;
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        -o-transform-style:preserve-3d;
        transform-style:preserve-3d;

        -webkit-backface-visibility:hidden;
        -moz-backface-visibility:hidden;
        -ms-backface-visibility:hidden;
        -o-backface-visibility:hidden;
        backface-visibility:hidden;

        -webkit-transform:rotate3d(0,1,0,-180deg);
        -moz-transform:rotate3d(0,1,0,-180deg);
        -ms-transform:rotate3d(0,1,0,-180deg);
        -o-transform:rotate3d(0,1,0,-180deg);
        transform:rotate3d(0,1,0,-180deg);
      }
      .title{
        margin:70px 0 25px 0;
        height:38px;
        font-size:38px;
      }
      .author{
        height:20px;
        font-size:20px;
      }
      .publisher{
        width:100%;
        position:absolute;
        bottom:22px;
      }

      /* = Book Page
      -------------------------------------------------------------- */
      .book-page{
        width:415px; height:550px;
        line-height:20px;
        position:absolute; top:5px;
        z-index:9;
        box-shadow:inset 3px 0 10px rgba(0,0,0,0.1);
        -webkit-transform-style:preserve-3d;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        -o-transform-style:preserve-3d;
        transform-style:preserve-3d;

        -webkit-transition-duration:.5s;
        -moz-transform-style:preserve-3d;
        -ms-transform-style:preserve-3d;
        -o-transform-style:preserve-3d;
        transform-style:preserve-3d;

        -webkit-transform:translate3d(0,0,24px); /* 这里的Z坐标 一定要比封面页的低 否则旋转的时候 渲染时会导致层叠*/
        -moz-transform:translate3d(0,0,24px);
        -ms-transform:translate3d(0,0,24px);
        -o-transform:translate3d(0,0,24px);
        transform:translate3d(0,0,24px);
      }
      .page{
        height:500px;
        margin:30px 40px;
        overflow:hidden;
      }
      .book-page h3{
        font-size:14px;
        text-align:center;
        margin-bottom:14px;
      }
      .book-page p{
        font-size:13px;
        margin-bottom:14px;
      }
      .page-number{
        width:100%;
        font-size:13px;
        text-align:center;
        position:absolute;
        bottom:10px;
      }

      /* = Book Back
      -------------------------------------------------------------- */
      .book-back{
        width:420px;
        background:#29303A;
        position:absolute; top:0; bottom:0;
        color:white;
        -webkit-transform:rotate3d(0,1,0,-180deg) translate3d(0,0,25px);
        -moz-transform:rotate3d(0,1,0,-180deg) translate3d(0,0,25px);
        -ms-transform:rotate3d(0,1,0,-180deg) translate3d(0,0,25px);
        -o-transform:rotate3d(0,1,0,-180deg) translate3d(0,0,25px);
        transform:rotate3d(0,1,0,-180deg) translate3d(0,0,25px);
        z-index:8;
      }
      .book-back .description{
        font-size:14px;
        line-height:20px;
        margin-top:50px;
        padding:10px 20px 10px 30px;
        background:rgba(255,255,255,0.1);
      }
      .book-back p{
        padding:5px 0;
      }
      .isbn{
        position:absolute;
        bottom:20px; left:30px;
      }

      /* = Book Bone
      -------------------------------------------------------------- */
      .book-bone{
        width:50px;
        background:#29303A;
        box-shadow:1px 0 0 #29303A,-1px 0 0 #29303A; /* 旋转的时候 拼接处隐隐约约会有个缝隙 所以加上个阴影来填补它 */
        position:absolute;
        top:0; bottom:0; left:-25px;
        -webkit-transform:rotate3d(0,1,0,-90deg);
        -moz-transform:rotate3d(0,1,0,-90deg);
        -ms-transform:rotate3d(0,1,0,-90deg);
        -o-transform:rotate3d(0,1,0,-90deg);
        transform:rotate3d(0,1,0,-90deg);
      }
      .book-bone h2{
        width:530px;
        height:50px; line-height:50px; /* 对应关系-1 */
        font-size:14px; text-align:right;
        padding:0 15px;
        -webkit-transform-origin:0 0;
        -moz-transform-origin:0 0;
        -ms-transform-origin:0 0;
        -o-transform-origin:0 0;
        transform-origin:0 0;

        -webkit-transform:rotate(90deg) translateY(-50px); /* 对应关系-1 */
        -moz-transform:rotate(90deg) translateY(-50px);
        -ms-transform:rotate(90deg) translateY(-50px);
        -o-transform:rotate(90deg) translateY(-50px);
        transform:rotate(90deg) translateY(-50px);
      }
      .book-bone span{ font-size:14px; padding-right:20px;}

      /* = Order
      -------------------------------------------------------------- */
      .book-cover:after,.book-back:after{ /*  */
        content:"";
        width:3px;
        position:absolute; top:0; left:10px; bottom:0;
        background:rgba(0,0,0,0.06);
        box-shadow:1px 0 3px rgba(255, 255, 255, 0.1);
      }
      .book-page,.book-top,.book-right,.book-bottom{
        background:#EEEFE9;
      }
      .book-right{
        width:50px; height:550px;
        position:absolute; top:5px; right:-20px;
        box-shadow:0 1px 0 #EEEFE9,0 -1px 0 #EEEFE9;
        -webkit-transform:rotate3d(0,1,0,90deg);
        -moz-transform:rotate3d(0,1,0,90deg);
        -ms-transform:rotate3d(0,1,0,90deg);
        -o-transform:rotate3d(0,1,0,90deg);
        transform:rotate3d(0,1,0,90deg);
      }
      .book-top{
        width:415px; height:50px;
        position:absolute; top:-20px; left:0;
        -webkit-transform:rotate3d(1,0,0,90deg);
        -moz-transform:rotate3d(1,0,0,90deg);
        -ms-transform:rotate3d(1,0,0,90deg);
        -o-transform:rotate3d(1,0,0,90deg);
        transform:rotate3d(1,0,0,90deg);
      }
      .book-bottom{
        width:415px; height:50px;
        position:absolute; bottom:-20px; left:0;
        -webkit-transform:rotate3d(1,0,0,-90deg) translate3d(0,0,0);
      -moz-rotate3d(1,0,0,-90deg) translate3d(0,0,0);
      -ms-rotate3d(1,0,0,-90deg) translate3d(0,0,0);
      -o-rotate3d(1,0,0,-90deg) translate3d(0,0,0);
      rotate3d(1,0,0,-90deg) translate3d(0,0,0);
      }
      .book-right,.book-top,.book-bottom{
        -webkit-backface-visibility:hidden;
        -moz-backface-visibility:hidden;
        -ms-backface-visibility:hidden;
        -o-backface-visibility:hidden;
        backface-visibility:hidden;
      }

      /* = Flip
      -------------------------------------------------------------- */
      /* Cover */
      .view-cover:hover .main{
        -webkit-transform:rotate3d(0,1,0,-40deg);
        -moz-transform:rotate3d(0,1,0,-40deg);
        -ms-transform:rotate3d(0,1,0,-40deg);
        -o-transform:rotate3d(0,1,0,-40deg);
        transform:rotate3d(0,1,0,-40deg);
      }
      /* Cover Back */
      .view-back .main{
        -webkit-transform:rotate3d(0,1,0,180deg);
        -moz-transform:rotate3d(0,1,0,180deg);
        -ms-transform:rotate3d(0,1,0,180deg);
        -o-transform:rotate3d(0,1,0,180deg);
        transform:rotate3d(0,1,0,180deg);
      }
      .view-back:hover .main{
        -webkit-transform:rotate3d(0,1,0,140deg);
        -moz-transform:rotate3d(0,1,0,140deg);
        -ms-transform:rotate3d(0,1,0,140deg);
        -o-transform:rotate3d(0,1,0,140deg);
        transform:rotate3d(0,1,0,140deg);
      }
      /* Open */
      .open-book{
        -webkit-transform:translate3d(50%,0,0);
        -moz-transform:translate3d(50%,0,0);
        -ms-transform:translate3d(50%,0,0);
        -o-transform:translate3d(50%,0,0);
        transform:translate3d(50%,0,0);
      }
      .open-book  .book-font{
        -webkit-transform:translate3d(0,0,25px) rotate3d(0,1,0,-160deg);
        -moz-transform:translate3d(0,0,25px) rotate3d(0,1,0,-160deg);
        -ms-transform:translate3d(0,0,25px) rotate3d(0,1,0,-160deg);
        -o-transform:translate3d(0,0,25px) rotate3d(0,1,0,-160deg);
        transform:translate3d(0,0,25px) rotate3d(0,1,0,-160deg);
      }
      .open-book:hover .main{
        -webkit-transform:rotate3d(1,1,0,15deg);
        -moz-transform:rotate3d(1,1,0,15deg);
        -ms-transform:rotate3d(1,1,0,15deg);
        -o-transform:rotate3d(1,1,0,15deg);
        transform:rotate3d(1,1,0,15deg);
      }
      /* View Right */
      .view-rotate .main{
        -webkit-transition-duration:5s;
        -moz-transition-duration:5s;
        -ms-transition-duration:5s;
        -o-transition-duration:5s;
        transition-duration:5s;

        -webkit-transform:rotate3d(0,1,0,360deg);
        -moz-transform:rotate3d(0,1,0,360deg);
        -ms-transform:rotate3d(0,1,0,360deg);
        -o-transform:rotate3d(0,1,0,360deg);
        transform:rotate3d(0,1,0,360deg);
      }
      .view-rotate:hover .main{
        -webkit-transition-duration:8s;
        -moz-transition-duration:8s;
        -ms-transition-duration:8s;
        -o-transition-duration:8s;
        transition-duration:8s;

        -webkit-transform:rotate3d(0,1,0,-360deg);
        -moz-transform:rotate3d(0,1,0,-360deg);
        -ms-transform:rotate3d(0,1,0,-360deg);
        -o-transform:rotate3d(0,1,0,-360deg);
        transform:rotate3d(0,1,0,-360deg);
      }

      /* = Opt
      -------------------------------------------------------------- */
      #opt{
        width:150px;
        line-height:30px;
        text-align:center;
        padding:10px 10px 5px 10px;
        background:rgba(255,255,255,0.4);
        position:fixed; top:10%; right:6%;
        z-index:100;
      }
      #opt:after{
        content:"";
        width:105%; height:104%;
        position:absolute; top:-4%; left:-5%;
        border:4px solid rgba(255,255,255,0.3);
        z-index:-1;
      }
      #opt dt{
        margin-bottom:5px;
        border-bottom:1px solid rgba(0,0,0,0.1);
      }
      #opt dd{
        color:#999;
        cursor:pointer;
        background:rgba(170,170,170,0.1);
        margin-bottom:5px;
      }
      #opt dd:hover{
        color:rgba(255,255,255,0.8);
        box-shadow:inset 2px 0 0 rgba(85,85,85,0.2);
        background:rgba(85,85,85,0.4);
      }
      #opt .cur{
        color:black;
        box-shadow:inset 2px 0 0 rgba(85,85,85,0.2);
        background:rgba(85,85,85,0.2);
      }
    </style>
  </head>
  <body>
  <div id="opt">
    <dl>
      <dt>Console</dt>
      <dd id="view-cover" class="cur">首页</dd>
      <dd id="view-back">制作人员名单</dd>
      <dd id="open-book">功能</dd>
      <dd id="view-rotate">360° 旋转</dd>
    </dl>
  </div>

  <h1 class="demo-title">考试系统展示</h1>

  <div id="book" class="view-cover">
    <div class="main">
      <div class="book-font">
        <div class="book-cover">
          <h1 class="title">欢迎你！ </h1>
          <h2 class="author">${sessionScope.user.user_name}</h2>
          <div class="publisher">路漫漫其修远兮吾将上下而求索</div>
        </div>
        <div class="book-cover-back"></div>
      </div>
      <div class="book-page">
        <div id="page-1" class="page">
          <br/>
          <br/>
          <br/>
          <h2><a href="/startExam.form">开始考试</a></h2>
          <br/>
          <br/>
          <br/>
          <h2><a href="http://localhost:8080/denglu.do?userId=${sessionScope.user.id}">交友</a></h2>
            <br/>
            <br/>
            <br/>
            <h2><a href="/welcome.form">个人中心</a></h2>
            <br/>
            <br/>
            <br/>
            <h2><a href="/user/logout3.do">登出</a></h2>
<%--          <h3>此处为标题，可舍弃</h3>--%>
<%--          <p>这里想加啥话自己加。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。</p>--%>
<%--          <p>可以加多段话。。。。。。</p>--%>
          <%--<p>A nod was the answer.</p>--%>
          <%--<p>“Mr. Lockwood, your new tenant, sir. I do myself the honour of calling as soon as possible after my arrival, to express the hope that I have not inconvenienced you by my perseverance in soliciting the occupation of Thrushcross Grange”</p>--%>
        </div>
        <div class="page-number">- 1 -</div>
      </div>
      <div class="book-back">
        <div class="description">
          <p>此处为小组成员名单及其完成的模块，如：考试模块：---</p>
          <p class="txt-right">该段落可要可不要</p>
        </div>
        <div class="isbn"><img src="/img/isbn.png"><!--图片使用的是相对路径，可能加载失败，请记得修改路径 --></div>
      </div>
      <div class="book-bone">
        <h2>此次为小组名，如果没有就算了</h2>
      </div>
      <div class="book-top"></div>
      <div class="book-right"></div>
      <div class="book-bottom"></div>
    </div>
  </div>



  <script>
      $(function(){
          var book = $('#book');
          $('#view-cover').click(function(){
              $(this).addClass('cur').siblings().removeClass('cur');
              book.removeClass().addClass('view-cover');
          });
          $('#view-back').click(function(){
              $(this).addClass('cur').siblings().removeClass('cur');
              book.removeClass().addClass('view-back');
          });
          $('#open-book').click(function(){
              if ( book.attr('class') !='open-book') {
                  $(this).addClass('cur').siblings().removeClass('cur');
                  book.removeClass().addClass('open-book');
              }else{
                  $(this).removeClass('cur');
                  $('#view-cover').addClass('cur');
                  book.removeClass().addClass('view-cover');
              }
          });
          $('#view-rotate').click(function(){
              $(this).addClass('cur').siblings().removeClass('cur');
              book.removeClass().addClass('view-rotate');
          });
      });
  </script>
  </body>
</html>
