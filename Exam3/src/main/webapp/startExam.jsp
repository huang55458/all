<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/15
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table{
        font-size: 23px;
        margin-left: 20px;
    }
    td{
        height: 60px;
        width:200px;
    }
    #submit{
        width: 100px;
        height: 40px;
        font-size: 20px;
    }
    #border{
        margin: 200px auto;
        border: 1px solid #515151;
        border-radius: 4px;
        width: 400px;
    }
</style>
<body>
<form action="start.form" method="post">
    <fieldset id="border">
        <legend><span>开始你的考试</span></legend>
        <table>
            <tr>
                <td><span>选择难度</span></td>
                <td>
                    <label><input type="radio" name="level" value="1" checked>简单</label>
                    <label><input type="radio" name="level" value="2">困难</label>
                </td>
            </tr>
            <tr>
                <td><span>选择考试类型</span></td>
                <td>
                    <label><input type="radio" name="type" value="java" checked>java</label>
                    <label><input type="radio" name="type" value="html">html</label>
                    <label><input type="radio" name="type" value="servlet">servlet</label>
                </td>
            </tr>
            <tr>
                <td><input id="submit" type="submit" value="提交"></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
