package test;

import dao.ExamIndexTable;
import entity.Exam;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author chumeng
 * @date 2022/7/18 9:20
 */
public class ExamAnswerTest {
    @org.junit.jupiter.api.Test
    public void test(){
        ApplicationContext appContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ExamIndexTable examIndexTable = appContext.getBean(ExamIndexTable.class);
        Exam exam = examIndexTable.findExamById("exam_level_1_java",36);
        System.out.println(exam.getAnswer());
        System.out.println(exam);
    }
}
