
package controller;


//import java.awt.Color;
//import java.awt.Font;
//import java.awt.Graphics;
//import java.awt.image.BufferedImage;
//import java.util.Random;
//
//import javax.imageio.ImageIO;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class ValidateCodeServlet extends HttpServlet {


//    public static final String RANDOMCODEKEY = "randomcode_key";//放到session中的key
//    private Random random = new Random();
//    private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生的字符串
//
//    private int width = 80;//图片宽
//    private int height = 26;//图片高
//    private int lineSize = 40;//干扰线数量
//    private int stringNum = 4;//随机产生字符数量
//
//    /**
//     * 生成随机图片
//     */
//    public void getRandcode(HttpServletRequest request,
//                            HttpServletResponse response) {
//        HttpSession session = request.getSession();
//        //BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
//        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
//        //产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
//        Graphics g = image.getGraphics();
//        g.fillRect(0, 0, width, height);
//        g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
//        g.setColor(getRandColor(160, 200));
//        //绘制干扰线
//        for(int i=0;i<=lineSize;i++){
//            drowLine(g);
//        }
//        //绘制随机字符
//        String randomString = "";
//        for(int i=1;i<=stringNum;i++){
//            randomString=drowString(g,randomString,i);
//        }
//        session.removeAttribute(RANDOMCODEKEY);
//        session.setAttribute(RANDOMCODEKEY, randomString);
//        g.dispose();
//        try {
//            //将内存中的图片通过流动形式输出到客户端
//            ImageIO.write(image, "JPEG", response.getOutputStream());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    /*
//     * 获得字体
//     */
//    private Font getFont(){
//        return new Font("Fixedsys",Font.CENTER_BASELINE,18);
//    }
//    /*
//     * 获得颜色
//     */
//    private Color getRandColor(int fc,int bc){
//        if(fc > 255)
//            fc = 255;
//        if(bc > 255)
//            bc = 255;
//        int r = fc + random.nextInt(bc-fc-16);
//        int g = fc + random.nextInt(bc-fc-14);
//        int b = fc + random.nextInt(bc-fc-18);
//        return new Color(r,g,b);
//    }
//
//    /*
//     * 绘制字符串
//     */
//    private String drowString(Graphics g,String randomString,int i){
//        g.setFont(getFont());
//        g.setColor(new Color(random.nextInt(101),random.nextInt(111),random.nextInt(121)));
//        String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
//        randomString +=rand;
//        g.translate(random.nextInt(3), random.nextInt(3));
//        g.drawString(rand, 13*i, 16);
//        return randomString;
//    }
//    /*
//     * 绘制干扰线
//     */
//    private void drowLine(Graphics g){
//        int x = random.nextInt(width);
//        int y = random.nextInt(height);
//        int xl = random.nextInt(13);
//        int yl = random.nextInt(15);
//        g.drawLine(x, y, x+xl, y+yl);
//    }
//    /*
//     * 获取随机的字符
//     */
//    public String getRandomString(int num){
//        return String.valueOf(randString.charAt(num));
//    }
//}

