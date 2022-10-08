package com.chumeng.springboot.controller;

import com.chumeng.springboot.dao.UsesDao;
import com.chumeng.springboot.entity.User;
import com.chumeng.springboot.entity.Uses;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/28 15:29
 */
@Log4j2
@Controller
public class NaviController {
    private UsesDao usesDao;

    public UsesDao getUsesDao() {
        return usesDao;
    }

    @Autowired
    public void setUsesDao(UsesDao usesDao) {
        this.usesDao = usesDao;
    }

    @GetMapping("test")
    public String test(ModelMap  model) {
        log.error("test ......  ");
//        Class.forName("ffff.class");
        model.addAttribute("date",new Date());
        model.addAttribute("sex","男");
        model.addAttribute("id","1");
        model.addAttribute("msg","thymeleaf");

        List<Uses> list =  usesDao.findAll();
        model.addAttribute("allUses",list);

        return "test";
    }

    @GetMapping("test1")
    public String test1(HttpServletRequest request, Model model) {
        ArrayList<User> list = new ArrayList<>();
        list.add(new User(1,"张三",20));
        list.add(new User(2,"张三",20));
        list.add(new User(3,"张三",20));
        model.addAttribute("users",list);

        request.setAttribute("request","request");
        request.getSession().setAttribute("session","session");
        request.getServletContext().setAttribute("servletContext","servletContext");
        return "test1";
    }

//    @ResponseBody
//    @GetMapping("test1/{id}")
//    public String test1(
//            @PathVariable int id
//    ){
//        return "id : " + id;
//    }
}
