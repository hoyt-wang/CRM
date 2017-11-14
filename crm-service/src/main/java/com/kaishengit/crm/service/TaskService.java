package com.kaishengit.crm.service;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.entity.Task;
import sun.security.timestamp.TSRequest;

import java.util.List;

/**
 * Created by hoyt on 2017/11/14.
 */
public interface TaskService {

    /**
     * 根据id查找对应的待办事项
     * @param id
     * @return
     */
    Task findById(Integer id);

    /**
     * 获得待办事项列表
     * @param pageNo
     * @param account
     * @return
     */
    PageInfo<Task> pageForTask(Integer pageNo, Account account);

    /**
     * 根据客户id获得事项列表
     * @param id
     * @return
     */
    List<Task> findTaskByCustId(Integer id);

    /**
     * 根据saleId获得事项列表
     * @param id
     * @return
     */
    List<Task> findTaskBySaleId(Integer id);

    /**
     * 新增待办事项
     * @param task
     */
    void saveNewTask(Task task);


    /**
     * 根据id删除待办事项
     */
    void delTaskById(Integer id);
}
