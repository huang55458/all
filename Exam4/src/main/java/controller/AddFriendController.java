package controller;

import dao.UserDao;
import dao.User_relation_Dao;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AddFriendController {
    @Autowired
    User_relation_Dao dao;
    @Autowired
    UserDao userDao;

    @RequestMapping("findByName.do")
    @ResponseBody
    public String findByName(HttpServletRequest request, Model model){
        String user_name = request.getParameter("findName");
//        System.out.println(user_name);
        List<User> list = userDao.findByUserName(user_name);
//        request.setAttribute("allUser",list);
        request.getSession().setAttribute("allUser",list);
//        return "/main.jsp";
        return "1";
    }
    @RequestMapping("addFriend.do")
    @ResponseBody
    public String addFriend(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int friendId =Integer.parseInt(request.getParameter("id"));
        List<User> allMyFriend = dao.findAllMyFriend(userId);
        String message = "true";
        for (User user:allMyFriend){
            if (user.getId()==friendId){
                message = "1";
            }
        }

        List<Integer> list = dao.selectBan(userId);
        for (int i :list){
            if (i==friendId){
                message = "0";
            }
        }
        List<Integer> list2 = dao.selecttwo(userId);
        for (int i :list2){
            if (i==friendId){
                message = "2";

            }
        }

        List<Integer> list3 = dao.selectBaned(friendId);
        for (int i :list3){
            if (i==userId){
                message = "3";
            }
        }


        if (message.equals("true")) {
            dao.addFriendApply(userId, friendId);
        }

        return message;
    }
    @RequestMapping("messageFind.do")
    @ResponseBody
    public String messageFind(HttpServletRequest request,HttpServletResponse response){
//        System.out.println("我是"+request.getSession().getAttribute("userId"));
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
//        System.out.println(userId);
        List<User> users = dao.selectMessage(userId);

        String flag = "0";
        if (users.size()!=0){
            flag = "1";
        }
        return flag;
    }

    @RequestMapping("toMessagePage.do")
    public String toMessagePage(){
        return "/message.jsp";
    }
    @RequestMapping("toSheJiaoPage.do")
    public String toSheJiaoPage(){
        return "/WEB-INF/jsp/shejiao.jsp";
    }




    @RequestMapping("messageFindAll.do")
    @ResponseBody
    public String messageFindAll(HttpServletRequest request,HttpServletResponse response){
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        List<User> applyUsers = dao.selectMessage(userId);
        request.getSession().setAttribute("applyUsers",applyUsers);
//        request.setAttribute("applyUsers",applyUsers);
        return "0";
    }

    @RequestMapping("acceptApply.do")
    @ResponseBody
    public String acceptApply(HttpServletRequest request,HttpServletResponse response){
        int beiApp_id = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int applicant_id =Integer.parseInt(request.getParameter("id"));
        dao.agreeApply(applicant_id,beiApp_id);
        return "0";
    }

    @RequestMapping("refuseApply.do")
    @ResponseBody
    public String refuseApply(HttpServletRequest request,HttpServletResponse response){
        int beiApp_id = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int applicant_id =Integer.parseInt(request.getParameter("id"));
        dao.refuseApply(applicant_id,beiApp_id);
        return "0";
    }

    @RequestMapping("myAllFriendsListssss.do")
    @ResponseBody
    public String myAllFriendsList(HttpServletRequest request,HttpServletResponse response){
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        List<User> friendsList = dao.findAllMyFriend(userId);
//        System.out.println(friendsList);
        request.getSession().setAttribute("friendsList",friendsList);
        return "0";
    }

    @RequestMapping("myAllbansListssss.do")
    @ResponseBody
    public String myAllbansListssss(HttpServletRequest request,HttpServletResponse response){
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        List<User> bansList = dao.allMyBan(userId);
//        System.out.println(friendsList);
        request.getSession().setAttribute("bansList",bansList);
        return "0";
    }




    @RequestMapping("deleteMyFriendReal.do")
    @ResponseBody
    public String deleteMyFriendReal(HttpServletRequest request,HttpServletResponse response){
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int friendId =Integer.parseInt(request.getParameter("id"));
        dao.deleteFriend(userId,friendId);
        return "0";
    }

    @RequestMapping("banMyFriendReal.do")
    @ResponseBody
    public String banMyFriendReal(HttpServletRequest request,HttpServletResponse response){
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int friendId =Integer.parseInt(request.getParameter("id"));
        dao.deleteFriend(userId,friendId);
        dao.banFriend(userId,friendId);
        return "0";
    }


    @RequestMapping("cancelBan.do")
    @ResponseBody
    public String cancelBanUser(HttpServletRequest request,HttpServletResponse response){
        int applicant_id = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        int beiApp_id =Integer.parseInt(request.getParameter("id"));
        dao.cancelBan(applicant_id,beiApp_id);
        return "0";
    }

    @RequestMapping("logout.do")
    public void logout(HttpServletRequest request){
        System.out.println("浏览器关闭了！");
        int userId = Integer.parseInt((String) request.getSession().getAttribute("userId"));
        dao.logout(userId);
    }
}
