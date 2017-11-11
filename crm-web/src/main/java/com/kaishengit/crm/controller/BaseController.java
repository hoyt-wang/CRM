package com.kaishengit.crm.controller;

import com.kaishengit.crm.entity.Account;

import javax.servlet.http.HttpSession;

/**
 * 所有控制器的父类，提供共有的方法
 * Created by hoyt on 2017/11/10.
 */

public abstract class BaseController {

    /**
     * 获取当前登录系统的account对象
     * @param session
     * @return
     */
    public Account getCurrAccount(HttpSession session) {
        return (Account) session.getAttribute("curr_account");
    }
}
