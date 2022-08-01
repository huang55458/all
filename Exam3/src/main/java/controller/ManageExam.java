package controller;

import dao.ExamHistoryTable;
import dao.ExamIndexTable;
import entity.Exam;
import entity.ExamHistory;
import entity.ExamHistoryJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/19 14:22
 */
@Controller
public class ManageExam {
    private ExamIndexTable examIndexTable;
    private ExamHistoryTable examHistoryTable;

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

    @GetMapping("manageExam.form")
    public String manageExam(Exam exam, ModelMap modelMap) {
        String tableName = examIndexTable.findExamTable(exam);
        if (tableName == null) {
            tableName = "exam_level_1_java";
        }
        List<Exam> allExams = examIndexTable.findAllExam(tableName);
        modelMap.addAttribute("allExams",allExams);
        modelMap.addAttribute("tableName",tableName);
        return "manageExamLayui.jsp";
    }

    @GetMapping("manageExamTest.form")
    @ResponseBody
    public ExamHistoryJson manageExamTest(Exam exam, HttpServletRequest request, @RequestParam(defaultValue = "1") int page,
                                        @RequestParam(defaultValue = "10")int limit) {
        String tableName = examIndexTable.findExamTable(exam);
        if (tableName == null) {
            tableName = "exam_level_1_java";
        }
        List<Exam> list = examIndexTable.findAllExam(tableName);

        if (list.size()  / limit >= page) {
            return new ExamHistoryJson(list.size(),list.subList((page - 1) * limit,limit * page));
        } else {
            return new ExamHistoryJson(list.size(),list.subList((page - 1) * limit,list.size()));
        }
//        return new ExamHistoryJson(list.size(),list.subList(0,10));
    }



    @PostMapping("saveExam.form")
//    ,@RequestParam(value = "tableName",required = false) String tableName
    public void saveExam(Exam exam) {
        String tableName = examIndexTable.findExamTable(exam);
        if (tableName == null) {
            tableName = "exam_level_1_java";
        }
//        HttpSession session  = request.getSession();
//        System.out.println(session.getAttribute("manageExamTableName"));
//        System.out.println(exam);
//        System.out.println(tableName);
        examIndexTable.updateExam(exam,tableName);
    }

    @PostMapping("deleteExam.form")
//    ,@RequestParam(value = "tableName",required = false) String tableName
    public void deleteExam(Exam exam) {
        String tableName = examIndexTable.findExamTable(exam);
        if (tableName == null) {
            tableName = "exam_level_1_java";
        }
//        System.out.println("id :" + id);
        int id = exam.getId();
        examIndexTable.deleteExam(id,tableName);
    }

    @GetMapping("allHistory.form")
//    HttpServletRequest request,@RequestParam("userid") int userid
    public String allHistory() {
//        ExamHistory examHistory = new ExamHistory();
//        examHistory.setUserid(userid);
//        List<ExamHistory> list =  examHistoryTable.findAll(examHistory);
//        request.setAttribute("list",list);
        return "allHistoryLayui.jsp";
    }

    @GetMapping("allHistoryTest.form")
    @ResponseBody
    public List<ExamHistory> allHistoryTest(){
        return examHistoryTable.findAll();
    }

    @GetMapping("deleteExamHistory.form")
    public void deleteExamHistory(ExamHistory examHistory) {
        examHistoryTable.delete(examHistory);
    }
}
