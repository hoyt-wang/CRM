package com.kaishengit.crm.controller;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.controller.exception.ForbideenException;
import com.kaishengit.crm.controller.exception.NotFoundException;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.entity.Task;
import com.kaishengit.crm.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by hoyt on 2017/11/14.
 */

@Controller
@RequestMapping("/task")
public class TaskController extends BaseController{

    @Autowired
    private TaskService taskService;

    /**
     * 待办事项列表
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(name = "p",required = false, defaultValue = "1") Integer pageNo,
                       HttpSession session, Model model) {
        Account account = getCurrAccount(session);
        PageInfo<Task> pageInfo = taskService.pageForTask(pageNo,account);
        model.addAttribute("pageInfo",pageInfo);
        return "task/list";
    }

    /**
     * 新增待办事项
     * @return
     */
    @RequestMapping("/new")
    public String saveNewTask() {
        return "task/new";
    }

    @PostMapping("/new")
    public String saveNewTask(Task task, RedirectAttributes redirectAttributes) {
        taskService.saveNewTask(task);
        redirectAttributes.addFlashAttribute("message","新增成功");
        return "redirect:/task/list";
    }

    /**
     * 根据id删除待办事项
     * @param id
     * @param session
     * @return
     */
    @GetMapping("/{id:\\d+}/del")
    public String delTask(@PathVariable Integer id, HttpSession session) {
        Account account = getCurrAccount(session);
        Task task = taskService.findById(id);
        if(task == null) {
            throw new NotFoundException();
        }
        if(!task.getAccountId().equals(account.getId())) {
            throw new ForbideenException();
        }
        taskService.delTaskById(id);
        return "redirect:/task/list";
    }

    /**
     * 逾期事项列表
     * @return
     */
    @RequestMapping("/delay")
    public String delay() {
        return "task/delay";
    }
}
