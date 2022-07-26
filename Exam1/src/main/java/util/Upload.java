package util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class Upload {
    public static String upload(HttpServletRequest req, MultipartFile my) {
        String path = req.getServletContext().getRealPath("/upload");
        File f = new File(path);
        if (!f.exists()) f.mkdirs();
        String oldName = my.getOriginalFilename();
        if (oldName == "") return "";
        String suffix = oldName.substring(oldName.lastIndexOf("."));
        String newName = UUID.randomUUID().toString() + suffix;
        path = path + File.separator + newName;
        //上传
        try {
            my.transferTo(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newName;

    }
}
