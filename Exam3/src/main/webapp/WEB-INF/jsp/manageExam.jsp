<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/19
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>
    #table{
        width: 100%;
        border-collapse: collapse;
    }

    #table td{
        border: 1px solid black;
    }
</style>
<body>
<form action="">
    <table>
        <tr>
            <td>
                <label><input type="radio" name="level" value="1" checked>简单</label>
            </td>
            <td>
                <label><input type="radio" name="level" value="2">困难</label>
            </td>
        </tr>
        <tr>
            <td>
                <label><input type="radio" name="type" value="java" checked>java</label>
            </td>
            <td>
                <label><input type="radio" name="type" value="html">html</label>
            </td>
            <td>
                <label><input type="radio" name="type" value="servlet">servlet</label>
            </td>
            <td><input type="submit" value="搜索"></td>
        </tr>
    </table>
</form>
<table id="table">
    <tr style="height:3em; font-size:18px">
        <td>id</td>
        <td>题目</td>
        <td>A</td>
        <td>B</td>
        <td>C</td>
        <td>D</td>
        <td>答案</td>
        <td>
            <input type="button" style="border:0" value="      操作      ">
        </td>
    </tr>
        <c:forEach var="exam" items="${allExams}">
            <tr>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.id}"></td>
                <td  style="width: 400px"><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.question}"></td>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.a}"></td>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.b}"></td>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.c}"></td>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.d}"></td>
                <td><input style="border: 0;width: 100%;height: 100%;"  class="${exam.id}" type="button" value="${exam.answer}"></td>
                <td>
                    <a href="#" id="modify${exam.id}" onclick="modify(${exam.id})">修改</a>
                    <a href="#" id="submit${exam.id}" style="display: none" onclick="submit(${exam.id})">提交</a>
                    <a href="#" id="deleteExam${exam.id}" onclick="deleteExam(${exam.id})">删除</a>
                </td>
            </tr>
        </c:forEach>
</table>
<script>
    function modify(i) {
        let arr = document.getElementsByClassName(i);
        for (let i = 0; i < arr.length; i++) {
            arr[i].type = "text";
        }
        document.getElementById("modify"+i).style.display = "none";
        document.getElementById("submit"+i).style.display = "inline";
    }
    function submit(i) {
        let arr = document.getElementsByClassName(i);
        for (let i = 0; i < arr.length; i++) {
            arr[i].type = "button";
        }
        $.ajax({
            type: 'POST',
            url: 'saveExam.form',
            data: {
                id: arr[0].value,
                question: arr[1].value,
                a: arr[2].value,
                b: arr[3].value,
                c: arr[4].value,
                d: arr[5].value,
                answer: arr[6].value,
                tableName: "${requestScope.tableName}"
            },
            dataType: 'json',
            success: function (){
                console.log("success");
            }
        });
        document.getElementById("modify"+i).style.display = "inline";
        document.getElementById("submit"+i).style.display = "none";
    }
    function deleteExam(i) {
        $.ajax({
            type: 'POST',
            url: 'deleteExam.form',
            data: {
                id: i,
                tableName: "${requestScope.tableName}"
            },
            dataType: 'json',
            success: function (){
                console.log("success");
            }
        });
        location.reload();
    }
</script>
</body>
</html>
