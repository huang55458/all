
<%--
  Created by IntelliJ IDEA.
  User: 13430
  Date: 2022/7/17
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="/js/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.6.0.js"></script>

    <script src="/js/axios.min.js"></script>
    <script src="/js/qs.min.js"></script>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/theme4.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/static/layui-v2.7.5/layui/layui.js" ></script>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <script type="text/JavaScript">


        // function test(){
        //     var a = document.getElementById("cehckAll");
        //     var d = document.getElementsByName("q");
        //     for(var i=0;i<d.length;i++){
        //         d[i].checked = a.checked;
        //     }
        // }
        // function test1(){
        //     var a = document.getElementById("cehckAll");
        //     var d = document.getElementsByName("q");
        //     for(var i=0;i<d.length;i++){
        //         if(d[i].checked == false){
        //             a.checked = false;
        //             return;
        //         }
        //     }
        //     a.checked = true;
        // }

        function modify(id) {
            window.location.href="/user/tomod.do?id="+id;

        }

        function del(id) {
            window.location.href="/user/delUser.do?id="+id;

        }



    </script>
<%--    <script>--%>
<%--        // 禁用功能--%>
<%--        $(function () {--%>
<%--            $("ul.pagination li.disabled a").click(function () {--%>
<%--                return false;--%>
<%--            })--%>
<%--        });--%>
<%--    </script>--%>
<%--    <script>--%>
<%--        form.type.value = "${user.type}";--%>
<%--    </script>--%>
</head>
<body>



<%--<!-- 主要区域 --> <form action="/user/ser.do" method="post">--%>
<div id="main" class="layui-fluid">
    <!-- 操作区域 -->
        <div id="operate" class="layui-row layui-col-space15">
        <div id="operate_left" style="float: left;margin-top:2px;" class="layui-col-md12">
            <form action="${pageContext.request.contextPath}/user/userList.do?type=1" method="post">
                <div class="layui-card">
                <div class="layui-inline layui-show-xs-block">
                   <input class="layui-input" name="user_name" placeholder="姓名"/>
<%--                    用户名:<input name="login_name" />--%>

                </div>
                <div class="layui-inline layui-show-xs-block">
                <button class="layui-btn" id="btn_search">搜索</button>
                </div>
                </div>
            </form>


<%--            ID:<input type="text" name="id" value="${user.id}"/>--%>
<%--                姓名:<input type="text" name="user_name" value="${user.user_name}"/>--%>
<%--                角色:<select id="type" name="type">--%>
<%--                    <option value="1">管理员</option>--%>
<%--                    <option value="2">教师</option>--%>
<%--                    <option value="3">学生</option>--%>
<%--                    </select>--%>
<%--                <input type="submit" value="搜索" name="search"/>--%>

        </div>
    </div>

    <div id="data" class="layui-card-body ">
        <%--<table style="width:100%;border:1px solid;">--%>
        <div class="layui-table-tool">
            <div class="layui-table-tool-temp">
                <div class="layui-inline" lay-event="add">
                    <a href="/user/add.do"><i class="layui-icon layui-icon-add-1"></i></a>
                </div>
<%--                <div class="layui-inline" lay-event="update">--%>
<%--                    <a href="/user/mod.do"><i class="layui-icon layui-icon-edit"></i></a>--%>
<%--                </div>--%>
                <div class="layui-inline" lay-event="delete">
                    <a id="deleteMore" onclick="todel()" href="javascript:;">
                    <i class="layui-icon layui-icon-delete"></i></a>
                </div>
            </div>
            <div class="layui-table-tool-self">
<%--                <div class="layui-inline" title="筛选列" lay-event="LAYTABLE_COLS">--%>
<%--                    <i class="layui-icon layui-icon-cols"></i>--%>
<%--                </div>--%>
                <div class="layui-inline" title="导出" lay-event="LAYTABLE_EXPORT">
                    <i class="layui-icon layui-icon-export"></i>
                    <ul class="layui-table-tool-panel" style="max-height: 370px;">
<%--                        <li data-type="csv">导出到 Csv 文件</li>--%>
                        <li data-type="xls" id="exportActivityAllBtn">导出到 Excel 文件</li>
                    </ul>
                </div>
<%--                <div class="layui-inline" title="打印" lay-event="LAYTABLE_PRINT">--%>
<%--                    <i class="layui-icon layui-icon-print"></i>--%>
<%--                </div>--%>
            </div>
        </div>
        <table id="datalist" class="layui-table" lay-filter="user-table">
            <tr id="d1">
                <th><input type="checkbox" value="全选"  id="checkAll"  onclick="test(q);">
                    <span>全选</span></th>
                <td>用户id</td>
                <td>头像</td>
                <td>登录名</td>
                <%--    <td>密码</td>--%>
                <td>联系电话</td>
                <td>邮箱</td>
                <td>用户名</td>
                <td>状态</td>
                <td>创建时间</td>
                <td>更新时间</td>
                <td>用户类型</td>
                <td>操作</td>
            </tr>
            <tbody class="layui-table-body layui-table-main">
            <c:forEach items="${pageInfo.list}" var="user">
                <tr>
                    <td><input type="checkbox" value="${user.id}" id="q" name="q" onclick="test1()"></td>
                    <td>${user.id}</td>
                    <td><img src="${BasePath}${user.img}" style="width: 60px;height: 60px;border-radius: 50%;cursor: pointer"></td>
                    <td>${user.login_name}</td>
                        <%--    <td>${user.password}</td>--%>
                    <td>${user.tel}</td>
                    <td>${user.email}</td>
                    <td>${user.user_name}</td>
                    <td>${user.status}</td>
                    <td>${user.create_time}</td>
