package service;

import entity.Exam;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/18 9:07
 */
@Service
public class MarkExam {
    public List<String> getAnswer(List<Exam> list) {
        List<String> l = new ArrayList<>();
        list.forEach(exam -> l.add(exam.getAnswer()));
        return l;
    }
}
