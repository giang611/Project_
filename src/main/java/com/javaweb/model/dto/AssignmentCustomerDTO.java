package com.javaweb.model.dto;

import java.util.List;

public class AssignmentCustomerDTO {
    private Long CustomerId;
    private List<Long> staffs;

    public Long getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(Long customerId) {
        CustomerId = customerId;
    }

    public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<Long> staffs) {
        this.staffs = staffs;
    }
}
