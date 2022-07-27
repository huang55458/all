package controller;

import entity.User;
import entity.User_Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.RoleService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/test")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
//    @RequestMapping("/tologin.do")
//    public String tologin(){
//        return "jsp/login";
//    }


    @RequestMapping("/to.do")
    public String login(String login_name, String password, Model model,
                        HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String vcode = req.getParameter("vcode");
        String code = (String) session.getAttribute("code");
        User user = userService.find(login_name, password);

        //先清楚用户角色的session信息
        session.removeAttribute("currentRole");

        if (!vcode.equals(code)) {
            session.setAttribute("msg", "验证码错误");
            return "redirect:/";
        } else if (user != null) {
            user.setStatus(1);
            userService.update(user);


            //获取当前用户拥有的角色
            List<User_Role> roleByUid = roleService.findRoleByUid(user.getId());
            for (User_Role user_role : roleByUid) {
                //判断当前用户角色是否为学生，并向session存入用户角色信息
                if(user_role.getRole_id() == 3){
                    Object currentRole = session.getAttribute("currentRole");
                    String roleName = "";
                    if (currentRole != null){
                        roleName += currentRole.toString() + ",student";
                    }else {
                        roleName = "student";
                    }
                    session.setAttribute("currentRole",roleName);
                }else if (user_role.getRole_id() == 1){
                    Object currentRole = session.getAttribute("currentRole");
                    String roleName = "";
                    if (currentRole != null){
                        roleName += currentRole.toString() + ",admin";
                    }else {
                        roleName = "admin";
                    }
                    session.setAttribute("currentRole",roleName);
                }else{
                    Object currentRole = session.getAttribute("currentRole");
                    String roleName = "";
                    if (currentRole != null){
                        roleName += currentRole.toString() + ",teacher";
                    }else {
                        roleName = "teacher";
                    }
                    session.setAttribute("currentRole",roleName);
                }
            }

            // 测试
            Object currentRole = session.getAttribute("currentRole");
            String currentRoleStr = null;
            if (currentRole != null) {
                currentRoleStr = currentRole.toString();
                System.out.println("currentRole:"+currentRole.toString());
            }

            String sessionId = session.getId();
            Cookie cookie = new Cookie("JSESSIONID",sessionId);
            cookie.setPath("/");
            resp.addCookie(cookie);

            session.setAttribute("user", user);
            return "redirect:/frontPage.form";
        } else {
            session.setAttribute("error", "用户名或密码错误");
            return "redirect:/";
        }

    }
}

