package test;

import dao.UserDao;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {
    @Test
    public void test1(){
        ApplicationContext ac= new ClassPathXmlApplicationContext("spring-mvc.xml");
        UserDao userDao = ac.getBean(UserDao.class);
//        User user = new User();

//
//        user.setImg("sdiaihdak");
//        user.setCreate_time(new Date());
//        user.setEmail("lsjdajd");
//        user.setTel("djaisjdiaj");
//        user.setStatus(1);
//        user.setUpdate_time(new Date());

//        user.setPassword("mmm");
//        user.setType(1);
//        user.setLogin_name("mmn");
//        userDao.add(user);

    }
}
