package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author chumeng
 * @date 2022/7/25 10:46
 */
@Controller
public class navigationController {
    @GetMapping("welcome.form")
    public String welcome() {
        return "welcome.jsp";
    }
    @GetMapping("userinfo.form")
    public String userinfo() {
        return "userInfo.jsp";
    }
    @GetMapping("frontPage.form")
    public String frontPage() {
        return "frontPage.jsp";
    }
    @GetMapping("frintPage.form")
    public String frintPage() {
        return "frintPage.jsp";
    }
    @GetMapping("index.form")
    public String index() {
        return "index.jsp";
    }
    @GetMapping("roleEdit.form")
    public String roleindex() {
        return "permission/roleEdit.jsp";
    }
}
