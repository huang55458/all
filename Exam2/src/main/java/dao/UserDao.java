package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {


    //登录名唯一
    User checkLoginName(@Param("login_name") String login_name);

    //新增用户
    void insertUser(User user);

    //通过ID查询单条数据
    User selectUserById(int id);

    //修改用户
    void updateUserById(User user);

    //删除用户
    void deleteUserById(int id);

    //查询所有用户
    List<User> findUserAll();

    User findByLoginNameAndPassword(User user);


}
