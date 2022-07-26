package controller;

import com.google.gson.Gson;
import dao.UserDao;
import dao.User_relation_Dao;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestFriend {
    @Autowired
    UserDao userDao;
    @Autowired
    User_relation_Dao user_relation_dao;


    @RequestMapping("showFriends.do")
    public String test(HttpServletRequest request){
        int id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("userId")));
        List<User> allMyFriend = user_relation_dao.findAllMyFriend(id);
//        System.out.println(allMyFriend);
        request.setAttribute("friends",allMyFriend);
        return "/WEB-INF/jsp/testFriend.jsp";
//        Client client = new Client();
//        client.start("1111");
    }

    @RequestMapping("denglu.do")
    public String testdenglu(HttpServletRequest request){
        Client client = (Client) request.getSession().getAttribute("client");
        request.getSession().setAttribute("userId",request.getParameter("userId"));
        client.start(request);

//        return "/WEB-INF/jsp/testFriend.jsp";
        return "/main.jsp";
//        Client client = new Client();
//        client.start("1111");
    }

    @RequestMapping("findFriend.do")
    public String findFriend(HttpServletRequest request){
        Client client = (Client) request.getSession().getAttribute("client");
        String friendId = request.getParameter("friendId");
        int id = Integer.parseInt(friendId.substring(0, friendId.indexOf(":")));
        User myFriend = userDao.findById(id);
//        User mine = userDao.findById(Integer.parseInt(client.userId));
//        request.getSession().setAttribute("mine",mine);
        request.getSession().setAttribute("friend",myFriend);
        client.findFriend(request);
//        int id = Integer.parseInt((String) request.getSession().getAttribute("userId"));
//        request.getSession().setAttribute("friendId",request.getParameter("friendId"));
        return "/WEB-INF/jsp/shejiao.jsp";
//        return "/WEB-INF/jsp/testFriend.jsp";
//        Client client = new Client();
//        client.start("1111");
    }

    @RequestMapping("talkfriend.do")
    @ResponseBody
    public void talk(@RequestBody String str1, HttpServletRequest request){
        String str =null;

        try {
            str = URLDecoder.decode(str1, "utf-8");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

//        System.out.println(str);
        String str2 = str.substring(0,str.indexOf("="));
        Client client = (Client) request.getSession().getAttribute("client");
//        String message = (String) request.getParameter("message");
//        System.out.println("发送的信息"+message);
//        request.getSession().setAttribute("userId",request.getParameter("userId"));
        client.talk2(request,str2);
//        User friend = (User) request.getSession().getAttribute("friend");
        client.message.add(request.getSession().getAttribute("userId")+"-"+client.friendId+str2);
//        return "/WEB-INF/jsp/talking.jsp";
//        Client client = new Client();
//        client.start("1111");
    }

    @RequestMapping("acceptMes.do")
//    @ResponseBody
    public void acceptMes(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Client client = (Client) request.getSession().getAttribute("client");
        List<String> message = new ArrayList<String>();
//        System.out.println(client.message);
//        int size1 = client.message.size();
            for (String s : client.message) {
                String[] ss = s.split("\\:");
                if ((ss[0]+":").equals(client.userId+"-"+client.friendId)){
                    message.add(s);
                }
//                String mes = s.substring(s.indexOf(":") + 1);
                if ((ss[0] + ":").equals(client.friendId)) {
//                int size = message.size();


                    message.add(s);

//                    message.add(mes);
//                Gson gson = new Gson();
//                String m = gson.toJson(message);
//                response.getWriter().write(m);

            }
        }
//        System.out.println(message);
//        if (size1!=0){
//            int size = (int) request.getSession().getAttribute("size");
//            System.out.println(size+"aaaaaa");
//            System.out.println(request.getSession()+""+message.size()+"bbbbbbbbbb");
//            if (message.size()>size){
//
//                request.getSession().setAttribute("flag","1");
//                System.out.println(request.getSession());
//                if (Integer.parseInt((String) request.getSession().getAttribute("flag"))==1&&(flag%10==9)) {
//                    System.out.println(111111111);
//                    request.getSession().setAttribute("size", message.size());
//                }
//            }
//        }else {
//            request.getSession().setAttribute("size", message.size());
//            request.getSession().setAttribute("flag1", "1");
//        }

        Gson gson = new Gson();
        String s = gson.toJson(message);
        response.getWriter().write(s);
    }

    @RequestMapping("talking.do")
    public String talkingWithFriend(){
        return "/WEB-INF/jsp/talking.jsp";
    }
}
