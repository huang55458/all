package service;

import entity.User;

import java.util.List;
public interface UserService {
    //登录名唯一
    boolean checkLoginName(String login_name);

    //增加用户
    void insertUser(User user);

    //通过ID查询单条数据
    User selectUserById(int id);

    //删除用户
    void deleteUserById(int id);

    //修改用户
    void updateUserById(User user);

    //查询所有用户
    List<User> findUserAll();

    //根据登录名和密码查询用户
    User fingUserByLogin(User user);



    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    //boolean deleteById(Long id);

    /**
     * 通过登录账号查询用户
     *
     * @param user_name
     * @return
     */
    //User findSysUserByLoginName(String user_name);

    //List<User> selectUserList(User user);
}
