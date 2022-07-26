package service;


import entity.Perms;

/**
 * (Perms)表服务接口
 *
 * @author zhoupiyao
 * @since 2021-10-08 10:19:45
 */
public interface PermsService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Perms queryById(Integer id);



    /**
     * 新增数据
     *
     * @param perms 实例对象
     * @return 实例对象
     */
    int insert(Perms perms);

    /**
     * 修改数据
     *
     * @param perms 实例对象
     * @return 实例对象
     */
    int update(Perms perms);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    int deleteById(Integer id);

//    PageInfo<Perms> page(Perms perms, int pageNum, int pageSize);


    int deleteBatch(int[] ids);
}
