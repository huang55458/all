package dao;

import entity.Permission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionDao {

    public List<Permission> selectAll();

    public List<Permission> selectByRid(@Param("role_id")Integer role_id);

    public int insertPermission(@Param("role_id")Integer role_id,@Param("per_id")Integer per_id);

    public List<Integer> findWithoutPermission(@Param("role_id")Integer role_id,@Param("perIds")List<Integer> perIds);

    public int deletePermission(@Param("role_id")Integer role_id,@Param("perIds")List<Integer> perIds);
}
