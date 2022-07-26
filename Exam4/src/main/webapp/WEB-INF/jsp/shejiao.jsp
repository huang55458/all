<%--
  Created by IntelliJ IDEA.
  User: 动手打我110
  Date: 2022/7/11
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="${pageContext.request.contextPath}/image/png" href="../../img/logo.png">
  <title>Vogel - Social Network & Community HTML Template</title>
  <meta name="description" content="Vogel - Social Network & Community HTML Template" />
  <meta name="keywords" content="bootstrap5, e-learning, forum, games, online course, Social Community, social events, social feed, social media, social media template, social network html, social sharing, twitter" />

  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/vendor/slick/slick/slick.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/slick/slick/slick-theme.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/vendor/icofont/icofont.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/vendor/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css">

  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/jquery-3.3.1.min.js"></script>
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
          $.post('logout.do');
          // window.location.href="http://localhost:8080/user/logout.do";
        }else{//浏览器刷新
        }
      }
      window.onbeforeunload = function (){
        _beforeUnload_time = new Date().getTime();
        if(is_fireFox){//火狐关闭执行
          //执行浏览器关闭你所要做的事情比如登出
          $.post('logout.do');
          // window.location.href="http://localhost:8080/user/logout.do";
        }
      };
    }
    if(isEdge){
      var _beforeUnload_time = 0, _gap_time = 0;
      var is_fireFox = navigator.userAgent.indexOf("Firefox")>-1;//是否是火狐浏览器
      window.onunload = function (){
        _gap_time = new Date().getTime() - _beforeUnload_time;
        if(_gap_time <= 5){
          //执行浏览器关闭你所要做的事情比如登出
          $.post('logout.do');
          // window.location.href="http://localhost:8080/user/logout.do";
        }else{//浏览器刷新
        }
      }

    }
  </script>
</head>
<body class="bg-light">
<div class="web-none d-flex align-items-center px-3 pt-3">
  <a href="../../main.jsp" class="text-decoration-none">
    <img src="${pageContext.request.contextPath}/img/logo.png" class="img-fluid logo-mobile" alt="brand-logo">
  </a>
  <button class="ms-auto btn btn-primary ln-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
    <span class="material-icons">menu</span>
  </button>
</div>
<div class="py-4">
  <div class="container">
    <div class="row position-relative">

      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12" >
        <div class="d-flex align-items-center justify-content-between mb-1">
          <h6 class="mb-0 fw-bold text-body">聊天</h6>
        </div>
        <div id="incluePage1">
          <%@ include file="talking.jsp"%>
        </div>
      </main>

      <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
        <div class="p-2 bg-light offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample">
          <div class="sidebar-nav mb-3">
            <div class="pb-4">
              <a href="index.html" class="text-decoration-none">
                <img src="${pageContext.request.contextPath}/img/logo.png" class="img-fluid logo" alt="brand-logo">
              </a>
            </div>
            <ul class="navbar-nav justify-content-end flex-grow-1">
              <li class="nav-item">
                <a href="http://localhost:8080/toMessagePage.do" class="nav-link active"><span class="material-icons me-3">house</span> <span>首页</span></a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link"><span class="material-icons me-3">account_circle</span> <span>社交</span></a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link" style="position: relative"><span class="material-icons me-3">explore</span> <span>通知</span>
                <div style="position: absolute;width: 6px;height: 6px;background: red;border-radius: 50%;right: -5px;top: 0px"></div>
                </a>
              </li>
<%--              <li class="nav-item">--%>
<%--                <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#languageModal"><span class="material-icons me-3">translate</span> <span>Language</span></a>--%>
<%--              </li>--%>
              <li class="nav-item">
                <a href="#" class="nav-link"><span class="material-icons me-3">logout</span> <span>退出</span></a>
              </li>
