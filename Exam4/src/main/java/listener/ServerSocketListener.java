package listener;

import server.ServerV4;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
@WebListener
public class ServerSocketListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
//        System.out.println("我是服务器");
//        try {
//            ServerSocket serverSocket = new ServerSocket();
//            serverSocket.bind(new InetSocketAddress(8088));
//            servletContextEvent.getServletContext().setAttribute("serverSocket",serverSocket);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        System.out.println(1111);
        ServerV4 serverV4 = new ServerV4();
        Thread t1 = new Thread(serverV4);
        t1.setDaemon(true);
//        try {
//            t1.sleep(1000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        t1.start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
