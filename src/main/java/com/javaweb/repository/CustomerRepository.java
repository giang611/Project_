package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomCustomerRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface CustomerRepository extends JpaRepository<CustomerEntity,Long>, CustomCustomerRepository {
    void deleteByIdIn(List<Long> ids);

}
