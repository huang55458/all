package controller;

import dao.UserDao;
import entity.PageInfo;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("userController")
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;
    private int id;


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
//配置时间
//@InitBinder
//public void initBinder(WebDataBinder dataBinder){
//    dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(
//            new SimpleDateFormat("yyyy-MM-dd"), true));
//}

//    /**
//     * 用户管理列表页
//     * @param model
//     * @return
//     */
//    @RequestMapping(value="/list.do",method=RequestMethod.GET)
//    public ModelAndView list(ModelAndView model){
//        model.setViewName("jsp/user_list");
//        return model;
//    }

    /*
    跳转后台管理界面，并判断当前登录用户是否有该权限
 */
    @ResponseBody
    @RequestMapping("/toAdmin.do")
    public Map<String,Object> toAdminPage(HttpSession session){
        Object currentRole = session.getAttribute("currentRole");
        Map<String,Object> map = new HashMap<>();
        String roleList = "";
        if (currentRole != null){
            roleList = currentRole.toString();
        }
        //教师或者是管理员角色都能进入后台界面
        if (roleList.contains("admin") || roleList.contains("teacher")){
            map.put("status","1");
        }else {
            map.put("status","0");
        }
        return map;
    }

    @RequestMapping("/checkName.do")
    @ResponseBody//返回给jsp字符串格式
    public String checkName(String login_name,HttpServletRequest request) {
        //根据用户名查询是否存在该用户名
        User user=userService.findByLoginName(login_name);
        //当对象不为空，说明用户名存在
        if(user!=null) {
            request.getSession().setAttribute("login","用户存在");
            return "false";
        }
        return "{\"msg\":\"true\"}";
    }

    @RequestMapping(value = "/checkLoginName.do", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String checkLoginName(String login_name) {
        if (userService.checkLoginName(login_name)) {
            return "该用户名已存在!";
        }
        return "用户名可以使用！";

    }

    @RequestMapping("/delUser.do")
    public String delete(HttpServletRequest request, @Param("id") int id) {
        int result = userService.deleteById(id);
        return "redirect:/user/userList.do";
    }

    /**
     * 进入新增页面
     */
    @RequestMapping("/add.do")
    public String edit() {

        return "/editUser.jsp";
    }

    /**
     * 保存用户信息
     */

    @RequestMapping("/toadd.do")
    public String register(User user,@RequestParam(value = "file") MultipartFile file,HttpServletRequest request){
        //        找个路径存放用户上传的图片,可以是任意的路径
//        String login = (String) request.getSession().getAttribute("login_name");
//        if (login.equals("用户存在")){
//            request.getSession().setAttribute("error","添加失败");
//           return "redirect:/user/userList.do";
//        }
        String path = request.getSession().getServletContext().getRealPath("upload");
//        MultipartFile file存放了要上传的文件信息
//        获取上传的文件名
        String fileName = file.getOriginalFilename();
//        构建file对象,将上传路径和上传后的文件名封装成File对象
        File targetFileSource = new File(path);
        File targetFile = new File(path,fileName);
        if (!targetFileSource.exists()){
            targetFileSource.mkdirs();
        }
        try {
//            开始读取
            file.transferTo(targetFile);
//            Thumbnails.of(targetFile).scale(0.7f).outputQuality(0.25d).toOutputStream(out);
//            对数据进行存储
//            model.addAttribute("fileUrl",request.getContextPath()+"/upload/"+fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        user.setImg(request.getContextPath()+"/upload/"+fileName);
        user.setCreate_time(new Date());
        user.setUpdate_time(new Date());
        userDao.add(user);
        return "redirect:/user/userList.do";
    }


    /*
    修改用户信息
     */
    @RequestMapping("/tomod.do")
    public String update(int id, User user, HttpSession session) {
        this.id = id;
        return "/modUser.jsp";
    }

    @RequestMapping("/mod.do")
    public String update(User user, Model model,
                         String login_name, String password, String tel,
                         String email,@RequestParam(value = "file") MultipartFile file,HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("upload");
//        MultipartFile file存放了要上传的文件信息
//        获取上传的文件名
        String fileName = file.getOriginalFilename();
//        构建file对象,将上传路径和上传后的文件名封装成File对象
        File targetFile = new File(path,fileName);
        File f = new File(path);
        if (!f.exists()){
            f.mkdirs();
        }
        try {
//            开始读取
            file.transferTo(targetFile);
//            Thumbnails.of(targetFile).scale(0.7f).outputQuality(0.25d).toOutputStream(out);
//            对数据进行存储
//            model.addAttribute("fileUrl",request.getContextPath()+"/upload/"+fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }

        User user1 = userService.findById(id);
        user = new User();
        user.setId(this.id);
        user.setImg(request.getContextPath()+"/upload/"+fileName);
        user.setLogin_name(login_name);
        user.setPassword(password);
        user.setTel(tel);
        user.setEmail(email);
        userDao.update(user);
//        model.addAttribute("user",user);

        return "redirect:/user/userList.do";
    }

    @RequestMapping("/ser.do")
    public String SearchUser(User user,HttpSession session) {
        List<User> userList = userService.findSearchUser(user);
        session.setAttribute("userList", userList);
        return "redirect:/user/userList.do";
    }

    /*
    分页
     */
    @RequestMapping("/userList.do")
//    @GetMapping("userList.do")
    public ModelAndView findUserAll(@RequestParam(defaultValue = "1") int currentPage, String user_name,
                                    @RequestParam(defaultValue = "0") int type, HttpSession session){

        if(type==1){//搜索功能
            session.setAttribute("searchName",user_name);//将username保存到session中
        }else{
            user_name = (String) session.getAttribute("searchName");
        }
        PageInfo<User> pageInfo = userService.findUserAll(currentPage,user_name);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("/userInfo.jsp");
        return mv;
    }

    //批量删除
    @RequestMapping("/isdeleteMany.do")
    @ResponseBody
    public String deleteMany(Integer[] ids) {
        // 获取客户端name属性相同的多个元素的值，可以通过字符串字节或去，每个值中间以逗号分隔，也可以以数组直接获取。
       try {
           userService.deleteMany(ids);
       }catch (Exception e){
           return "error";
       }
       return "ok";
        }


        @GetMapping("logout3.do")
        public String logout(HttpServletRequest request) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                user.setStatus(0);
                userService.update(user);
                session.invalidate();
            }
            return "redirect:/";
        }
    @GetMapping("logout2.do")
    public void logout2(int id) {
        User user = userService.findById(id);
        userService.update(user);
    }

//
//    @RequestMapping("/exportAllActivitys.do")
//    public void exportAllActivitys(HttpServletResponse response) throws Exception{
//        //调用service返回activityList
//        List<User> userList = userService.queryAllActivitys();
//        //用apache的poi创建excel文件,并把activityList写入excel文件中
//        //创建HSSFWorkbook对象，对应一个excel文件
//        HSSFWorkbook wb = new HSSFWorkbook();
//        //使用wb创建HSSFSheet对象，对应wb文件中的一页
//        HSSFSheet sheet = wb.createSheet("市场活动列表");//设置页名
//        //使用sheet创建HSSFRow对象，对应sheet中的一行
//        HSSFRow row = sheet.createRow(0);//索引为0就是第一行
//        //使用row创建HSSFCell对象，对应row中的列
//        HSSFCell cell = row.createCell(0);//索引为0就是第一列
//        //往列里设置值
//        cell.setCellValue("用户ID");
//        cell = row.createCell(1);
//        cell.setCellValue("头像");
//        cell = row.createCell(2);
//        cell.setCellValue("登录名");
//        cell = row.createCell(3);
//        cell.setCellValue("联系电话");
//        cell = row.createCell(4);
//        cell.setCellValue("邮箱");
//        cell = row.createCell(5);
//        cell.setCellValue("用户名");
//        cell = row.createCell(6);
//        cell.setCellValue("状态");
//        cell = row.createCell(7);
//        cell.setCellValue("创建时间");
//        cell = row.createCell(8);
//        cell.setCellValue("更新时间");
//        cell = row.createCell(9);
//        cell.setCellValue("用户类型");
//
//        //遍历ActivityList,创建Row
//        //先判断list有没有数据
//        if(userList!=null&&userList.size()>0){
//            User user=null;//activity拿到外面定义就不用每次循环都创建，效率更高
//            for(int i=0;i<userList.size();i++){
//                user = userList.get(i);
//                //每遍历出一个activity，生成一行
//                row=sheet.createRow(i+1);
//                cell = row.createCell(0);
//                cell.setCellValue(user.getId());
//                cell = row.createCell(1);
//                cell.setCellValue(user.getImg());
//                cell = row.createCell(2);
//                cell.setCellValue(user.getLogin_name());
//                cell = row.createCell(3);
//                cell.setCellValue(user.getTel());
//                cell = row.createCell(4);
//                cell.setCellValue(user.getEmail());
//                cell = row.createCell(5);
//                cell.setCellValue(user.getUser_name());
//                cell = row.createCell(6);
//                cell.setCellValue(user.getStatus());
//                cell = row.createCell(7);
//                cell.setCellValue(user.getCreate_time());
//                cell = row.createCell(8);
//                cell.setCellValue(user.getUpdate_time());
//                cell = row.createCell(9);
//                cell.setCellValue(user.getType());
//            }
//        }
//
//
//        //改进后！！！！！！！！！！！！！！！！！！！！！
//
//
//        OutputStream os = new FileOutputStream("E:\\serverDir\\activityList.xls");
//        wb.write(os);//wb.write(os)表示你要吧它生成到哪个文件。从内存写到磁盘。内存访问磁盘效率是很低的，要建立链接，占内存，占cpu，不亚于访问一次数据库
//        os.close();
//        wb.close();
//        //把生成的excel文件下载到客户端
//        //设置响应类型 application/octet-stream表示excel文件
//        response.setContentType("application/octet-stream;charset=UTF-8");
//        //设置响应头  Content-Disposition打开方式 attachment以附件的形式
//        response.addHeader("Content-Disposition","attachment;filename=AllactivityList.xls");
//        OutputStream out = response.getOutputStream();
//        InputStream is = new FileInputStream("E:\\serverDir\\activityList.xls");//从磁盘读到内存，要建立链接，占内存，占cpu，不亚于访问一次数据库
//        //缓存区，以一个字节数组为单位读更快
//        byte[] buff = new byte[256];
//        int len=0; //实际读取个数，等于-1时说明读完了
//        while((len=is.read(buff))!=-1){
//            out.write(buff,0,len);
//        }
//        is.close();
//        out.flush();//out由response生成的，tomcat会自己关闭，不能自己关闭，不flush可能会数据丢失，因为可能还在缓冲区里
//
//    }

}
