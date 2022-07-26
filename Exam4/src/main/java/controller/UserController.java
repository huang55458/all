package controller;

import dao.UserDao;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import page.PageInfo;
//import service.PageInfoService;
//import service.UserService;
//import util.Upload;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserDao userDao;
//    private int id;
//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        dateFormat.setLenient(false);
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//    }

//    /**
//     * 用户管理列表页
//     * @param model
//     * @return
//     */
//    @RequestMapping(value="/list.do",method=RequestMethod.GET)
//    public ModelAndView list(ModelAndView model){
//        model.setViewName("jsp/user_list");
//        return model;
//    }

    @RequestMapping("/userInfo.do")
    public String userInfo(HttpSession session) {
//        List<User> userList = userService.findAll();
//        session.setAttribute("userList", userList);
        return "/WEB-INF/user/userInfo.jsp";
    }


    /**
     * 进入新增页面
     */
    @RequestMapping("/add.do")
    public String edit() {

        return "/WEB-INF/user/editUser.jsp";
    }

    /**
     * 保存用户信息
     */

    @RequestMapping("/toadd.do")
    public String register(User user,@RequestParam(value = "file") MultipartFile file,HttpServletRequest request){
        //        找个路径存放用户上传的图片,可以是任意的路径
        String path = request.getSession().getServletContext().getRealPath("upload");
//        MultipartFile file存放了要上传的文件信息
//        获取上传的文件名
        String fileName = file.getOriginalFilename();
//        构建file对象,将上传路径和上传后的文件名封装成File对象
        File targetFile = new File(path,fileName);
        if (!targetFile.exists()){
            targetFile.mkdirs();
        }
        try {
//            开始读取
            file.transferTo(targetFile);
//            Thumbnails.of(targetFile).scale(0.7f).outputQuality(0.25d).toOutputStream(out);
//            对数据进行存储
//            model.addAttribute("fileUrl",request.getContextPath()+"/upload/"+fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        user.setImg(request.getContextPath()+"/upload/"+fileName);
        user.setCreate_time(new Date());
        user.setUpdate_time(new Date());
        userDao.add(user);
        return "redirect:/user/userInfo.do";
    }



    @RequestMapping("/ser.do")
    public String SearchUser(User user) {
//        userService.findSearchUser(user);
        return "redirect:/user/userInfo.do";
    }

    /**
     * 进入更新页面
     */
//    @RequestMapping("/renewalUser.do")
//    public String renewal(HttpServletRequest request,@Param("id") Integer id) {
//
//        User u = userService.selectById(id);
//        getRequest().setAttribute("u", u);
//        return "user/renewalUser";
//    }

    /**
     * 更新用户信息
     */
//    @RequestMapping(value="updateUser")
//    public String update(User user) {
//
//        //User u = userService.selectUserById(user.getId());
//        userService.updateUserById(user);
//
//        return "redirect:userInfo";
//    }
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(defaultValue = "1") int currentPage, String user_name,
                                @RequestParam(defaultValue = "0") int type, HttpSession session) {
        if (type == 1) {
            session.setAttribute("searchname", user_name);
        } else if (type == 0) {
            user_name = (String) session.getAttribute("searchname");
        } else if (type == 2) {
            session.removeAttribute("searchname");
        }
        //调用服务层方法的到PageInfo的对象
//        PageInfo<User> pageInfo = pageInfoService.findAll(currentPage, user_name);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user-list");
        //PageInfo对象
//        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;


}

