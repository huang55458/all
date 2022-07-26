package entity;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/25 13:56
 */
public class ExamHistoryJson {
    private int count;
    private List<Exam> list;

    public ExamHistoryJson(int count, List<Exam> list) {
        this.count = count;
        this.list = list;
    }

    public ExamHistoryJson() {
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Exam> getList() {
        return list;
    }

    public void setList(List<Exam> list) {
        this.list = list;
    }
}
