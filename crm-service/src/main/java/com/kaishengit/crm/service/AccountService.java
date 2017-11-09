package com.kaishengit.crm.service;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.entity.Dept;
import com.kaishengit.crm.exception.AuthenticationException;
import com.kaishengit.crm.exception.ServiceException;

import java.util.List;
import java.util.Map;

/**
 * Account业务层
 * Created by hoyt on 2017/11/7.
 */

public interface AccountService {

    /**
     * @param mobile
     * @param password
     * @return 登录成功返回Account对象，失败抛出AuthenticationException异常
     */
    Account login(String mobile,String password) throws AuthenticationException;

    /**
     * 查询所有部门
     * @return
     */
    List<Dept> findAllDept();

    /**
     * 添加新部门
     * @param deptName 部门名称
     * @throws ServiceException eg:名字已存在
     */
    void saveNewDept(String deptName) throws ServiceException;

    /**
     * @param param 查询参数
     * @return account分页对象
     */
    List<Account> pageForAccount(Map<String,Object> param);

    /**
     * 根据部门ID获得账号数量
     * @param deptId
     * @return
     */
    Long accountCountByDeptId(Integer deptId);

    /**
     * 根据id删除账号
     * @param id
     */
    void deleteEmployeeById(Integer id);

    /**
     * 添加新员工
     * @param userName
     * @param mobile
     * @param password
     * @param deptId
     */
    void saveNewEmployee(String userName, String mobile, String password, Integer[] deptId);
}
