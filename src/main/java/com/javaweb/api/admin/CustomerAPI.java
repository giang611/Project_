package com.javaweb.api.admin;

import com.javaweb.model.dto.*;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
@Autowired
private CustomerService customerService;
@Autowired
private TransactionService transactionService;

    @PostMapping("/assignment")
    public void updateAssignment(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO)
    {
        customerService.addAssignmentCustomer(assignmentCustomerDTO);
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable Long id)
    {
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }
    @PostMapping
    public ResponseEntity<CustomerDTO> AddOrUpdateCustomer(@RequestBody CustomerDTO customerDTO)
    {

        return ResponseEntity.ok(customerService.AddOrUpdateCustomer(customerDTO));
    }
    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids )
    {
        customerService.deleteCustomers(ids);
    }
    @PostMapping("/transaction")
    public void updateOrAddTransaction(@RequestBody TransactionDTO transactionDTO )
    {
            transactionService.updateOrAdd(transactionDTO);
    }
}
