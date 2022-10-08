package controller;

import com.github.pagehelper.PageHelper;
import dao.ExamIndexTable;
import entity.Exam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/10/8 18:18
 */
@Controller
public class PageHelperTest {
    private ExamIndexTable examIndexTable;

    @Autowired
    public void setExamIndexTable(ExamIndexTable examIndexTable) {
        this.examIndexTable = examIndexTable;
    }

    @GetMapping("page")
    @ResponseBody
    public List<Exam> test(){
        PageHelper.startPage(1,6);
        return examIndexTable.findAllExam("exam_level_1_java");
    }
}
