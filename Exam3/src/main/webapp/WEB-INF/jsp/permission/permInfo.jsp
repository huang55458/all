
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

        function modify(id) {
            window.location.href="/permission/toEditPage.do?id="+id;

        }

        function del(id) {
            window.location.href="/permission/delete.do?id="+id;

        }

        function editRole(id){
            window.location.href="/role/queryRole.do?uid="+id;

        }
    </script>
</head>
<body>



<%--<!-- 主要区域 --> <form action="/user/ser.do" method="post">--%>
<div id="main" class="layui-fluid">
    <!-- 操作区域 -->
    <div id="operate" class="layui-row layui-col-space15">
        <div id="operate_left" style="float: left;margin-top:2px;" class="layui-col-md12">
            <form action="${pageContext.request.contextPath}/permission/queryByUrl.do" method="post">
                <div class="layui-card">
                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input" name="url" placeholder="访问路径"/>
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <button class="layui-btn" id="btn_search">搜索</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

    <div id="data" class="layui-card-body ">
        <div class="layui-table-tool">
            <div class="layui-table-tool-temp">
                <div class="layui-inline" lay-event="add">
                    <a href="/permission/toAddPage.do"><i class="layui-icon layui-icon-add-1"></i></a>
                </div>
            </div>
            <div class="layui-table-tool-self">
                <div class="layui-inline" title="导出" lay-event="LAYTABLE_EXPORT">
                    <i class="layui-icon layui-icon-export"></i>
                    <ul class="layui-table-tool-panel" style="max-height: 370px;">
                        <li data-type="xls" id="exportActivityAllBtn">导出到 Excel 文件</li>
                    </ul>
                </div>
            </div>
        </div>
        <table id="datalist" class="layui-table" lay-filter="user-table">
            <tr id="d1">
                <th><input type="checkbox" value="全选"  id="checkAll"  onclick="test(q);">
                    <span>全选</span></th>
                <td>权限ID</td>
                <td>权限名称</td>
                <td>访问路径</td>
                <td>操作</td>
            </tr>
            <tbody class="layui-table-body layui-table-main">
            <c:forEach items="${pageInfo.list}" var="per">
                <tr>
                    <td><input type="checkbox" value="" id="q" name="q" onclick="test1()"></td>
                    <td>${per.id}</td>
                    <td>${per.name}</td>
                    <td>${per.url}</td>
                    <td>
                        <c:if test="${per.url!='#'}">
                            <input type="button" class="btn_modify" value="修改" onclick="modify(${per.id});">
                            <input type="button" class="btn_delete" value="删除" onclick="del(${per.id});">
                        </c:if>
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
</script>
</html>
