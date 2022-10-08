package com.chumeng.springboot.service;

import com.chumeng.springboot.dao.UsesDao;
import com.chumeng.springboot.entity.Uses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author chumeng
 * @date 2022/7/29 15:41
 */
@Service
public class UsesService {
    private UsesDao usesDao;

    public UsesDao getUsesDao() {
        return usesDao;
    }

    @Autowired
    public void setUsesDao(UsesDao usesDao) {
        this.usesDao = usesDao;
    }

    @Transactional()
    public void insertTwo(){
        usesDao.save(new Uses("a",32));
        usesDao.save(new Uses("b",33));
    }
}