<%--                    <td><fmt:formatDate value="${user.create_time}" pattern="yyyy-MM-dd"/></td>--%>
                    <td>${user.update_time}</td>
                    <td>${user.type}</td>
                    <td><input type="button" class="btn_modify" value="修改" onclick="modify(${user.id});">
                        <input type="button" class="btn_delete" value="删除" onclick="del(${user.id});">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
<%--</form>--%>

<div class="box-tools pull-right">
    <ul class="pagination">
        <li><a href="/user/userList.do" aria-label="Previous">首页</a></li>
        <li><a href="/user/userList.do?currentPage=${pageInfo.currentPage-1}">上一页</a></li>
        <%--            <c:forEach begin="1" end="${pageInfo.totalPage}" var="pageNum">--%>
        <li><a href="/user/userList.do?currentPage=${pageNum}">${pageInfo.currentPage}</a></li>
        <%--            </c:forEach>--%>
        <li><a href="/user/userList.do?currentPage=${pageInfo.currentPage+1}">下一页</a></li>
        <li><a href="/user/userList.do?currentPage=${pageInfo.totalPage}" aria-label="Next">尾页</a></li>
    </ul>
</div>

</body>
<script type="text/javascript">
    $("#exportActivityAllBtn").click(function () {

        window.location.href="exportAllActivitys.do" ;

    });
    // table.render({
    //     elem: '#user-table' //指定原始表格元素选择器（推荐id选择器）
    //     , height: 420 //容器高度
    //     , url: '/user/page'
    //     , page: true
    //     , limits: [10, 20, 30]
    //     , even: true
    //     , toolbar: 'default'
    //     , parseData: function (res) {
    //         return {
    //             "code": 0, //解析接口状态
    //             "msg": res.msg, //解析提示文本
    //             "count": res.total, //解析数据长度
    //             "data": res.list //解析数据列表
    //         };
    //     }, cols: [[
    //         {field: 'id', title: 'ID', width: 100, type: 'checkbox'}
    //         , {title: '用户id', width: 100, align: 'center', type: 'numbers'}
    //         , {field: 'img', title: '头像', align: 'center', width: 80,toolbar: '#avatarBar'}
    //         , {field: 'login_name', title: '用户名', align: 'center', width: 130}
    //
    //         , {field: 'tel', title: '联系电话', align: 'center', width: 150}
    //         ,{field:'email', title: '邮箱',align: 'center',width: 150}
    //         , {field: 'status', title: '状态', align: 'center', width: 100, toolbar: '#statusBar'}
    //         , {field: 'create_time', title: '创建时间', align: 'center', width: 160,sort: true}
    //         , {field: 'update_time', title: '更新时间', align: 'center', width: 160,sort: true}
    //         , {field: 'type', title: '用户类型', align: 'center', width: 100}
    //         , {title: '操作', align: 'center', width: 150, toolbar: '#operateBar'}
    //     ]]
    // });
    //全选
    var oall=document.getElementById("checkAll");
    var oid=document.getElementsByName("q");
    oall.onclick=function(){//勾选全选时
        for(var i=0;i<oid.length;i++){
            //所有的选择框和全选一致
            oid[i].checked=oall.checked;
        }
    };
    //点击复选框
    for(var i=0;i<oid.length;i++){
        oid[i].onclick=function(){
            //判断是否全部选中,遍历集合
            for(var j=0;j<oid.length;j++){
                if(oid[j].checked==false){
                    oall.checked=false;
                    break;
                }else{
                    oall.checked=true;
                }
            }
        };
    }

    function todel(){
        var r=confirm("是否确认删除？");
        if(r==true){
            //确认删除
            var ids="";
            var n=0;
            for(var i=0;i<oid.length;i++){
                if(oid[i].checked==true){//选中为true
                    var id=oid[i].value;
                    if(n==0){
                        ids+="ids="+id;
                    }else{
                        ids+="&ids="+id;
                    }
                    n++;
                }
            }
            //上面会拼接出一个名为ids的数组ids=1&ids=2&ids=3&ids=4……
            $.get("/user/isdeleteMany.do",ids,function(data){
                if(data=="ok"){
                    alert("删除成功!");
                    //删除成功后，调用action方法刷新页面信息
                    location.reload();
                    $("input[name=q]").removeAttr("checked");
                }else{
                    alert("请选中行!");
                }
            });
            return true;
        }else{
            //不删除
            return false;
        }
    }
</script>
</html>
