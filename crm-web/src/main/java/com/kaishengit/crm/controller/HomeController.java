package com.kaishengit.crm.controller;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.exception.AuthenticationException;
import com.kaishengit.crm.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 *
 * Created by hoyt on 2017/11/7.
 */

@Controller
public class HomeController {

    @Autowired
   private AccountService accountService;

    @GetMapping("/")
    public String login() {
        return "index";
    }

    @PostMapping("/")
    public String login(String mobile, String password,
                        RedirectAttributes redirectAttributes,
                        HttpSession session) {
        try {
            Account account =accountService.login(mobile,password);
            session.setAttribute("curr_account",account);
            return "redirect:home";
        } catch (AuthenticationException e) {
            redirectAttributes.addFlashAttribute("message",e.getMessage());
            return "/";
        }
    }

    /**
     * 登录后的页面
     * @return
     */
    @GetMapping("/home")
    public String home() {
        return "home";
    }

    /**
     * 安全退出
     * @param session
     * @param redirectAttributes
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("message","您已退出该管理系统");
        return "redirect:/";

    }



}
