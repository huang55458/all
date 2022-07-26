package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
//    List<Dept> findAll();
//    Dept findOne(int deptno);
//    注册
    void insertUser(User user);
    void add(User user);
    User findById(int id);
    List<User> findByUserName(@Param("user_name") String user_name);
//    void deleteDept(int deptno);
//    void updateDept(Dept dept);
//    List<Dept> findSanguo(String[] strings);
}
