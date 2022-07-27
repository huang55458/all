package controller;

import entity.User;
import entity.User_Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.RoleService;
import service.UserService;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;

    /*
        添加用户拥有的角色
     */
    @RequestMapping("/add")
    public ModelAndView addRole(User_Role user_role,ModelAndView modelAndView){
        if (roleService.addRole(user_role)){
            System.out.println("添加角色成功..");
        }else {
            System.out.println("角色身份已存在，添加失败");
        }
        modelAndView.setViewName("/user_list");
        return modelAndView;
    }

    /*
        根据用户编号查询角色信息
     */
    @RequestMapping("/queryRole")
    public ModelAndView queryRole(@RequestParam("uid")Integer uid,ModelAndView modelAndView){
        Map<String,Object> map = new HashMap<>();
        List<User_Role> roleByUid = roleService.findRoleByUid(uid);
        User user = userService.findById(uid);
        modelAndView.addObject("curUser",user);
        if(roleByUid.size() > 0){
            for (User_Role user_role : roleByUid){
                System.out.println(user_role);
            }
        }else {
            System.out.println("查询无数据...");
        }
        modelAndView.addObject("user_role",roleByUid);
        //设置跳转视图
        modelAndView.setViewName("/permission/roleEdit.jsp");
        return modelAndView;
    }

    //修改角色信息,需要传递修改后（复选框实现）的角色信息
    @Transactional
    @RequestMapping("/alter")
    public ModelAndView alterRole2(@RequestParam("uid")Integer uid, @RequestParam("rolelist") Integer[] roleids,
                    ModelAndView modelAndView){
        //先查询当前没有选择角色的信息
        List<Integer> withoutRole = roleService.findWithoutRole(uid, Arrays.asList(roleids));
        //删除没有选择的角色信息
        if (withoutRole != null && withoutRole.size() > 0){
            roleService.deleteRole(uid,withoutRole);
        }
        //添加选择的角色信息
        for (Integer roleid: roleids){
            roleService.addRole(new User_Role(uid,roleid));
        }
        //在此设置跳转视图
        modelAndView.setViewName("/user_list");
        return modelAndView;
    }

    @RequestMapping("/alterRole")
    public String alterRole(@RequestParam("uid")Integer uid,@RequestParam("rolelist")Integer[] roleids,
                            ModelAndView modelAndView){
        //先查询当前没有选择角色的信息
        List<Integer> withoutRole = roleService.findWithoutRole(uid, Arrays.asList(roleids));

        //删除没有选择的角色信息
        if (withoutRole != null && withoutRole.size() > 0){
            roleService.deleteRole(uid,withoutRole);
        }
        //添加选择的角色信息
        for (Integer roleid: roleids){
            roleService.addRole(new User_Role(uid,roleid));
        }
        return "forward:/user/userList.do";
    }

    @RequestMapping("/getRoleInfo")
    public String test(){
        return "/user/roleEdit";
    }
}
