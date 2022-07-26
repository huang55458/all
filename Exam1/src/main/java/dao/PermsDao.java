package dao;


import entity.Perms;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermsDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Perms queryById(Integer id);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param
     * @return 对象列表
     */
    List<Perms> queryAll(Perms perms);

    /**
     * 新增数据
     *
     * @param perms 实例对象
     * @return 影响行数
     */
    int insert(Perms perms);

    /**
     * 修改数据
     *
     * @param perms 实例对象
     * @return 影响行数
     */
    int update(Perms perms);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    int deleteBatch(@Param("ids") int[] ids);

    //分页查询
    List<Perms> findUserAll(@Param("start")int start, @Param("role_id")String role_id);
    int getTotalCount(@Param("role_id") String role_id);

}

