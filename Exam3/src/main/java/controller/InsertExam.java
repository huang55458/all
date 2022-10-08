package controller;

import dao.ExamHistoryTable;
import dao.ExamIndexTable;
import entity.Exam;
import entity.ExamHistory;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.MarkExam;
import utils.Property;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @author chumeng
 * @date 2022/7/15 13:17
 */
@Controller
public class InsertExam {
    private ExamHistoryTable examHistoryTable;
    private ExamIndexTable examIndexTable;

    @Autowired
    public void setRedisTemplate(RedisTemplate<String, Exam> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    private RedisTemplate<String,Exam> redisTemplate;

    public ExamHistoryTable getExamHistoryTable() {
        return examHistoryTable;
    }

    @Autowired
    public void setExamHistoryTable(ExamHistoryTable examHistoryTable) {
        this.examHistoryTable = examHistoryTable;
    }

    public ExamIndexTable getExamIndexTable() {
        return examIndexTable;
    }

    @Autowired
    public void setExamIndexTable(ExamIndexTable examIndexTable) {
        this.examIndexTable = examIndexTable;
    }

    @PostMapping("/insertExam.form")
    public String insertExam(Exam exam){
        System.out.println(exam);
        // 去掉了 @requestParam("answer") String[] answer 来接收数组，会自动转换
//        String answerString = Arrays.toString(answer);
//        exam.setAnswer(answerString);
//        System.out.println(exam);

        String tableName = examIndexTable.findExamTable(exam);

        System.out.println(tableName);

        examIndexTable.insertExam(exam,tableName);
        return "redirect:insert.form?status=1";
    }

    @GetMapping("insert.form")
    public String insert() {
        return "insertLayui.jsp";
    }

    @GetMapping("startExam.form")
    public String startExam(){
        return "startExam.jsp";
    }

    @PostMapping("start.form")
    public String startExam(String level, String type, HttpServletRequest request) {
        Exam exam = new Exam();
        exam.setLevel(level);
        exam.setType(type);
        String tableName = examIndexTable.findExamTable(exam);

        //redis 缓存试题
        ListOperations<String,Exam> listOps = redisTemplate.opsForList();
        List<Exam> list = null;
        if (listOps.size(tableName) == 0) {
            // 从数据库查询出的考试题目
            list = examIndexTable.findSomeExam(tableName, Property.examLength);
            listOps.rightPushAll("exams",list);
        } else {
            list = listOps.range("exams",0,-1);
        }
        redisTemplate.expire(tableName,60, TimeUnit.SECONDS);

        // 将考题放入 session 中
        HttpSession session = request.getSession();
        session.setAttribute("exams",list);

        // 获取正确答案
        List<String> examsAnswer = markExam.getAnswer(list);
        session.setAttribute("examsAnswer",examsAnswer);

        // 用于存放 用户提交的答案
        List<String> userAnswer = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            userAnswer.add(i,"");
        }
        session.setAttribute("userAnswer",userAnswer);

        list.forEach(System.out::println);
        return "showExam.jsp?exam_num=0";
    }

    /**
     *  用来进行页面转发
     * @param request
     * @return
     */
    @GetMapping("examNum.form")
    public String examNum(HttpServletRequest request){
        int i = Integer.parseInt(request.getParameter("exam_num"));
        // 将计数时间保存至 session
        String time = request.getParameter("time");
        HttpSession session = request.getSession();
        session.setAttribute("counter",time);
        return "showExam.jsp?exam_num=" + i;
    }

    private MarkExam markExam;

    public MarkExam getMarkExam() {
        return markExam;
    }

    @Autowired
    public void setMarkExam(MarkExam markExam) {
        this.markExam = markExam;
    }

    /**
     *
        批阅试卷，得到分数
      */
    @GetMapping("markExam.form")
    public String markExam( HttpServletRequest request) {
        // 获取 session 中的考题
        HttpSession session = request.getSession();
        List<Exam> exams = (List<Exam>) session.getAttribute("exams");
        // 获取正确答案
        List<String> examsAnswer = markExam.getAnswer(exams);
        // 获取用户答案
        List<String> userAnswer = (List<String>) session.getAttribute("userAnswer");
        // 得分
        int score = 0;
        for (int i = 0; i < examsAnswer.size(); i++) {
            if (Objects.equals(examsAnswer.get(i), userAnswer.get(i))) {
                score += 10;
            }
        }
        request.setAttribute("score",score);

        // 将结果保存到数据库，先获取session、cookie中的用户信息
        User user = (User) session.getAttribute("user");
        ExamHistory examHistory = new ExamHistory();
        examHistory.setTime(new Date());
        examHistory.setScore(score);
        examHistory.setUserid(user.getId());
        examHistory.setUsername(user.getLogin_name());
        examHistoryTable.insert(examHistory);

        return "score.jsp";
    }

    /**
     * 保存提交上来的每道题的答案
     */
    @GetMapping("saveAnswer.form")
    public void saveAnswer(HttpServletRequest request,@RequestParam("id") int id,@RequestParam(value = "answer",required = false) String answer) {
        if (answer == null) {
            answer = "";
        }
        // 获取用户答案列表
        HttpSession session = request.getSession();
        List<String> userAnswer = (List<String>) session.getAttribute("userAnswer");

//        System.out.println(id + "--" + answer);

        // 保存并提交
        userAnswer.set(id,answer);
        session.setAttribute("userAnswer",userAnswer);
    }

    @GetMapping("test.form")
    public String test(){
//        System.out.println("这是一个 test");
        return "test.jsp";
    }

    @GetMapping("test2.form")
    public String test2(){
        return "manageExam.jsp";
    }
}
