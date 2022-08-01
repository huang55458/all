<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/20
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp" %>
                <table class="layui-hide" id="test" lay-filter="test"></table>
<%@include file="footer.jsp" %>
<script type="text/html" id="tool">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="delete">删除 </a>
</script>
<script>
    //JavaScript代码区域
    layui.use(['element','table'], function(){
        var element = layui.element;

        layui.table.render({
            elem: '#test'
            ,height: 'full - 400'
            ,url: 'allHistoryTest.form' //数据接口
            // ,page: true //开启分页
            // ,maxLength : 370
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'userid', title: '用户ID', width:80}
                ,{field: 'username', title: '用户名', width:120}
                ,{field: 'time', title: '日期', width:200}
                // ,{field: 'sex', title: '性别', width:80, sort: true}
                ,{field: 'score', title: '分数', sort: true, width:80}
                ,{fixed: 'right', title: '操作', align:'center', toolbar: '#tool', width: 100}
            ]]
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res//解析数据列表
                };
            }
        });

        layui.table.on('tool(test)',function (obj) {
            if(obj.event === 'delete'){
                // location.reload();
                layer.confirm('真的删除行么', function(index){
                    obj.del();

                    //
                    layui.$.ajax({
                        type: 'GET',
                        url: 'deleteExamHistory.form',
                        data: {
                            id: obj.data.id
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

    });
</script>
