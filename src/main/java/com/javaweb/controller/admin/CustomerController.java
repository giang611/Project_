package com.javaweb.controller.admin;

import com.javaweb.enums.District;
import com.javaweb.enums.TransactionType;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private IUserService userService;
    @Autowired
    private TransactionService transactionService;
    @RequestMapping(value="/admin/customer-list",method = RequestMethod.GET )
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request){

        ModelAndView mav=new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch",customerSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF"))
        {
            customerSearchRequest.setStaffId(SecurityUtils.getPrincipal().getId());
            mav.addObject("customerList",customerService.findAll(customerSearchRequest));
        }
        else
        {
            mav.addObject("customerList",customerService.findAll(customerSearchRequest));
        }
        mav.addObject("listStaffs",userService.getStaffs());
return mav;
    }
    @RequestMapping(value="/admin/customer-edit",method = RequestMethod.GET )
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO customerDTO, HttpServletRequest request){
        ModelAndView mav=new ModelAndView("admin/customer/edit");


        return mav;
    }
    @RequestMapping(value="/admin/customer-edit-{id}",method = RequestMethod.GET )
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav=new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO=new CustomerDTO();
        customerDTO=customerService.findById(id);
        mav.addObject("customerEdit",customerDTO);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("CSKHList",transactionService.findByCodeAndCustomerId("CSKH",id));
        mav.addObject("DDXList",transactionService.findByCodeAndCustomerId("DDX",id));
        return mav;
    }
}
