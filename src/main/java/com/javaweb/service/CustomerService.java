package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface CustomerService
{
    List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest);
    void addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    ResponseDTO listStaffs(Long customerId);
    CustomerDTO AddOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteCustomers(List<Long> customerIds);
    CustomerDTO findById(Long id);

}
