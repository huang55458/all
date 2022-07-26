package test;

import dao.User_relation_Dao;
import entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class testRelation {
    @Test
    public void testRelation(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        List<User> myFriend = relationDao.findAllMyFriend(1);
        for (User u:myFriend
             ) {
            System.out.println(u.getUser_name());
        }
    }

    @Test
    public void testAddfriendApply(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        relationDao.addFriendApply(4,1);
    }

    @Test
    public void testAgreefriendApply(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        relationDao.agreeApply(4,1);
    }

    @Test
    public void testRefusefriendApply(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        relationDao.refuseApply(4,1);
    }

    @Test
    public void testDeletefriend(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        relationDao.deleteFriend(1,5);
    }

    @Test
    public void testBanfriend(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        User_relation_Dao relationDao = ac.getBean(User_relation_Dao.class);
        relationDao.deleteFriend(4,1);
        relationDao.banFriend(1,4);
    }
}
