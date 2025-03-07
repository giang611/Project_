package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;

public class CustomerSearchRequest extends AbstractDTO {
    private String fullname;
    private String email;
    private String phone;
    private Long staffId;



    public String getEmail() {
        return email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }
}
