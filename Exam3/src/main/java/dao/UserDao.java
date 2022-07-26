package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    public User findByUserName(String user_name);
    public int deleteById(int id);
    public int delete(String ids);
    public User login(User user);
    public User find(@Param("login_name")String login_name,@Param("password")String password);
    public void update(User user);
    public List<User> findAll();
    public User findById(int id);
    public void add(User user);
    public int edit(User user);
   //模糊查询
    public List<User> findSearchUser(User user);

    public User findByLoginName(String login_name);

//    分页
//获取用户list 用@Param 对mapper文件 进行多个参数的传递
    List<User> findUserAll(@Param("start")int start,@Param("user_name")String user_name);
    int getTotalCount(@Param("user_name") String user_name);

    //批量删除

    public Integer deleteMany(Integer[] ids);

    //登录名唯一
    User checkLoginName(String login_name);
//    int deleteBatchUser(@Param("ids") long...ids);
//    int deleteBatchRole(@Param("ids") long...ids);

//    List<User> selectAllActivitys();

}
