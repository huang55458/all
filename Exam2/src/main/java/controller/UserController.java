package controller;

import entity.User;
import service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired(required = true)
    private UserService us;
//
//    @RequestMapping(value = "/checkLoginName", produces = "text/html;charset=UTF-8")
//    public String checkLoginName(String login_name) {
//        if (us.checkLoginName(login_name)) return "该账号已存在!";
//        return "账号可以使用！";
//    }
//
//    @RequestMapping("insertUser.do")
//    public String insertUser(User user, MultipartFile myHead, HttpServletRequest req, HttpSession session) {
//        if (myHead.getOriginalFilename().length() > 0) {
//            user.setImg(UploadDownloadUtil.upload(req, myHead));
//        }
//        us.insertUser(user);
//        return "redirect:userList.do";
//    }
//
//    @RequestMapping("register.do")
//    public String register(User user, MultipartFile myHead,HttpServletRequest req) {
//        if (myHead.getOriginalFilename().length() > 0) {
//            user.setImg(UploadDownloadUtil.upload(req, myHead));
//        }
//
//        user.setCreate_time(new Date());
//        user.setUpdate_time(new Date());
//        us.insertUser(user);
//        return "redirect:/login.jsp";
//    }

//    @RequestMapping("deleteUserById.do")
//    public String deleteUserById(int id, int type,String img, HttpServletRequest req) {
//        us.deleteUserById(id);
//        String path = req.getS getContextPath().getRealPath("/upload") + File.separator + img;
//        File f = new File(path);
//        f.delete();
//        return "redirect:userList.do";
//    }
//
//    @RequestMapping("updateUserById.do")
//    public String updateUserById(User u, MultipartFile myHead, HttpServletRequest req) {
//        User user = us.selectUserById(u.getId());
//        if (myHead.getOriginalFilename().length() > 0) {
//            String path = req.getServletContext().getRealPath("/upload") + File.separator + u.getImg();
//            File f = new File(path);
//            f.delete();
//            u.setImg(UploadDownloadUtil.upload(req, myHead));
//        }
//        us.updateUserById(u);
//        return "redirect:userList.do";
//    }

    @RequestMapping("/userList.do")
    public String userList(User user,Model model) {
        List<User> list = us.findUserAll();
        User user1 = us.fingUserByLogin(user);
        if (user1 == null){
            return "login";
        }
        model.addAttribute("list", list);
        return "user_list";
    }


}