//    @RequestMapping("/mod.do")
//    public String update(String login_name,String password,User user,Model model,HttpSession session){
////        UserDao dao = sqlSession.getMapper(UserDao.class);
////        List<User> users = userService.findAll();
//        User user1 = userService.find(login_name,password);
//        session.setAttribute("user",user1);
//        session.getAttribute(login_name);
//        session.getAttribute(password);
//        userService.edit(user);
////        userService.update(user);
////        model.addAttribute("users",users);
//        return "jsp/modUser";
//    }
//@RequestMapping(value="/get_list.do",method= RequestMethod.POST)
//@ResponseBody
//public Map<String, Object> getList(
//        @RequestParam(value="login_name",required=false,defaultValue="") String login_name,
//        Page page
//){
//    Map<String, Object> ret = new HashMap<String, Object>();
//    Map<String, Object> queryMap = new HashMap<String, Object>();
//    queryMap.put("login_name", "%"+login_name+"%");
//    queryMap.put("offset", page.getOffset());
//    queryMap.put("pageSize", page.getRows());
//    ret.put("rows", userService.findList(queryMap));
//    ret.put("total", userService.getTotal(queryMap));
//    return ret;
//}
//
//
//    @RequestMapping(value="/delete",method=RequestMethod.POST)
//    @ResponseBody
//    public Map<String, String> delete(
//            @RequestParam(value="ids[]",required=true) Long[] ids
//    ){
//        Map<String, String> ret = new HashMap<String, String>();
//        if(ids == null){
//            ret.put("type", "error");
//            ret.put("msg", "请选择要删除的数据!");
//            return ret;
//        }
//        String idsString = "";
//        for(Long id:ids){
//            idsString += id + ",";
//        }
//        idsString = idsString.substring(0,idsString.length()-1);
//        if(userService.delete(idsString) <= 0){
//            ret.put("type", "error");
//            ret.put("msg", "删除失败!");
//            return ret;
//        }
//        ret.put("type", "success");
//        ret.put("msg", "修改成功!");
//        return ret;
//    }
//    @RequestMapping(value="/edit",method=RequestMethod.POST)
//    @ResponseBody
//    public Map<String, String> edit(User user){
//        Map<String, String> ret = new HashMap<String, String>();
//        if(user == null){
//            ret.put("type", "error");
//            ret.put("msg", "数据绑定出错，请联系开发作者!");
//            return ret;
//        }
//        if(StringUtils.isEmpty(user.getLogin_name())){
//            ret.put("type", "error");
//            ret.put("msg", "登录名不能为空!");
//            return ret;
//        }
//        if(StringUtils.isEmpty(user.getPassword())){
//            ret.put("type", "error");
//            ret.put("msg", "密码不能为空!");
//            return ret;
//        }
//        User existUser = userService.findByUserName(user.getLogin_name());
//        if(existUser != null){
//            if(user.getId() != existUser.getId()){
//                ret.put("type", "error");
//                ret.put("msg", "该用户名已经存在!");
//                return ret;
//            }
//
//        }
//        if(userService.edit(user) <= 0){
//            ret.put("type", "error");
//            ret.put("msg", "修改失败!");
//            return ret;
//        }
//        ret.put("type", "success");
//        ret.put("msg", "修改成功!");
//        return ret;
//    }
//
//
//    /**
//     * 添加用户操作
//     * @param user
//     * @return
//     */
//    @RequestMapping(value="/add.do",method=RequestMethod.POST)
//    @ResponseBody
//    public Map<String, String> add(User user){
//        Map<String, String> ret = new HashMap<String, String>();
//        if(user == null){
//            ret.put("type", "error");
//            ret.put("msg", "数据绑定出错，请联系开发作者!");
//            return ret;
//        }
//        if(StringUtils.isEmpty(user.getLogin_name())){
//            ret.put("type", "error");
//            ret.put("msg", "登录名不能为空!");
//            return ret;
//        }
//        if(StringUtils.isEmpty(user.getPassword())){
//            ret.put("type", "error");
//            ret.put("msg", "密码不能为空!");
//            return ret;
//        }
//        User existUser = userService.findByUserName(user.getLogin_name());
//        if(existUser != null){
//            ret.put("type", "error");
//            ret.put("msg", "该登录名已经存在!");
//            return ret;
//        }
//        if(userService.add(user) <= 0){
//            ret.put("type", "error");
//            ret.put("msg", "添加失败!");
//            return ret;
//        }
//        ret.put("type", "success");
//        ret.put("msg", "添加成功!");
//        return ret;
//    }

    //查找用户















//    @RequestMapping("logout.do")
//    public void logout(){
//        System.out.println("浏览器关闭了！");
////        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
//
//    }
}
