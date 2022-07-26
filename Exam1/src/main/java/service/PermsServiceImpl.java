package service;


import dao.PermsDao;
import entity.PageInfo;
import entity.Perms;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Perms)表服务实现类
 *
 * @author zhoupiyao
 * @since 2021-10-08 10:19:45
 */
@Service("permsService")
public class PermsServiceImpl implements PermsService {
    @Autowired
    private PermsDao permsDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Perms queryById(Integer id) {

        return this.permsDao.queryById(id);
    }

    /**
     * 新增数据
     *
     * @param perms 实例对象
     * @return 实例对象
     */
    @Override
    public int insert(Perms perms) {
        return permsDao.insert(perms);
    }

    /**
     * 修改数据
     *
     * @param perms 实例对象
     * @return 实例对象
     */
    @Override
    public int update(Perms perms) {
        return permsDao.update(perms);
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public int deleteById(Integer id) {
        return this.permsDao.deleteById(id);
    }

//    @Override
//    public PageInfo<User> findUserAll(int currentPage, String user_name) {
//        PageInfo<User> pageInfo = new PageInfo<>();
//        pageInfo.setSize(5);//每页长度 和 userMapper中一致  每一页显示5条
//        int totalCount = userDao.getTotalCount(user_name);  //查询总长度
//        pageInfo.setTotalCount(totalCount);
//
//        int totalPage = (int)(totalCount/pageInfo.getSize()) + 1;
//        pageInfo.setTotalPage(totalPage);
//
//        if(currentPage<1){
//            pageInfo.setCurrentPage(1);
//        }else if(currentPage>totalPage){
//            pageInfo.setCurrentPage(totalPage);
//        }else{
//            pageInfo.setCurrentPage(currentPage);
//        }
//
//        int start = (pageInfo.getCurrentPage()-1)*pageInfo.getSize(); //开始查询的数
//        List<User> userList = permsDao.queryAll(pageInfo);
//        pageInfo.setList(userList);
//        return pageInfo;
//    }

    @Override
    public int deleteBatch(int[] ids) {
        return permsDao.deleteBatch(ids);
    }
}
