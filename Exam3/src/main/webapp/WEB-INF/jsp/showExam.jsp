<%@ page import="entity.Exam" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chumeng
  Date: 2022/7/16
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>

    body {
        margin:0;
        padding:0;
        font-family: 楷体,sans-serif;
        background: linear-gradient(#141e30, #243b55);
        color: #fff;
    }


   table{
       width:60%;
       margin-top:200px;
       margin-left: 20%;
       font-size : 22px;
   }
   tr{
       line-height: 50px;
   }
   #serial{
       position: fixed;
       top: 30%;
       right: 5%;
   }
   #timeout{
       position: fixed;
       top: 20%;
       right: 8%;
   }
   .checked{
       border-radius: 5px;
       border: 0;
       margin: 3px;
       width: 36px;
       height: 26px;
   }
   .checked:hover {
       background: #03e9f4;
       color: #fff;
       border-radius: 5px;
       box-shadow: 0 0 5px #03e9f4,
       0 0 25px #03e9f4,
       0 0 50px #03e9f4,
       0 0 100px #03e9f4;
       cursor: pointer;
   }
</style>
<body>
<%
    int i = Integer.parseInt(request.getParameter("exam_num"));
    List<Exam> list = (List<Exam>) session.getAttribute("exams");
    Exam exam = list.get(i);
    pageContext.setAttribute("serial",i);
    pageContext.setAttribute("exam", exam);

    // 考题标识: 0 为单选，1为多选，2 为出错
    int examsAnswerFlag = 0;
    List<String> examsAnswers = (List<String>) session.getAttribute("examsAnswer");
    String examsAnswer = examsAnswers.get(i);
    if (examsAnswer != null) {
        if (examsAnswer.length() > 2) {
            examsAnswerFlag = 1;
        }
    } else {
        examsAnswerFlag = 3;
    }
    pageContext.setAttribute("examsAnswerFlag",examsAnswerFlag);
%>

    <form action="test.form" id="exam_answer">
        <table>
            <tr>
                <td>
                  ${pageScope.serial + 1}.<span style="font-size: 18px">(

                      <c:if test="${pageScope.examsAnswerFlag == 0}">
                          单选题
                      </c:if>
                      <c:if test="${pageScope.examsAnswerFlag == 1}">
                          多选题
                      </c:if>
                      <c:if test="${pageScope.examsAnswerFlag == 3}">
                          出错
                      </c:if>

                      )</span>  &nbsp;&nbsp; ${pageScope.exam.question}
                </td>
            </tr>
            <tr>
                <td>
                    <label class="specialEffects">
                        <input type="checkbox" name="answer" value="a"/>A. &nbsp;&nbsp;${pageScope.exam.a}
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <input type="checkbox" name="answer" value="b"/>B. &nbsp;&nbsp; ${pageScope.exam.b}
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <input type="checkbox" name="answer" value="c"/>C. &nbsp;&nbsp; ${pageScope.exam.c}
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <input type="checkbox" name="answer" value="d"/>D. &nbsp;&nbsp; ${pageScope.exam.d}
                    </label>
                    <input type="hidden" name="id" value="${param.exam_num}">
                </td>
            </tr>
            <tr>
                <td>
                    <input style="width:60px" class="checked" type="button" value="上一题" onclick="pre_exam()">
                    <input style="width:60px" class="checked" type="button" value="下一题" onclick="next_exam()">
                    <input id="exam_num" type="hidden" value="<%=Integer.parseInt(request.getParameter("exam_num"))%>">
                    <input style="width:60px" class="checked" type="button" onclick="markExam()" value="交卷">
                </td>
            </tr>
        </table>
    </form>

<%--    题目序号--%>
    <div id="serial">
        <input class="checked" type="button" id="a0" value="0" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a1" value="1" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a2" value="2" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a3" value="3" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a4" value="4" onclick="skipExam(this)"/><br/>
        <input class="checked" type="button" id="a5" value="5" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a6" value="6" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a7" value="7" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a8" value="8" onclick="skipExam(this)"/>
        <input class="checked" type="button" id="a9" value="9" onclick="skipExam(this)"/>
    </div>

<%--    计时器--%>
    <div id="timeout">
        <span id="intervalTask" >
                <c:if test="${empty sessionScope.counter}" var="test" scope="page">
                    10:00
                </c:if>
                <c:if test="${!empty sessionScope.counter}">
                    ${sessionScope.counter}
                </c:if>
        </span>
    </div>
