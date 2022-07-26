package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/test")
public class LoginController {
    @Autowired
    private UserService userService;

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
        if (!vcode.equals(code)) {
            session.setAttribute("msg", "验证码错误");
            return "redirect:/";
        } else if (user != null && !"".equals(user)) {
            session.setAttribute("user", user);
            return "redirect:/index.jsp";
        } else {
            session.setAttribute("error", "用户名或密码错误");
            return "redirect:/";
        }

    }
}

