package controller;

import dao.UserDao;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;
    @RequestMapping("register.do")
    public String register(User user, @RequestParam(value = "file") MultipartFile file, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("upload");
//        MultipartFile file存放了要上传的文件信息
//        获取上传的文件名
        String fileName = file.getOriginalFilename();
//        构建file对象,将上传路径和上传后的文件名封装成File对象
        File targetFile = new File(path,fileName);
        File targetFilePackage = new File(path);
        if (!targetFilePackage.exists()){
            targetFilePackage.mkdir();
        }
        try {
//            开始读取
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        user.setImg(request.getContextPath()+"/upload/"+fileName);
        user.setCreate_time(new Date());
        user.setUpdate_time(new Date());
        userDao.add(user);
        return "redirect:/";
    }

}
