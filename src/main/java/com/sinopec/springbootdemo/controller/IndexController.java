package com.sinopec.springbootdemo.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Map;

@Controller
public class IndexController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String root() {
//        System.out.println(username);
        return "login";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "error";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpServletRequest request) {
        System.out.println("尝试登录：username: " + username + ", password: " + password);
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 执行认证登陆
        try {
            subject.login(token);
            System.out.println("登录成功");
            return "redirect:/index";
        } catch (LockedAccountException lae) {
//            return "账户已锁定";
        } catch (ExcessiveAttemptsException eae) {
//            return "用户名或密码错误次数过多";
        } catch (AuthenticationException ae) {
            System.out.println("用户名或密码不正确");
//            return "用户名或密码不正确！";
        }
        token.clear();
        return "login";
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        Enumeration eum =session.getAttributeNames();
//        while(eum.hasMoreElements()) {
//            String key = (String) eum.nextElement();
//            session.removeAttribute(key);
//        }
        SecurityUtils.getSubject().logout();
        // TODO redis:redisServiceImpl.remove();
        return "redirect:/login";
    }

    @GetMapping("index")
    public String index(Map<String, Object> paramsMap) {
        paramsMap.put("userName", "admin");
        return "index";
    }
}