//import javax.imageio.ImageIO;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.util.Random;
//
///**
// * 验证码生成类
// * Created by zhm on 2017/9/30.
// */
//public class ValidateCodeServlet {
//    public static final String RANDOMCODEKEY= "RANDOMVALIDATECODEKEY";//放到session中的key
//    //private String randString = "0123456789";//随机产生只有数字的字符串 private String
//    private String randString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生只有字母的字符串
//    //private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生数字与字母组合的字符串
//    private int width = 95;// 图片宽
//    private int height = 25;// 图片高
//    private int lineSize = 40;// 干扰线数量
//    private int stringNum = 4;// 随机产生字符数量
//
//    private Random random = new Random();
//
//    /*
//     * 获得字体
//     */
//    private Font getFont() {
//        return new Font("Fixedsys", Font.CENTER_BASELINE, 18);
//    }
//
//    /*
//     * 获得颜色
//     */
//    private Color getRandColor(int fc, int bc) {
//        if (fc > 255)
//            fc = 255;
//        if (bc > 255)
//            bc = 255;
//        int r = fc + random.nextInt(bc - fc - 16);
//        int g = fc + random.nextInt(bc - fc - 14);
//        int b = fc + random.nextInt(bc - fc - 18);
//        return new Color(r, g, b);
//    }
//
//    /**
//     * 生成随机图片
//     */
//    public void getRandcode(HttpServletRequest request, HttpServletResponse response) {
//        HttpSession session = request.getSession();
//        // BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
//        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
//        Graphics g = image.getGraphics();// 产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
//        g.fillRect(0, 0, width, height);
//        g.setFont(new Font("Times New Roman", Font.ROMAN_BASELINE, 18));
//        g.setColor(getRandColor(110, 133));
//        // 绘制干扰线
//        for (int i = 0; i <= lineSize; i++) {
//            drowLine(g);
//        }
//        // 绘制随机字符
//        String randomString = "";
//        for (int i = 1; i <= stringNum; i++) {
//            randomString = drowString(g, randomString, i);
//        }
//        //将生成的随机字符串保存到session中，而jsp界面通过session.getAttribute("RANDOMCODEKEY")，
//        //获得生成的验证码，然后跟用户输入的进行比较
//        session.removeAttribute(RANDOMCODEKEY);
//        session.setAttribute(RANDOMCODEKEY, randomString);
//        g.dispose();
//        try {
//            // 将内存中的图片通过流动形式输出到客户端
//            ImageIO.write(image, "JPEG", response.getOutputStream());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    /*
//     * 绘制字符串
//     */
//    private String drowString(Graphics g, String randomString, int i) {
//        g.setFont(getFont());
//        g.setColor(new Color(random.nextInt(101), random.nextInt(111), random
//                .nextInt(121)));
//        String rand = String.valueOf(getRandomString(random.nextInt(randString
//                .length())));
//        randomString += rand;
//        g.translate(random.nextInt(3), random.nextInt(3));
//        g.drawString(rand, 13 * i, 16);
//        return randomString;
//    }
//
//    /*
//     * 绘制干扰线
//     */
//    private void drowLine(Graphics g) {
//        int x = random.nextInt(width);
//        int y = random.nextInt(height);
//        int xl = random.nextInt(13);
//        int yl = random.nextInt(15);
//        g.drawLine(x, y, x + xl, y + yl);
//    }
//
//    /*
//     * 获取随机的字符
//     */
//    public String getRandomString(int num) {
//        return String.valueOf(randString.charAt(num));
//    }
//}
//
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class ValidateCodeServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //创建空白图片
        BufferedImage image = new BufferedImage(100,30,BufferedImage.TYPE_INT_RGB);
        //获取图片画笔
        Random r = new Random();
        Graphics g = image.getGraphics();
        //设置画笔颜色
        g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
        //绘制矩形的背景
        g.fillRect(0,0,100,30);
        //调用自定义的方法，获取长度为5的字母数字组合的字符串
        String number = getNumber(5);
        System.out.println(number);
        //将生成的验证码放入session
        HttpSession session = req.getSession();
        session.setAttribute("code",number);
        //设置画笔大小
        g.setColor(new Color(0,0,0));
        g.setFont(new Font(null,Font.BOLD,24));
        //绘制字符串
        g.drawString(number,5,25);
        //绘制干扰线
        for(int i=0;i<8;i++) {
            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255)));
            g.drawLine(r.nextInt(100), r.nextInt(30), r.nextInt(100), r.nextInt(30));
        }
        //返回
        resp.setContentType("image/jpeg");
        OutputStream ops = resp.getOutputStream();
        ImageIO.write(image,"jpeg",ops);
        ops.close();


    }
    private String getNumber(int size){
        String str = "ABCDEFGHIJKLMNOPQRWTUVWXYZ0123456789";
        String number ="";
        Random r = new Random();
        for(int i=0;i<size;i++){
            number +=str.charAt(r.nextInt(str.length()));
        }
        return number;

    }
}
