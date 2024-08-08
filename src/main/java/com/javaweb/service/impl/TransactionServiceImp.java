package com.javaweb.service.impl;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Date;
import java.util.List;
@Service
public class TransactionServiceImp implements TransactionService {
@Autowired
private TransactionRepository transactionRepository;
@Autowired
private CustomerRepository customerRepository;
    @Override
    public List<TransactionEntity> findByCodeAndCustomerId(String code, Long customerId) {
       List<TransactionEntity> transactionEntities=transactionRepository.findByCodeAndCustomer_Id(code,customerId);
       return transactionEntities;
    }


    @Override
    public void updateOrAdd(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity=new TransactionEntity();



        if(transactionDTO.getCustomerId()!=null){
            transactionEntity=transactionRepository.findById(transactionDTO.getId()).get();

        }
        else
        {
            transactionEntity.setCustomer(customerRepository.findById(transactionDTO.getCustomerId()).get());

            transactionEntity.setCode(transactionDTO.getCode());
        }
        transactionEntity.setNote(transactionDTO.getNote());

        transactionRepository.save(transactionEntity);





    }
}
