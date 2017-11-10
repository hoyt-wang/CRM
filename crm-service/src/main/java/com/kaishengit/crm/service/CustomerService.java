package com.kaishengit.crm.service;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Customer;

import java.util.List;
import java.util.Map;

/**
 * Created by hoyt on 2017/11/9.
 */
public interface CustomerService {


    /**
     * @param id
     * @return customer
     */
    Customer findById(Integer id);

    /**
     * @return customer集合
     */
    PageInfo<Customer> findByAccountId(Integer pageNo);

    /**
     * 新增客户
     * @param customer
     */
    void saveNewCustomer(Customer customer);

    /**
     * 删除客户
     * @param id
     */
    void delCustomerById(Integer id);

    /**
     * 编辑客户
     * @param customer
     */
    void editCustomer(Customer customer);
}
