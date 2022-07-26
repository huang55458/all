package controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import server.ClientTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

//@Scope("prototype")
public class Client {
    volatile List<String> message;
    private Socket socket;
    PrintWriter pw ;

    String friendId;

    String userId;

    public Client(){
        try {
            socket = new Socket("localhost",8088);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private class ReadThread implements Runnable {
        @Override
        public void run() {
            try {
                message = new ArrayList<String>();
                InputStream in = socket.getInputStream();
                InputStreamReader isr = new InputStreamReader(in, "utf-8");
                BufferedReader br = new BufferedReader(isr);
                String a = null;
                while ((a = br.readLine())!=null) {
                    message.add(a);
//                    String[] s =  a.split("\\:");
//
//                    if (s[0].equals(friendId)){
//
//                        soloMessage.add(a);
//                    }
                    System.out.println("别人对我说："+a);
                }
            }catch (IOException e){
                e.printStackTrace();

            }
        }
    }

//    @RequestMapping("denglu.do")
    public void start(HttpServletRequest request){
        OutputStream out = null;
        try {
            ReadThread readThread = new ReadThread();
            Thread t = new Thread(readThread);
            t.setDaemon(true);
            t.start();
            out = socket.getOutputStream();
            OutputStreamWriter osw = new OutputStreamWriter(out,"utf-8");
            pw = new PrintWriter(osw,true);
//            System.out.println(pw);
            userId =(String) request.getParameter("userId");
            request.getSession().setAttribute("userId",userId);
            pw.println(userId);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
//    @RequestMapping("findFriend.do")
    public void findFriend(HttpServletRequest request){
//        HttpSession session = request.getSession();
//        int id = Integer.parseInt((String) request.getSession().getAttribute("userId"));
//        request.getSession().setAttribute("friendId",request.getParameter("friendId"));
//        if (session.getAttribute("friendId")!=null){
//            int friendId = Integer.parseInt((String) session.getAttribute("friendId"));
//            pw.println(friendId);
//            session.setAttribute("friendId",null);
//        }
        friendId = request.getParameter("friendId");
//        System.out.println(pw);
//        System.out.println(friendId);
        pw.println(friendId);
//        Client client = new Client();
//        client.start("1111");
    }

//    @RequestMapping("talk.do")
    public void talk2(HttpServletRequest request,String str){
//        HttpSession session = request.getSession();
//        request.getSession().setAttribute("message",request.getParameter("message"));
//        if (session.getAttribute("message")!=null){
//            String message = (String) session.getAttribute("message");
//            pw.println(message);
//        }
        String message = (String) request.getParameter("message");
//        System.out.println(str);
        pw.println(str);

    }

}
