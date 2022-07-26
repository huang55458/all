<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/20
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--      <meta name="renderer" content="webkit">--%>
<%--      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--      <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <link rel="stylesheet" href="./layui/css/layui.css">--%>
<%--</head>--%>
<style>
    #table{
        width: 100%;
        border-collapse: collapse;
    }

    #table td{
        border: 1px solid black;
    }
</style>
<%--<body class="layui-layout-body">--%>
<%--<div class="layui-layout layui-layout-admin">--%>
<%--    <div class="layui-header">--%>
<%--        <div class="layui-logo">后台管理面板</div>--%>
        <!-- 头部区域（可配合layui已有的水平导航）------------------------------------ -->

<%--        <ul class="layui-nav layui-layout-left">--%>
<%--            <li class="layui-nav-item"><a href="">控制台</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">商品管理</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">用户</a></li>--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">其它系统</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">邮件管理</a></dd>--%>
<%--                    <dd><a href="">消息管理</a></dd>--%>
<%--                    <dd><a href="">授权管理</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <ul class="layui-nav layui-layout-right">--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">--%>
<%--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
<%--                    贤心--%>
<%--                </a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">基本资料</a></dd>--%>
<%--                    <dd><a href="">安全设置</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item"><a href="">退出</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--    <div class="layui-side layui-bg-black">--%>
<%--        <div class="layui-side-scroll">--%>
<%--            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--            <ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--                <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    <a class="" href="javascript:;">题库管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="manageExam.form">题库列表</a></dd>--%>
<%--                        <dd><a href="insert.form">添加题目</a></dd>--%>
<%--                        <dd><a href="allHistory.form">考试记录</a></dd>--%>
<%--&lt;%&ndash;                        <dd><a href="">超链接</a></dd>&ndash;%&gt;--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">解决方案</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                        <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                        <dd><a href="">超链接</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item"><a href="">云市场</a></li>--%>
<%--                <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-body">--%>

        <%@include file="head.jsp" %>
        <!-- 内容主体区域 -->
<%--        <div style="padding: 15px;">--%>
<%--            <form action="">--%>
<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            <label><input type="radio" name="level" value="1" checked>简单</label>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <label><input type="radio" name="level" value="2">困难</label>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            <label><input type="radio" name="type" value="java" checked>java</label>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <label><input type="radio" name="type" value="html">html</label>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <label><input type="radio" name="type" value="servlet">servlet</label>--%>
<%--                        </td>--%>
<%--                        <td><input type="submit" value="搜索"></td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--            </form>--%>
                <form class="layui-form" action="" lay-filter="form1">
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
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" id="submit_btn" class="layui-btn" lay-submit="" lay-filter="submit1">开始搜索</button>
                        </div>
                    </div>
                </form>


            <table id="table" class="layui-table" lay-filter="test">
<%--                <tr style="height:3em; font-size:18px">--%>
<%--                    <td>id</td>--%>
<%--                    <td>题目</td>--%>
<%--                    <td>A</td>--%>
<%--                    <td>B</td>--%>
<%--                    <td>C</td>--%>
<%--                    <td>D</td>--%>
<%--                    <td>答案</td>--%>
<%--                    <td>--%>
<%--                        <input type="button" style="border:0" value="      操作      ">--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <c:forEach var="exam" items="${allExams}">--%>
<%--                    <tr>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.id}"></td>--%>
<%--                        <td  style="width: 400px"><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.question}"></td>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.a}"></td>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.b}"></td>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.c}"></td>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.d}"></td>--%>
<%--                        <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.answer}"></td>--%>
<%--                        <td>--%>
<%--                            <a href="#" id="modify${exam.id}" onclick="modify(${exam.id})">修改</a>--%>
<%--                            <a href="#" id="submit${exam.id}" style="display: none" onclick="submit(${exam.id})">提交</a>--%>
<%--                            <a href="#" id="deleteExam${exam.id}" onclick="deleteExam(${exam.id})">删除</a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
            </table>
