package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="customer")
public class CustomerEntity extends BaseEntity {
    @Column(name = "fullname")
    private String fullname;
    @Column(name = "phone")
    private String phone;
    @Column(name = "email")
    private String email;
    @Column(name = "companyname")
    private String companyname;
    @Column(name = "demand")
    private String demand;
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "customer",fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST, CascadeType.MERGE},orphanRemoval = true)
  List<TransactionEntity> transactions = new ArrayList<>();
    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentcustomer",
            joinColumns= @JoinColumn(name = "customerid",nullable = false),
            inverseJoinColumns= @JoinColumn (name = "staffid",nullable = false))
    private List<UserEntity> userEntities = new ArrayList<>();

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<TransactionEntity> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<TransactionEntity> transactions) {
        this.transactions = transactions;
    }

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }
}
