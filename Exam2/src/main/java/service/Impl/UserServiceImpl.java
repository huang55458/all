package service.Impl;

import dao.UserDao;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;

import java.util.List;

@Service("us")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public boolean checkLoginName(String login_name) {
        if (dao.checkLoginName(login_name) != null) return true;
        return false;
    }

    //增加用户
    @Override
    public void insertUser(User user) {
         dao.insertUser(user);
    }

    //通过ID查询单条数据
    @Override
    public User selectUserById(int id) {
        return dao.selectUserById(id);
    }

    //删除用户
    @Override
    public void deleteUserById(int id) {
         dao.deleteUserById(id);
    }

    //修改用户
    @Override
    public void updateUserById(User user) {
         dao.updateUserById(user);
    }

    @Override
    public List<User> findUserAll() {
        return dao.findUserAll();
    }

    @Override
    public User fingUserByLogin(User user) {
        return dao.findByLoginNameAndPassword(user);
    }
}
