package com.kaishengit.crm.controller;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.exception.AuthenticationException;
import com.kaishengit.crm.service.AccountService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 登录页
     * @return
     */
    @GetMapping("/")
    public String login() {
        return "index";
    }

    /**
     * 登录验证
     * @param mobile
     * @param password
     * @param redirectAttributes
     * @param session
     * @return
     */
    @PostMapping("/")
    public String login(String mobile, String password,
                        @RequestParam(value = "callback",required = false) String callback,
                        RedirectAttributes redirectAttributes,
                        HttpSession session) {
        try {
            Account account =accountService.login(mobile,password);
            session.setAttribute("curr_account",account);
            //TODO callback有问题，需修改
            if(StringUtils.isNotEmpty(callback)) {
                return "redirect:callback";
            } else {
                return "home";
            }
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

    /**
     * 更改密码
     * @param session
     * @return
     */
    @GetMapping("/changePassword")
    public String changePassword(HttpSession session,Model model) {
        Account account = (Account) session.getAttribute("curr_account");
        model.addAttribute("account",account);
        return "changePassword";
    }

    @PostMapping("/changePassword")
    public String changePassword(HttpSession session, String newPassword, String confirmPassword,
                                 String password,RedirectAttributes redirectAttributes,Model model) {
        Account account = (Account) session.getAttribute("curr_account");
        try {
            accountService.changePassword(account,password,newPassword,confirmPassword);
            redirectAttributes.addFlashAttribute("message","修改密码成功");
            return "/home";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message",e.getMessage());
            return "changePassword";
        }

    }


}
