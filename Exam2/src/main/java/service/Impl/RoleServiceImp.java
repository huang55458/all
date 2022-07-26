package service.Impl;

import dao.RoleDao;
import entity.Role;
import entity.User_Role;
import service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImp implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<Role> findAllRole() {
        return roleDao.findAllRole();
    }

    @Override
    public List<User_Role> findRoleByUid(Integer user_id) {
        return roleDao.findRoleByUid(user_id);
    }

    @Override
    public boolean addRole(User_Role role) {
        int rows = roleDao.insertRole(role);
        return rows > 0 ? true : false;
    }

    @Override
    public boolean deleteRole(Integer user_id, List<Integer> roleIds) {
        return roleDao.deleteRole(user_id,roleIds) > 0 ? true : false;
    }

    @Override
    public List<Integer> findWithoutRole(Integer user_id, List<Integer> roleIds) {
        return roleDao.findWithoutRole(user_id,roleIds);
    }
}
