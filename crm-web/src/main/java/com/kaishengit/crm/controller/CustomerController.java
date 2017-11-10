package com.kaishengit.crm.controller;

import com.github.pagehelper.PageInfo;
import com.kaishengit.crm.entity.Account;
import com.kaishengit.crm.entity.Customer;
import com.kaishengit.crm.example.CustomerExample;
import com.kaishengit.crm.exception.ServiceException;
import com.kaishengit.crm.service.CustomerService;
import com.kaishengit.web.result.AjaxResult;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by hoyt on 2017/11/9.
 */

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/my")
    public String my(@RequestParam(name = "p",required = false,defaultValue = "1") Integer pageNo,
                     HttpSession session, Model model) {
        Account account = (Account) session.getAttribute("curr_account");
        PageInfo<Customer> pageInfo = customerService.findByAccountId(pageNo);
        model.addAttribute("pageInfo",pageInfo);
        return "customer/my";
    }

    @GetMapping("/new")
    public String saveNewCustomer() {
        return "customer/new";
    }

    @PostMapping("/new")
    public String saveNewCustomer(Customer customer, RedirectAttributes redirectAttributes) {
        try {
            customerService.saveNewCustomer(customer);
            redirectAttributes.addFlashAttribute("message","新增员工成功");
            return "redirect:/customer/my";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message",e.getMessage());
            return "customer/new";
        }
    }

    @GetMapping("/{id:\\d+}")
    //@RequestMapping(value = "/{id\\d+}", method = RequestMethod.GET)
    public String showCustomer(@PathVariable Integer id, Model model) {
        Customer customer = customerService.findById(id);
        model.addAttribute("customer",customer);
        return "customer/show";
    }

    @GetMapping("/{id:\\d+}/edit")
    public String editProduct(@PathVariable Integer id,Model model) {
        model.addAttribute("customer",customerService.findById(id));
        return "customer/edit";
    }

    @PostMapping("/{id:\\d+}/edit")
    public String editProduct(Customer customer,RedirectAttributes redirectAttributes) {
        customerService.editCustomer(customer);
        redirectAttributes.addFlashAttribute("message","修改成功");
        return "redirect:/customer/"+customer.getId();
    }

    @GetMapping("/{id:\\d+}/delete")
    public String delCustomer(@PathVariable Integer id, Model model) {
        customerService.delCustomerById(id);
        return "redirect:/customer/my";
    }

/*    *//**
     * 编辑客户信息
     * @return
     *//*
    @PostMapping("/{id:\\d+}/edit")
    @ResponseBody
    public AjaxResult editCustomer(Customer customer) {
        try {
            customerService.editCustomer(customer);
            return AjaxResult.success();
        } catch (ServiceException ex) {
            ex.printStackTrace();
            return AjaxResult.error(ex.getMessage());
        }
    }*/

}