<script>

    function skipExam(i) {

        const answerArr = document.getElementsByName("answer");
        let str = "";

        for (let i = 0; i < answerArr.length; i++) {
            if (answerArr[i].checked === true) {
                if (str.length > 0) {
                    str = str + "," + answerArr[i].value
                } else {
                    str = str + answerArr[i].value
                }
            }
        }
        test(str);
        window.location.href = "examNum.form?exam_num="+i.value  + "&time=" + date.toLocaleString().substring(13);
    }

    // 用于获取当前答案
    <%
       int m = Integer.parseInt(request.getParameter("exam_num"));
       List<String> l = (List<String>) session.getAttribute("userAnswer");
       String result = l.get(m);
       for (int zz = 0; zz < l.size(); zz++) {
           System.out.println(zz + " --> " + l.get(zz));
       }
       pageContext.setAttribute("currentExamResult",result);
    %>

    let counter;
    let count = 0;
    <c:if test="${empty sessionScope.counter}" var="test" scope="page">
        let date = new Date("2000/1/1 12:10:00");
    </c:if>
    <c:if test="${!empty sessionScope.counter}">
        let date = new Date("2000/1/1 12:${sessionScope.counter}");
    </c:if>

    // 用来将切换至选过的题时自动选上
    (function () {
        let str = "${pageScope.currentExamResult}";
        let resultArr = str.split(",");
        if (resultArr.length !== 0) {
            let answerArr = document.getElementsByName("answer");
            for (let i = 0; i < resultArr.length; i++) {
                for (let j = 0; j < answerArr.length; j++) {
                    if (resultArr[i] === answerArr[j].value) {
                        answerArr[j].checked = true;
                    }
                }
            }
        }

        // 标识当前题目
        let param = "a${param.exam_num}";
        let obj = document.getElementById(param);
        obj.style.backgroundColor = "pink";

        // 计时器
        counter = setInterval(counterHandler, 1000);
    })()

    // 定时器执行，10 分钟倒计时提交试卷
    function counterHandler() {
        count++;
        date.setSeconds(date.getSeconds() - 1);
        let strDate = date.toLocaleString();
        document.getElementById("intervalTask").innerHTML = strDate.substring(13);
        console.log(strDate.substring(13));
        if (strDate.substring(13) === "0:00") {
            markExam();
        }
    }

    function pre_exam() {
        let exam_num = document.getElementById("exam_num").value;
        if(exam_num == 0){
            exam_num = 0;
        }else{
            exam_num--;
        }

        saveAnswer();
        //
        // const answerArr = document.getElementsByName("answer");
        // let str = "";
        //
        // if (answerArr[0].checked === true) {
        //     str = str + "a"
        // }
        //
        // if (answerArr[1].checked === true) {
        //     if (str.length > 0) {
        //         str = str + ",b"
        //     } else {
        //         str = str + "b"
        //     }
        // }
        // if (answerArr[2].checked === true) {
        //     if (str.length > 0) {
        //         str = str + ",c"
        //     } else {
        //         str = str + "c"
        //     }
        // }
        // if (answerArr[3].checked === true) {
        //     if (str.length > 0) {
        //         str = str + ",d"
        //     } else {
        //         str = str + "d"
        //     }
        // }
        //
        //
        //
        // test(str);
        window.location.href = "examNum.form?exam_num="+exam_num + "&time=" + date.toLocaleString().substring(13);
    }
    function next_exam() {
        let exam_num = document.getElementById("exam_num").value;
        if(exam_num == 9){
            exam_num = 9;
        }else{
            exam_num++;
        }

        saveAnswer();
        <%--const answerArr = document.getElementsByName("answer");--%>
        <%--let str = "";--%>

        <%--for (let i = 0; i < answerArr.length; i++) {--%>
        <%--    if (answerArr[i].checked === true) {--%>
        <%--        if (str.length > 0) {--%>
        <%--            str = str + "," + answerArr[i].value--%>
        <%--        } else {--%>
        <%--            str = str + answerArr[i].value--%>
        <%--        }--%>
        <%--    }--%>
        <%--}--%>

        <%--&lt;%&ndash;var exam_answer = document.getElementById("exam_answer");&ndash;%&gt;--%>
        <%--&lt;%&ndash;exam_answer.action = "saveAnswer.form?id=${param.exam_num}&"&ndash;%&gt;--%>
        <%--&lt;%&ndash;exam_answer.submit();&ndash;%&gt;--%>

        <%--test(str);--%>
        window.location.href = "examNum.form?exam_num="+exam_num + "&time=" + date.toLocaleString().substring(13);
    }
    function saveAnswer() {
        const answerArr = document.getElementsByName("answer");
        let str = "";

        for (let i = 0; i < answerArr.length; i++) {
            if (answerArr[i].checked === true) {
                if (str.length > 0) {
                    str = str + "," + answerArr[i].value
                } else {
                    str = str + answerArr[i].value
                }
            }
        }
        test(str);
    }
    function test(str) {

        var xhr = new XMLHttpRequest();
        xhr.open('GET', "saveAnswer.form?id=${param.exam_num}&answer=" + str, true);
        xhr.send();

        <%--let exam_answer = document.getElementById("exam_answer");--%>
        <%--&lt;%&ndash;exam_answer.action = "saveAnswer.form?id=${param.exam_num}&answer=" + str&ndash;%&gt;--%>
        <%--exam_answer.action = "saveAnswer.form?id=0&answer=a"--%>
        <%--alert(exam_answer.action)--%>
        <%--// exam_num.action = "test.form"--%>
        <%--exam_answer.submit();--%>
    }
    function markExam() {
        saveAnswer();
        clearInterval(counter);
        window.location.href = "markExam.form";
    }
</script>

</body>
</html>
