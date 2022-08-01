package com.chumeng.springboot.dao;

import com.chumeng.springboot.entity.Uses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/29 11:12
 */
@Repository
public interface UsesDao extends JpaRepository<Uses,Integer> {
    /**
     *
    通过自定义方法来进行查询
      */
    List<Uses> findByAge(Integer age);
}
