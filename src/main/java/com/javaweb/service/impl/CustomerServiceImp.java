package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;
@Service
public class CustomerServiceImp implements CustomerService {
      @Autowired
      private CustomerRepository customerRepository;
      @Autowired
      private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest) {
       List<CustomerEntity> list = customerRepository.findAll(customerSearchRequest);
       return list;
    }

    @Override
    public void addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
       CustomerEntity customerEntity = new CustomerEntity();
       customerEntity=customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
       List<UserEntity> staffs=userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
       customerEntity.setUserEntities(staffs);
       customerRepository.save(customerEntity);
    }
    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer=customerRepository.findById(customerId).get();
        List<UserEntity> staffs=userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment=customer.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS=new ArrayList<>();
        ResponseDTO responseDTO=new ResponseDTO();
        for(UserEntity it:staffs)
        {
            StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it))
            {
                staffResponseDTO.setChecked("checked");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public CustomerDTO AddOrUpdateCustomer(CustomerDTO customerDTO) {

        CustomerEntity customer = modelMapper.map(customerDTO, CustomerEntity.class);
        if(SecurityUtils.getPrincipal()!=null)
        {
            String createdBy = SecurityUtils.getPrincipal().getFullName();
            customer.setCreatedBy(createdBy);
        }




        customerRepository.save(customer);
        return customerDTO;

    }

    @Override
    public void deleteCustomers(List<Long> customerIds) {
        customerRepository.deleteByIdIn(customerIds);


    }

    @Override
    public CustomerDTO findById(Long id) {
        CustomerEntity customer=customerRepository.findById(id).get();
        CustomerDTO CustomerDTO=modelMapper.map(customer, CustomerDTO.class);
        return CustomerDTO;
    }
}
