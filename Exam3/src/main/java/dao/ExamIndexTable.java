package dao;

import entity.Exam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/15 13:34
 */
public interface ExamIndexTable {
    /**
     *
     * @param exam
     * @return 返回题库表名
     */
    String findExamTable(Exam exam);

    /**
     *
     * @return 根据 id 返回一道题目
     */
    Exam findExamById(@Param("tableName") String tableName,@Param("id") int id);

    /**
     * 插入题目
     * @param exam
     */
    void insertExam(@Param("exam") Exam exam,@Param("tableName") String tableName);

    /**
     *
     * @return 返回所有题目
     */
    List<Exam> findAllExam(@Param("tableName") String tableName);

    /**
     * 传入一个 Exam 实体对象更新
     * @param exam
     * @param tableName
     */
    void updateExam(@Param("exam") Exam exam,@Param("tableName") String tableName);

    /**
     * 传入一个 id 删除
     * @param id
     * @param tableName
     */
    void deleteExam(@Param("id") int id,@Param("tableName") String tableName);

    /**
     *
     *
     * @param tableName 表名
     * @param length 题目个数
     * @return 随机长度的题目
     */
    List<Exam> findSomeExam(@Param("tableName") String tableName,@Param("length") int length);
}
