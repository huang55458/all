package service;

import dao.UserDao;
import entity.PageInfo;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImp implements UserService{
    @Autowired
    private UserDao userDao;
    @Override
    public User findByUserName(String username) {

        return userDao.findByUserName(username);
    }

    @Override
    public User findByLoginName(String login_name) {

        return userDao.findByLoginName(login_name);
    }


    @Override
    public int deleteById(int id) {
        return userDao.deleteById(id);
    }
    @Override
    public int delete(String ids) {

        return userDao.delete(ids);
    }
    @Override
    public User login(User user) {
        User u = userDao.login(user);
        return u;
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User find(String login_name, String password) {
        User u = userDao.find(login_name, password);
        return u;
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findById(int id) {
        User user = userDao.findById(id);
        return user;
    }

    @Override
    public List<User> findSearchUser(User user) {
        return userDao.findSearchUser(user);
    }

    @Override
    public PageInfo<User> findUserAll(int currentPage, String user_name) {
        PageInfo<User> pageInfo = new PageInfo<>();
        pageInfo.setSize(5);//每页长度 和 userMapper中一致  每一页显示5条
        int totalCount = userDao.getTotalCount(user_name);  //查询总长度
        pageInfo.setTotalCount(totalCount);

        int totalPage = (int)(totalCount/pageInfo.getSize()) + 1;
        pageInfo.setTotalPage(totalPage);

        if(currentPage<1){
            pageInfo.setCurrentPage(1);
        }else if(currentPage>totalPage){
            pageInfo.setCurrentPage(totalPage);
        }else{
            pageInfo.setCurrentPage(currentPage);
        }

        int start = (pageInfo.getCurrentPage()-1)*pageInfo.getSize(); //开始查询的数
        List<User> userList = userDao.findUserAll(start,user_name);
        pageInfo.setList(userList);
        return pageInfo;
    }

    @Override
    public int getTotalCount(String user_name) {
        return userDao.getTotalCount(user_name);
    }


    @Override
    public void add(User user) {

    }

    @Override
    public int edit(User user) {
        return userDao.edit(user);
    }

    @Override
    public void deleteMany(Integer[] ids) {
        // TODO 自动生成的方法存根
         userDao.deleteMany(ids);
    }
    @Override
    public boolean checkLoginName(String login_name) {
        if (userDao.checkLoginName(login_name) != null) return true;
        return false;
    }


//    @Override
//    public List<User> queryAllActivitys() {
//        return userDao.selectAllActivitys();
//    }




}