<%--              <li class="nav-item dropdown">--%>
<%--                <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                  <span class="material-icons me-3">web</span> Pages--%>
<%--                </a>--%>
<%--                <ul class="dropdown-menu px-2 py-1 mb-2" aria-labelledby="offcanvasNavbarDropdown">--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="contact.html">Contact</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="faq.html">FAQ</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="404.html">404 Error</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="edit-profile.html">Edit Profile</a></li>--%>
<%--                </ul>--%>
<%--              </li>--%>
<%--              <li class="nav-item">--%>
<%--                <a href="tags.html" class="nav-link"><span class="material-icons me-3">local_fire_department</span> <span>Trending</span></a>--%>
<%--              </li>--%>
            </ul>
          </div>
        </div>

        <div class="ps-0 m-none fix-sidebar">
          <div class="sidebar-nav mb-3">
            <div class="pb-4 mb-4">
              <a href="index.html" class="text-decoration-none">
                <img src="${pageContext.request.contextPath}/img/logo.png" class="img-fluid logo" alt="brand-logo">
              </a>
            </div>
            <ul class="navbar-nav justify-content-end flex-grow-1">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/main.jsp" class="nav-link"><span class="material-icons me-3">house</span> <span>首页</span></a>
              </li>
              <li class="nav-item">
                <a href="/toSheJiaoPage.do" class="nav-link active"><span class="material-icons me-3">account_circle</span> <span>社交</span></a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/message.jsp" class="nav-link" style="position: relative"><span class="material-icons me-3">explore</span> <span>通知</span>
                  <div id="redpoint" style="display:none;position: absolute;width: 6px;height: 6px;background: red;border-radius: 50%;left: 14px;top: 14px"></div></a>
              </li>
              <script type="text/javascript">
                $.ajax({
                  type:"POST",
                  url:"http://localhost:8080/messageFind.do",
                  contentType:"application/json;charset=utf-8",
                  success:function(data){
                    console.log(data);
                    if (data=="0"){
                      $("#redpoint").hide();
                    }else if (data == "1"){
                      $("#redpoint").show();
                    }
                  }})





                var sendDSQ = setInterval(messSend,3000);
                function messSend(){
                  $.ajax({
                    type:"POST",
                    url:"http://localhost:8080/messageFind.do",
                    contentType:"application/json;charset=utf-8",
                    success:function(data){
                      if (data=="0"){
                        $("#redpoint").hide();
                      }else if (data == "1"){
                        $("#redpoint").show();
                      }
                    }
                  })
                }
              </script>



              <li class="nav-item">
                <a href="#" class="nav-link"><span class="material-icons me-3">logout</span> <span>退出</span></a>
              </li>
<%--              <li class="nav-item dropdown">--%>
<%--                <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                  <span class="material-icons me-3">web</span> Pages--%>
<%--                </a>--%>
<%--                <ul class="dropdown-menu px-2 py-1 mb-2" aria-labelledby="offcanvasNavbarDropdown">--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="contact.html">Contact</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="faq.html">FAQ</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="404.html">404 Error</a></li>--%>
<%--                  <li><a class="dropdown-item rounded-3 px-2 py-1 my-1" href="edit-profile.html">Edit Profile</a></li>--%>
<%--                </ul>--%>
<%--              </li>--%>
<%--              <li class="nav-item">--%>
<%--                <a href="tags.html" class="nav-link"><span class="material-icons me-3">local_fire_department</span> <span>Trending</span></a>--%>
<%--              </li>--%>
            </ul>
          </div>
        </div>
      </aside>
      <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
        <div class="fix-sidebar">
          <div class="side-trend lg-none">

            <div class="sticky-sidebar2 mb-3">
