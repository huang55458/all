package dao;

import entity.ExamHistory;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/19 9:47
 */
public interface ExamHistoryTable {
    void insert(ExamHistory examHistory);
    List<ExamHistory> findAll();
    void delete(ExamHistory examHistory);
}
