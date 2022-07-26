package server;

import org.springframework.stereotype.Controller;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ServerV4 extends Thread{
//    private List<PrintWriter> allout;
    //使用hashmap存储用户名和输出流
    private  volatile HashMap<String, PrintWriter> allout;
    //开辟线程池
    private ThreadPoolExecutor threadPoor;
    //开辟工作队列
    private LinkedBlockingQueue<Runnable> queue;
    private ServerSocket serverSocket;
    /*
    * 构造方法，用于初始化
    * */




    public ServerV4(){
        try {
            queue = new LinkedBlockingQueue<Runnable>(10);
            serverSocket = new ServerSocket(8088);
//            allout = new ArrayList<PrintWriter>();
            allout = new HashMap<String, PrintWriter>();
            threadPoor = new ThreadPoolExecutor(5,10,60, TimeUnit.SECONDS,queue);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private class ClientHandler implements Runnable {
        //该线程用于处理客户端的socket对象
        private Socket socket;

        public ClientHandler(Socket socket) {
            this.socket = socket;
        }

        @Override
        public void run() {
            PrintWriter pw = null;
            BufferedReader br = null;
            //创建向对应客户端发送信息的输出流对象
            try {
                OutputStream out = socket.getOutputStream();
                OutputStreamWriter osw = new OutputStreamWriter(out, "utf-8");
                pw = new PrintWriter(osw, true);

                //将该流存入共享集合
//                alloutadd(pw);

                //先获取客户端发送的信息
                br = new BufferedReader(new InputStreamReader(socket.getInputStream(), "utf-8"));
                //获取用户名和输出流
                String num = br.readLine();

                alloutadd((num),pw);
//                System.out.println(allout);
                //通过输入流读取私聊对象
                String duix = null;
                duix = br.readLine();
                String[] duixs =  duix.split("\\:");
                PrintWriter p = allout.get(duixs[0]);
                String message = null;
                while ((message = br.readLine()) != null) {
//                    System.out.println("客户端" + Thread.currentThread().getName() + "说：" + message);
                    if (message.indexOf(":")!=-1) {
                        duixs = message.split("\\:");
//                        System.out.println(duixs[0]);
                        if (allout.get(duixs[0]) != null) {
                            p = allout.get(duixs[0]);
                            continue;
                        }
                    }
                    sendMessage(p,num+":"+message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                /*
                 * 当客户端断线，要将输出流从共享集合中删除
                 * */
                remove(pw);
                if(socket!=null) {
                    try {
                        socket.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }


        }




        }
    public void run() {
        //监听客户端连接并且得到客户端的socket对象
        try {
            while (true) {
//                System.out.println("等待客户端连接");
                //监听客户端连接并且得到客户端的socket对象
                Socket socket = serverSocket.accept();//阻塞
//                System.out.println("客户端已经连接");
                //每监听到一个客户端的连接则运行线程池
                ClientHandler handler = new ClientHandler(socket);
                threadPoor.execute(handler);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {

            try {
                if (serverSocket != null) {
                    serverSocket.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    //    将输出流存入共享集合
    private synchronized void alloutadd(String name, PrintWriter pw) {
//        allout.add(pw);
        allout.put(name,pw);
    }
    //    将消息转发给所有客户端
    private synchronized void sendMessage(PrintWriter pw, String message) {
//        for(PrintWriter o:allout) {
//            o.println(message);
//        }
        if (message!=null){
        pw.println(message);
        }
    }
    //    将给定输出流从共享集合删除
    private synchronized void remove(PrintWriter pw) {
        allout.remove(pw);
    }

}




