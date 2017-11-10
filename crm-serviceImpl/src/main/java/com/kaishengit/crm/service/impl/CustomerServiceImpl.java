package com.kaishengit.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Customer;
import com.kaishengit.crm.example.CustomerExample;
import com.kaishengit.crm.exception.ServiceException;
import com.kaishengit.crm.mapper.CustomerMapper;
import com.kaishengit.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.HttpCookie;
import java.util.List;
import java.util.Map;

/**
 * Created by hoyt on 2017/11/9.
 */

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    /**
     * @param id
     * @return customer
     */
    @Override
    public Customer findById(Integer id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    /**
     * @return customer集合
     */
    @Override
    public PageInfo<Customer> findByAccountId(Integer pageNo) {
        PageHelper.startPage(pageNo,5);
        List<Customer> list = customerMapper.selectByExample(new CustomerExample());
        return new PageInfo<>(list);
    }

    /**
     * 新增客户
     * @param customer
     */
    @Override
    public void saveNewCustomer(Customer customer) {
        CustomerExample customerExample = new CustomerExample();
        customerExample.createCriteria().andMobileEqualTo(customer.getMobile());
        List<Customer> list  = customerMapper.selectByExample(customerExample);

        if(list != null && !list.isEmpty()) {
            throw  new ServiceException("该客户已存在");
        }
        customerMapper.insertSelective(customer);
    }

    /**
     * 删除客户
     *
     * @param id
     */
    @Override
    public void delCustomerById(Integer id) {
        customerMapper.deleteByPrimaryKey(id);
    }

    /**
     * 编辑客户
     *
     * @param customer
     */
    @Override
    public void editCustomer(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }
}
