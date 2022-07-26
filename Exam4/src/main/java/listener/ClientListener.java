package listener;

import controller.Client;
import server.ClientTest;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
@WebListener
public class ClientListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
//        System.out.println("我是客户端");
        HttpSession session = httpSessionEvent.getSession();
//        System.out.println(session);
//        ClientTest client = new ClientTest(session);
        Client client = new Client();
        session.setAttribute("client",client);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

    }
}
