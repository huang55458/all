package controller;

import entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.PermissionService;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService ps;

    /*
        查询系统所有的权限信息
     */
    @RequestMapping("/getAll")
    public ModelAndView getAll(ModelAndView modelAndView){
        List<Permission> perlist = ps.getAll();
        modelAndView.addObject("perlist",perlist);
        modelAndView.setViewName("permission_list");
        return modelAndView;
    }

    /*
        查询角色拥有的权限信息
     */
    @RequestMapping("/getOne")
    @ResponseBody
    public ModelAndView getRolePermission(@RequestParam("role_id")Integer role_id, ModelAndView modelAndView){
        List<Permission> permissions = ps.selectByRid(role_id);
        modelAndView.addObject("permissions",permissions);
        modelAndView.setViewName("permission_list");
        return modelAndView;
    }

    /*
        修改角色拥有的权限
     */
    @RequestMapping("/alter")
    public ModelAndView alterPermission(@RequestParam("role_id")Integer role_id, @RequestParam("perIds")Integer[] perIds,
                                        ModelAndView modelAndView){
        List<Integer> wp = ps.findWithoutPermission(role_id, Arrays.asList(perIds));
        boolean b = ps.deletePermission(role_id, wp);
        for (Integer perid:perIds){
            ps.addPermission(role_id,perid);
        }
        modelAndView.setViewName("permission_list");
        return modelAndView;
    }
}
