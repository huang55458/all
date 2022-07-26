package service;

import entity.Role;
import entity.User_Role;

import java.util.List;

public interface RoleService {
    List<Role> findAllRole();
    List<User_Role> findRoleByUid(Integer user_id);
    boolean addRole(User_Role role);
    boolean deleteRole(Integer user_id,List<Integer> roleIds);
    List<Integer> findWithoutRole(Integer user_id,List<Integer> roleIds);
}