<%--              <div class="input-group mb-4 shadow-sm rounded-4 overflow-hidden py-2 bg-white">--%>
<%--                <span class="input-group-text material-icons border-0 bg-white text-primary">search</span>--%>
<%--                <input type="text" class="form-control border-0 fw-light ps-1" placeholder="Search Vogel">--%>
<%--              </div>--%>
              <div class="bg-white rounded-4 overflow-hidden shadow-sm account-follow mb-4">
                <h6 class="fw-bold text-body p-3 mb-0 border-bottom">我的好友</h6>
                <div id="showMyfriendsList">
                  <%@include file="/myFreindsList.jsp"%>
                  <%--                  <jsp:include page="myFreindsList.jsp"></jsp:include>--%>
                </div>
                <script>
                  $.ajax({
                    type:"POST",
                    url:"http://localhost:8080/myAllFriendsListssss.do",
                    contentType:"application/json;charset=utf-8",
                    success(data){
                      $("#showMyfriendsList").load("${pageContext.request.contextPath}/myFreindsList.jsp");
                    }
                  })
                  // function showmyfriendsList() {
                  var shuax2 = setInterval(shuax2,3000);
                  // }
                  function shuax2() {
                    $.ajax({
                      type:"POST",
                      url:"http://localhost:8080/myAllFriendsListssss.do",
                      contentType:"application/json;charset=utf-8",
                      success:function(data){
                        $("#showMyfriendsList").load("${pageContext.request.contextPath}/myFreindsList.jsp");

                      }
                    })
                  }
                </script>


                <a href="${pageContext.request.contextPath}/main.jsp" class="text-decoration-none">
                  <div class="p-3">发现更多...</div>
                </a>
              </div>
              <div class="bg-white rounded-4 overflow-hidden shadow-sm account-follow mb-4">
                <h6 class="fw-bold text-body p-3 mb-0 border-bottom">我的黑名单</h6>

                <div id="banMyfriendsList">
                  <%@include file="/myBanFreindsList.jsp"%>
                  <%--                  <jsp:include page="myFreindsList.jsp"></jsp:include>--%>
                </div>
                <script>
                  $.ajax({
                    type:"POST",
                    url:"http://localhost:8080/myAllbansListssss.do",
                    contentType:"application/json;charset=utf-8",
                    success(data){
                      $("#banMyfriendsList").load("${pageContext.request.contextPath}/myBanFreindsList.jsp");
                    }
                  })
                  // function showmyfriendsList() {
                  var shuax2 = setInterval(shuax2,3000);
                  // }
                  function shuax2() {
                    $.ajax({
                      type:"POST",
                      url:"http://localhost:8080/myAllbansListssss.do",
                      contentType:"application/json;charset=utf-8",
                      success:function(data){
                        $("#banMyfriendsList").load("${pageContext.request.contextPath}/myBanFreindsList.jsp");

                      }
                    })
                  }
                </script>





              </div>
            </div>
          </div>
        </div>
      </aside>
    </div>
  </div>
