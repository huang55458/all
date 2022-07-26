package controller;


import dao.PermsDao;
import entity.Perms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import service.PermsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author Zhoupiyao
 * @Create 2021/10/8
 * @Time 9:25
 **/
@Controller
@RequestMapping("/perms")
public class PermsController {
    @Autowired
    private PermsService permsService;
    @Autowired
    private PermsDao permsDao;

//    @RequiresPermissions("sys:perms:list")
    @RequestMapping("/list.do")
   public String findList(Perms perms, HttpSession session) {
        List<Perms> permsList=permsDao.queryAll(perms);
        session.setAttribute("permsList",permsList);
        return "/per_list.jsp";
    }

//    @RequestMapping("/list/{id}")
//    public Perms query(@PathVariable("id") int id){
//        return permsService.queryById(id);
//    }

//    @RequiresPermissions("sys:perms:save")
//    @RequestMapping("/add.do")
//    public int add(@RequestBody Perms perms){
//        System.out.println(perms);
//        return permsService.insert(perms);
//    }
    @RequestMapping("/add.do")
    public String edit() {

        return "/addPer.jsp";
    }

    /**
     * 保存用户信息
     */

    @RequestMapping("/toadd.do")
    public String register(Perms perms, HttpServletRequest request){

        permsService.insert(perms);
        return "redirect:/user/userList.do";
    }

//    @RequiresPermissions("sys:perms:del")
    @RequestMapping("/delete.do")
    public int delete(int[] ids){
        return permsService.deleteBatch(ids);
    }

//    @RequiresPermissions("sys:perms:update")
    @RequestMapping("/update.do")
    public int update(@RequestBody Perms perms){
        return permsService.update(perms);
    }

}
