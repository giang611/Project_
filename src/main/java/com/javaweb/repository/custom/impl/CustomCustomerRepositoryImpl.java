package com.javaweb.repository.custom.impl;


import com.javaweb.entity.CustomerEntity;

import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomCustomerRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
@Repository
public class CustomCustomerRepositoryImpl implements CustomCustomerRepository {
    @PersistenceContext
    private EntityManager entityManager;
    public static void joinTable(CustomerSearchRequest customerSearchRequest, StringBuilder sql)
    {
        Long staffid=customerSearchRequest.getStaffId();
        if(staffid!=null)
        {
            sql.append(" inner join assignmentcustomer on b.id=assignmentcustomer.customerid ");
        }


    }
    public static void queryNormal(CustomerSearchRequest customerSearchRequest,
                                   StringBuilder where)
    {

        try {
            Field[] fields=CustomerSearchRequest.class.getDeclaredFields();
            for(Field item:fields)
            {
                item.setAccessible(true);
                String fieldname=item.getName();

                    Object value=item.get(customerSearchRequest);
                    if(value!=null)
                    {
                        if(item.getType().getName().equals("java.lang.Long"))
                        {   if(value!="")
                            where.append(" AND "+fieldname+" = "+ value);
                        }
                        else if(item.getType().getName().equals("java.lang.String"))
                        {   if(value!="")
                        {
                            if(fieldname.equals("phone")) {
                                where.append(" AND b."+fieldname+" = "+ value);
                            }
                            else {
                                where.append(" AND b." + fieldname + " like '%" + value + "%' ");
                            }
                        }
                        }


                    }


                }

        }

        catch (Exception e) {
            e.printStackTrace();
        }

    }


    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM customer b ");
        joinTable(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(customerSearchRequest, where);

        where.append(" GROUP BY b.id;");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }
}
