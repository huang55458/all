package server;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.Socket;
import java.util.Scanner;

public class ClientTest{
    /**
    *客户端应用程序
     * 实现向服务端发送一条数据
    * @param 余绅
    * @return
    * @date 2022/5/17 14:41
    */
    private Socket socket;
    HttpSession session;
    public ClientTest(HttpSession session){
        try {
            socket = new Socket("localhost",8088);
            this.session = session;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//    private class ReadThread implements Runnable {
//        @Override
//        public void run() {
//                try {
//                    InputStream in = socket.getInputStream();
//                    InputStreamReader isr = new InputStreamReader(in, "utf-8");
//                    BufferedReader br = new BufferedReader(isr);
//                    String a = null;
//                    while ((a = br.readLine())!=null) {
//                    System.out.println(a);
//                    }
//                }catch (IOException e){
//                    e.printStackTrace();
//
//            }
//        }
//    }
    /**
    *   客户端的工作方法
    * @param
    * @return
    * @date 2022/5/17 14:55
    */
    public void run(){
        try {
//            ReadThread readThread = new ReadThread();
//            Thread t = new Thread(readThread);
//            t.setDaemon(true);
//            t.start();
            OutputStream out = socket.getOutputStream();
            OutputStreamWriter osw = new OutputStreamWriter(out,"utf-8");
            PrintWriter pw = new PrintWriter(osw,true);
            while (true){
                this.wait(1000);
                if (session.getAttribute("userId")!=null){
                    int userId = Integer.parseInt((String) session.getAttribute("userId"));
                    System.out.println(userId);
                    pw.println(userId);
                    session.setAttribute("userId",null);
                }
                if (session.getAttribute("friendId")!=null){
                    int friendId = Integer.parseInt((String) session.getAttribute("friendId"));
                    System.out.println(friendId);
                    pw.println(friendId);
                    session.setAttribute("friendId",null);
                }
                if (session.getAttribute("message")!=null){
                    String message = (String) session.getAttribute("message");
                    System.out.println(message);
                    pw.println(message);
                    session.setAttribute("message",null);
                }

            }
        }catch (IOException | InterruptedException e){
            e.printStackTrace();
        }finally {
            try {
                if (socket!=null){
                socket.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    }

