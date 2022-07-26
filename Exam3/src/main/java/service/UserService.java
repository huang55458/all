package service;


import entity.PageInfo;
import entity.User;

import java.util.List;

public interface UserService {
    public User findByUserName(String user_name);
    public int deleteById(int id);
    public int delete(String ids);
    public User login(User user);
    public void update(User user);
    public User find(String login_name,String password);//登录，查询登录名和密码
    public List<User> findAll();
    //分页
    PageInfo<User> findUserAll(int currentPage, String user_name);//将findAll修改和搜索功能共用
    int getTotalCount(String user_name);

    public User findById(int id);
    //模糊查询
    public List<User> findSearchUser(User user);

    public User findByLoginName(String login_name);


    public void add(User user);
    public int edit(User user);//修改用户名，密码

    //批量删除
    public void deleteMany(Integer[] q);


    //登录名唯一
    boolean checkLoginName(String login_name);
//    void deleteBatch(long[] ids);

//    User login(String login_name, String password);

    // 导出
//    List<User> queryAllActivitys();
}
