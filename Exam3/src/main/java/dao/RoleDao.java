package dao;

import entity.Role;
import entity.User_Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    //查询所有角色
    public List<Role> findAllRole();
    //根据用户编号查询角色信息
    public List<User_Role> findRoleByUid(@Param("user_id") Integer user_id);
    //添加角色信息
    public int insertRole(User_Role role);
    //删除角色信息
    public int deleteRole(@Param("user_id") Integer user_id, @Param("roleIds")List<Integer> roleIds);
    //查询用户没有的角色信息
    public List<Integer> findWithoutRole(@Param("user_id")Integer uid, @Param("roleIds")List<Integer> roleIds);
}
