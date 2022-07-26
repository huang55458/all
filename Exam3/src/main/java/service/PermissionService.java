package service;

import entity.Permission;

import java.util.List;

public interface PermissionService {
    public List<Permission> getAll();
    public List<Permission> selectByRid(int role_id);
    public boolean addPermission(int role_id,int per_id);
    public List<Integer> findWithoutPermission(int role_id,List<Integer> perIds);
    public boolean deletePermission(int role_id,List<Integer> perIds);
}
