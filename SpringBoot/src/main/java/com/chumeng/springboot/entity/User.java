package com.chumeng.springboot.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author chumeng
 * @date 2022/7/28 18:24
 */
@Data
@AllArgsConstructor
public class User {
    private int id;
    private String username;
    private int age;
}
