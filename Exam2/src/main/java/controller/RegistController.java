package controller;



import org.springframework.stereotype.Controller;

@Controller
public class RegistController {
//    @Autowired
//    private UserDao userDao;

//    @RequestMapping("register.do")
//    public String register(User user,@RequestParam(value = "file") MultipartFile file,HttpServletRequest request){
////       找个路径存放用户上传的图片,可以是任意的路径
//        String path = request.getSession().getServletContext().getRealPath("upload");
////      MultipartFile file存放了要上传的文件信息
////      获取上传的文件名
//        String fileName = file.getOriginalFilename();
////      构建file对象,将上传路径和上传后的文件名封装成File对象
//        File targetFile = new File(path,fileName);
//        if (!targetFile.exists()){
//            targetFile.mkdirs();
//        }
//            try {
////            开始读取
//                file.transferTo(targetFile);
////            Thumbnails.of(targetFile).scale(0.7f).outputQuality(0.25d).toOutputStream(out);
////            对数据进行存储
////            model.addAttribute("fileUrl",request.getContextPath()+"/upload/"+fileName);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            user.setImg(request.getContextPath()+"/upload/"+fileName);
//            user.setCreate_time(new Date());
//            user.setUpdate_time(new Date());
//            userDao.insertUser(user);
//            return "redirect:login.jsp";
//        }
    }


