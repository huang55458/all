package service.Impl;

import dao.PermissionDao;
import service.PermissionService;
import entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImp implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Override
    public List<Permission> getAll() {
        return permissionDao.selectAll();
    }

    @Override
    public List<Permission> selectByRid(int role_id) {
        return permissionDao.selectByRid(role_id);
    }

    @Override
    public boolean addPermission(int role_id, int per_id) {
        return permissionDao.insertPermission(role_id,per_id)>0?true:false;
    }

    @Override
    public List<Integer> findWithoutPermission(int role_id, List<Integer> perIds) {
        return permissionDao.findWithoutPermission(role_id,perIds);
    }

    @Override
    public boolean deletePermission(int role_id, List<Integer> perIds) {
        return permissionDao.deletePermission(role_id,perIds)>0?true:false;
    }
}