<%@include file="footer.jsp" %>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        test.--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script src="./layui/layui.js"></script>--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="deletemsg">删除 </a>
</script>
<script>
    //JavaScript代码区域
    layui.use(['element','table'], function(){
        var element = layui.element;
        let $ = layui.$;
        layui.table.render({
            elem: '#table'
            // ,height: 420
            ,url: 'manageExamTest.form' //数据接口（此处为静态数据，仅作演示）
            // ,title: '题库'//
            ,page: true //开启分页
            // ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            //     layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
            //     //,curr: 5 //设定初始在第 5 页
            //     ,groups: 1 //只显示 1 个连续页码
            //     ,first: false //不显示首页
            //     ,last: false //不显示尾页
            //
            // }
            // ,limit: 10
            // ,height: 'full-300' // 最大高度减去其他容器已占有的高度差
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
               , editTrigger: 'dblclick'
            ,cols: [[ //表头
                // {type: 'checkbox', fixed: 'left'}
                {field: 'id', title: 'ID', sort: true, width: 60}
                ,{field: 'question', title: '题目', edit: 'text'}
                ,{field: 'a', title: 'A', edit: 'text'}
                ,{field: 'b', title: 'B', edit: 'text'}
                ,{field: 'c', title: 'C', edit: 'text'}
                ,{field: 'd', title: 'D', edit: 'text'}
                ,{field: 'answer', title: '答案', edit: 'text', width: 80}
                ,{field: 'level', title: 'level', width: 60}
                ,{field: 'type', title: 'type', width: 70}
                ,{fixed: 'right', title: '操作', align:'center', toolbar: '#barDemo', width: 100}
            ]]
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                // alert(res.data)
                return {
                    "code": 0, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.list//解析数据列表
                };
            }
        });
        // 单元格编辑后的事件
        layui.table.on('edit(test)', function(obj){
            const value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段

            $.ajax({
                type: 'POST',
                url: 'saveExam.form',
                data: {
                    id: obj.data.id,
                    question: obj.data.question,
                    a: obj.data.a,
                    b: obj.data.b,
                    c: obj.data.c,
                    d: obj.data.d,
                    answer: obj.data.answer,
                    level: obj.data.level,
                    type: obj.data.type
                    <%--tableName: "${sessionScope.manageExamTableName}"--%>
                },
                dataType: 'json',
                success: function (){
                    console.log("success");
                }
            });
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改值为：'+ layui.util.escape(value));
        });
    });
    layui.table.on('tool(test)',function (obj) {
            if(obj.event === 'deletemsg'){
                // location.reload();
              layer.confirm('真的删除行么', function(index){
                obj.del();

                    //
                      layui.$.ajax({
                          type: 'POST',
                          url: 'deleteExam.form',
                          data: {
                              id: obj.data.id,
                              level: obj.data.level,
                              type: obj.data.type
                              <%--tableName: "${sessionScope.manageExamTableName}"--%>
                          },
                          dataType: 'json',
                          success: function (){
                              console.log("success");
                          }
                      });

                layer.close(index);
              });
            }
    })

    // form 提交
    layui.use(['form','table'],function () {
        layui.form.on('submit(submit1)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回

            layui.table.reloadData('table',{
                url: 'manageExamTest.form?level=' + data.field.level + '&type=' +data.field.type
            });
            // layui.layer.msg('记得手动刷新一下页面');
            // location.reload();
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    });
</script>

<%--<script>--%>
<%--    function modify(i) {--%>
<%--        let arr = document.getElementsByClassName(i);--%>
<%--        for (let i = 0; i < arr.length; i++) {--%>
<%--            arr[i].type = "text";--%>
<%--        }--%>
<%--        document.getElementById("modify"+i).style.display = "none";--%>
<%--        document.getElementById("submit"+i).style.display = "inline";--%>
<%--    }--%>
<%--    function submit(i) {--%>
<%--        let arr = document.getElementsByClassName(i);--%>
<%--        for (let i = 0; i < arr.length; i++) {--%>
<%--            arr[i].type = "button";--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            type: 'POST',--%>
<%--            url: 'saveExam.form',--%>
<%--            data: {--%>
<%--                id: arr[0].value,--%>
<%--                question: arr[1].value,--%>
<%--                a: arr[2].value,--%>
<%--                b: arr[3].value,--%>
<%--                c: arr[4].value,--%>
<%--                d: arr[5].value,--%>
<%--                answer: arr[6].value,--%>
<%--                tableName: "${requestScope.tableName}"--%>
<%--            },--%>
<%--            dataType: 'json',--%>
<%--            success: function (){--%>
<%--                console.log("success");--%>
<%--            }--%>
<%--        });--%>
<%--        document.getElementById("modify"+i).style.display = "inline";--%>
<%--        document.getElementById("submit"+i).style.display = "none";--%>
<%--    }--%>
<%--    function deleteExam(i) {--%>
<%--        $.ajax({--%>
<%--            type: 'POST',--%>
<%--            url: 'deleteExam.form',--%>
<%--            data: {--%>
<%--                id: i,--%>
<%--                tableName: "${requestScope.tableName}"--%>
<%--            },--%>
<%--            dataType: 'json',--%>
<%--            success: function (){--%>
<%--                console.log("success");--%>
<%--            }--%>
<%--        });--%>
<%--        location.reload();--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