</div>
<div class="py-3 bg-white footer-copyright">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-8">
        <span class="me-3 small">©2022 <b class="text-primary">Your Website</b>啊绅出品</span>
      </div>
      <div class="col-md-4 text-end">
        <a target="_blank" href="#" class="btn social-btn btn-sm text-decoration-none"><i class="icofont-facebook"></i></a>
        <a target="_blank" href="#" class="btn social-btn btn-sm text-decoration-none"><i class="icofont-twitter"></i></a>
        <a target="_blank" href="#" class="btn social-btn btn-sm text-decoration-none"><i class="icofont-linkedin"></i></a>
        <a target="_blank" href="#" class="btn social-btn btn-sm text-decoration-none"><i class="icofont-youtube-play"></i></a>
        <a target="_blank" href="#" class="btn social-btn btn-sm text-decoration-none"><i class="icofont-instagram"></i></a>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 p-4 border-0 bg-light">
      <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
        <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal">arrow_back_ios_new</a>
        <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
      </div>
      <div class="modal-body p-0 mb-3">
        <div class="form-floating">
          <textarea class="form-control rounded-5 border-0 shadow-sm" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
          <label for="floatingTextarea2" class="h6 text-muted mb-0">What's on your mind...</label>
        </div>
      </div>
      <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
        <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
          <a href="#" class="text-muted text-decoration-none material-icons">insert_link</a>
          <a href="#" class="text-muted text-decoration-none material-icons">image</a>
          <a href="#" class="text-muted text-decoration-none material-icons">smart_display</a>
          <span class="text-muted">0/500</span>
        </div>
        <div class="ms-auto m-0">
          <a data-bs-dismiss="modal" href="#" class="btn btn-primary rounded-5 fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center"><span class="material-icons me-2 md-16">send</span>Post</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 p-4 border-0">
      <div class="modal-header border-0 p-1">
        <h6 class="modal-title fw-bold text-body fs-6" id="exampleModalLabel">Choose Language</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form>
        <div class="modal-body p-0">
          <div class="row py-3 gy-3 m-0">

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="hindi11">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="hindi11">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">हिंदी</small>
                                        <small class="ln-18">Hindi</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="english21" checked>
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="english21">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">English</small>
                                        <small class="ln-18">English</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="kannada31">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="kannada31">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">ಕನ್ನಡ</small>
                                        <small class="ln-18">kannada</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="tamil41">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="tamil41">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">தமிழ்</small>
                                        <small class="ln-18">Tamil</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi51">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi51">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">ਪੰਜਾਬੀ</small>
                                        <small class="ln-18">Punjabi</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi5111">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi5111">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">Türk</small>
                                        <small class="ln-18">Turkish</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi511">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi511">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">français</small>
                                        <small class="ln-18">French</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="other1">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="other1">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">Other</small>
                                        <small class="ln-18">Other</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>
          </div>
          <div class="mt-5 login-register" id="number">
            <h6 class="fw-bold mx-1 mb-2 text-dark">Register your Mobile Number</h6>
            <div class="row mx-0 mb-3">
              <div class="col-3 p-1">
                <div class="form-floating">
                  <select class="form-select rounded-5" id="floatingSelect" aria-label="Floating label select example">
                    <option selected>+91</option>
                    <option value="1">+34</option>
                    <option value="2">+434</option>
                    <option value="3">+343</option>
                  </select>
                  <label for="floatingSelect">Code</label>
                </div>
              </div>
              <div class="col-9 p-1">
                <div class="form-floating d-flex align-items-end">
                  <input type="text" class="form-control rounded-5" id="floatingName" value="1234567890" placeholder="Enter Mobile Number">
                  <label for="floatingName">Enter Mobile Number</label>
                </div>
              </div>
            </div>
            <div class="p-1">
              <button type="button" class="btn btn-primary w-100 text-decoration-none rounded-5 py-3 fw-bold text-uppercase m-0" data-bs-dismiss="modal">Send OTP</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="languageModal" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 rounded-4 p-4">
      <div class="modal-header border-0 p-1">
        <h6 class="modal-title fw-bold text-body fs-6 d-flex justify-content-center" id="exampleModalLabel1">Choose Language</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form>
        <div class="modal-body pt-0 px-0">
          <div class="row py-3 gy-3 m-0">

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="hindi1">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="hindi1">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">हिंदी</small>
                                        <small class="ln-18">Hindi</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="english2" checked>
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="english2">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">English</small>
                                        <small class="ln-18">English</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="kannada3">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="kannada3">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">ಕನ್ನಡ</small>
                                        <small class="ln-18">kannada</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="tamil4">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between" for="tamil4">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">தமிழ்</small>
                                        <small class="ln-18">Tamil</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi5">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi5">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">ਪੰਜਾਬੀ</small>
                                        <small class="ln-18">Punjabi</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi511f">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi511f">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">Türk</small>
                                        <small class="ln-18">Turkish</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="punjabi51f">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="punjabi51f">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">français</small>
                                        <small class="ln-18">French</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>

            <div class="langauge-item col-6 col-md-3 px-1 mt-2">
              <input type="radio" class="btn-check" name="options-outlined" id="other">
              <label class="btn btn-language btn-sm px-2 py-2 rounded-5 d-flex align-items-center justify-content-between mb-2" for="other">
                                    <span class="text-start d-grid">
                                        <small class="ln-18">Other</small>
                                        <small class="ln-18">Other</small>
                                    </span>
                <span class="material-icons text-muted md-20">check_circle</span>
              </label>
            </div>
          </div>
        </div>
        <div class="modal-footer border-0 p-1">
          <button type="button" class="btn btn-primary w-100 text-decoration-none rounded-5 py-3 fw-bold text-uppercase m-0" data-bs-dismiss="modal">Submit</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 overflow-hidden border-0">
      <div class="modal-header d-none">
        <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-0">
        <div class="row m-0">
          <div class="col-sm-7 px-0 m-sm-none">

            <div class="image-slider">
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/img/post-img1.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/img/post-img2.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/img/post-img3.jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
          </div>
          <div class="col-sm-5 content-body px-web-0">
            <div class="d-flex flex-column h-600">
              <div class="d-flex p-3 border-bottom">
                <img src="${pageContext.request.contextPath}/img/rmate4.jpg" class="img-fluid rounded-circle user-img" alt="profile-img">
                <div class="d-flex align-items-center justify-content-between w-100">
                  <a href="profile.html" class="text-decoration-none ms-3">
                    <div class="d-flex align-items-center">
                      <h6 class="fw-bold text-body mb-0">iamosahan</h6>
                      <p class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon mb-0">done</p>
                    </div>
                    <p class="text-muted mb-0 small">@johnsmith</p>
                  </a>
                  <div class="small dropdown">
                    <a href="#" class="text-muted text-decoration-none material-icons ms-2 md-" data-bs-dismiss="modal">close</a>
                  </div>
                </div>
              </div>
              <div class="comments p-3">
                <div class="d-flex mb-2">
                  <img src="${pageContext.request.contextPath}/img/rmate1.jpg" class="img-fluid rounded-circle" alt="profile-img">
                  <div class="ms-2 small">
                    <div class="bg-light px-3 py-2 rounded-4 mb-1 chat-text">
                      <p class="fw-500 mb-0">Macie Bellis</p>
                      <span class="text-muted">Consectetur adipisicing elit.</span>
                    </div>
                    <div class="d-flex align-items-center ms-2">
                      <a href="#" class="small text-muted text-decoration-none">Like</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <a href="#" class="small text-muted text-decoration-none">Reply</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <span class="small text-muted">1h</span>
                    </div>
                  </div>
                </div>
                <div class="d-flex mb-2">
                  <img src="${pageContext.request.contextPath}/img/rmate3.jpg" class="img-fluid rounded-circle" alt="profile-img">
                  <div class="ms-2 small">
                    <div class="bg-light px-3 py-2 rounded-4 mb-1 chat-text">
                      <p class="fw-500 mb-0">John Smith</p>
                      <span class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</span>
                    </div>
                    <div class="d-flex align-items-center ms-2">
                      <a href="#" class="small text-muted text-decoration-none">Like</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <a href="#" class="small text-muted text-decoration-none">Reply</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <span class="small text-muted">20min</span>
                    </div>
                  </div>
                </div>
                <div class="d-flex mb-2">
                  <img src="${pageContext.request.contextPath}/img/rmate2.jpg" class="img-fluid rounded-circle" alt="profile-img">
                  <div class="ms-2 small">
                    <div class="bg-light px-3 py-2 rounded-4 mb-1 chat-text">
                      <p class="fw-500 mb-0">Shay Jordon</p>
                      <span class="text-muted">With our vastly improved notifications system, users have more control.</span>
                    </div>
                    <div class="d-flex align-items-center ms-2">
                      <a href="#" class="small text-muted text-decoration-none">Like</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <a href="#" class="small text-muted text-decoration-none">Reply</a>
                      <span class="fs-3 text-muted material-icons mx-1">circle</span>
                      <span class="small text-muted">10min</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="border-top p-3 mt-auto">
                <div class="d-flex align-items-center justify-content-between mb-2">
                  <div>
                    <a href="#" class="text-muted text-decoration-none d-flex align-items-start fw-light"><span class="material-icons md-20 me-2">thumb_up_off_alt</span><span>30.4k</span></a>
                  </div>
                  <div>
                    <a href="#" class="text-muted text-decoration-none d-flex align-items-start fw-light"><span class="material-icons md-20 me-2">repeat</span><span>617</span></a>
                  </div>
                  <div>
                    <a href="#" class="text-muted text-decoration-none d-flex align-items-start fw-light"><span class="material-icons md-18 me-2">share</span><span>Share</span></a>
                  </div>
                </div>
                <div class="d-flex align-items-center">
                  <span class="material-icons bg-white border-0 text-primary pe-2 md-36">account_circle</span>
                  <div class="d-flex align-items-center border rounded-4 px-3 py-1 w-100">
                    <input type="text" class="form-control form-control-sm p-0 rounded-3 fw-light border-0" placeholder="Write Your comment">
                    <a href="#" class="bg-white border-0 text-primary ps-2 text-decoration-none">Post</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer d-none">
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js" type="b8a3f82afc75d807e2f4fd72-text/javascript"></script>

<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js" type="b8a3f82afc75d807e2f4fd72-text/javascript"></script>

<script src="${pageContext.request.contextPath}/js/custom.js" type="b8a3f82afc75d807e2f4fd72-text/javascript"></script>

<script src="${pageContext.request.contextPath}/vendor/slick/slick/slick.min.js" type="b8a3f82afc75d807e2f4fd72-text/javascript"></script>

</body>
</html>

