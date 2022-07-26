<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/15
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<head>
    <title>Title</title>
</head>
<style>
    #insert{
        margin: 100px auto;
        font-size: 18px;
    }
    #insert tr{
        height: 40px;
    }
    #insert tr .text{
        width: 400px;
        height: 40px;
    }
    #insert tr .rowspan{
        /*row-span: 4;*/
        grid-column: 1 / 5;
    }
    #insert tr .button{
        width: 80px;
        height: 30px;
        font-size: 16px;
    }
    #insert tr #button{
        margin-left: 40px;
    }
    #insert .radio{
        font-size:15px;
    }
    #tip{
        display: none;
        position: absolute;
        top: 30px;
        left: 50%;
        width: 100px;
        height: 36px;
        background-color: #69c5f7;
        text-align: center;
        line-height: 36px;
        border-radius: 4px;
    }
    /*table{*/
    /*    border-collapse: collapse;*/
    /*}*/
    /*td{*/
    /*    border: 1px solid black;*/
    /*}*/
</style>
<body>

<div id="tip">
    <span>提交成功</span>
</div>

<form action="insertExam.form" method="post">
    <table id="insert">
        <tr>
            <td><span>题目内容</span></td>
            <td colspan="4" class="rowspan"><input class="text" name="question" placeholder="请输入内容"></td>
        </tr>
        <tr>
            <td><span>A</span></td>
            <td colspan="4" class="rowspan"><input class="text" name="a" placeholder="请输入选项A"/></td>
        </tr>
        <tr>
            <td><span>B</span></td>
            <td colspan="4" class="rowspan"><input class="text" name="b" placeholder="请输入选项B"/></td>
        </tr>
        <tr>
            <td><span>C</span></td>
            <td colspan="4" class="rowspan"><input class="text" name="c" placeholder="请输入选项C"/></td>
        </tr>
        <tr>
            <td><span>D</span></td>
            <td colspan="4" class="rowspan"><input class="text" name="d" placeholder="请输入选项D"/></td>
        </tr>
        <tr class="radio">
            <td>
                <label><input type="radio" name="level" value="1" checked>简单</label>
            </td>
            <td>
                <label><input type="radio" name="level" value="2">困难</label>
            </td>
        </tr>
        <tr class="radio">
            <td>
                <label><input type="radio" name="type" value="java" checked>java</label>
            </td>
            <td>
                <label><input type="radio" name="type" value="html">html</label>
            </td>
            <td>
                <label><input type="radio" name="type" value="servlet">servlet</label>
            </td>
        </tr>
        <tr class="radio">
            <td>
                <label><input type="checkbox" name="answer" value="a" checked>A</label>
            </td>
            <td>
                <label><input type="checkbox" name="answer" value="b">B</label>
            </td>
            <td>
                <label><input type="checkbox" name="answer" value="c">C</label>
            </td>
            <td>
                <label><input type="checkbox" name="answer" value="d">D</label>
            </td>
        </tr>
        <tr>
            <td><input class="button" type="submit" value="提交"></td>
            <td><input id="button" class="button" type="reset" value="重置"></td>
        </tr>
    </table>
</form>
</body>
<script>
    <%
    %>
    <c:if test="${param.status == 1}">
    (function () {
        // document.getElementById("tip").style.display = "block";
        // setTimeout(function (){
        //     document.getElementById("tip").style.display = "none";
        // },2000);
        $("#tip").fadeIn();
        setTimeout(function (){$('#tip').fadeOut()},2000);
    })()
    </c:if>
</script>
</html>
