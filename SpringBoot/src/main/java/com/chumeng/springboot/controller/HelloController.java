package com.chumeng.springboot.controller;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chumeng
 * @date 2022/7/28 11:20
 */
//@PropertySource("classpath:test.properties")
//@RestController
//public class HelloController {
//    @Value("${name}")
//    private String name;
//
//    @Value("${password}")
//    private String password;
//
//    @GetMapping("hello")
//    public String hello(){
//        return "hello" + name + password;
//    }
//}

@RestController
@ConfigurationProperties(prefix = "user")
@Data
public class HelloController {
    private String username;

    private String password;

    @GetMapping({"hello","world"})
    public String hello(){
        return "hello" + username + password;
    }
}
