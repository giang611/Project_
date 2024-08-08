package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public static void joinTable(BuildingSearchRequest buildingSearchRequest,StringBuilder sql)
    {
        Long staffid=buildingSearchRequest.getStaffId();
        if(staffid!=null)
        {
            sql.append(" inner join assignmentbuilding on b.id=assignmentbuilding.buildingid ");
        }

        Long rentAreaTo=buildingSearchRequest.getAreaTo();
        Long rentAreaFrom=buildingSearchRequest.getAreaFrom();
        if(rentAreaFrom!=null||rentAreaTo!=null)
        {
            sql.append(" inner join rentarea on rentarea.buildingid=b.id ");
        }
    }
    public static void queryNormal(BuildingSearchRequest BuildingSearchRequest,
                                   StringBuilder where)
    {

        try {
            Field[] fields=BuildingSearchRequest.class.getDeclaredFields();
            for(Field item:fields)
            {
                item.setAccessible(true);
                String fieldname=item.getName();
                if(!fieldname.equals("staffId")&&!fieldname.equals("typeCode")
                        &&!fieldname.startsWith("areaTo")&&!fieldname.startsWith("rentPriceFrom")&&!fieldname.startsWith("rentPriceTo")&&!fieldname.startsWith("areaFrom"))
                {
                    Object value=item.get(BuildingSearchRequest);
                    if(value!=null)
                    {
                        if(item.getType().getName().equals("java.lang.Long"))
                        {   if(value!="")
                            where.append(" AND b."+fieldname+" = "+ value);
                        }
                        else if(item.getType().getName().equals("java.lang.String"))
                        {   if(value!="")
                            where.append(" AND b."+fieldname+" like '%"+ value +"%' ");
                        }


                    }


                }
            }
        }

        catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest,StringBuilder where)
    {
        Long staffid=buildingSearchRequest.getStaffId();
        if(staffid!=null)
        {
            where.append(" AND assignmentbuilding.staffid = "+ staffid );
        }
        Long rentAreaTo=buildingSearchRequest.getAreaTo();
        Long rentAreaFrom=buildingSearchRequest.getAreaFrom();
        if(rentAreaFrom!=null||rentAreaTo!=null)
        {
            if(rentAreaFrom!=null)
            {
                where.append(" and rentarea.value >= "+ rentAreaFrom);
            }
            if(rentAreaTo!=null)
            {
                where.append(" and rentarea.value <= "+ rentAreaTo);
            }

        }
        Long rentPriceTo=buildingSearchRequest.getRentPriceTo();
        Long rentPriceFrom=buildingSearchRequest.getRentPriceFrom();
        if(rentPriceFrom!=null||rentPriceTo!=null)
        {
            if(rentPriceFrom!=null)
            {
                where.append(" and b.rentprice >= "+ rentPriceFrom);
            }
            if(rentPriceTo!=null)
            {
                where.append(" and b.rentprice <= "+ rentPriceTo);
            }
        }
        List<String> typeCode=buildingSearchRequest.getTypeCode();
        if(typeCode!=null&&typeCode.size()!=0)
        {
            where.append(" AND( ");
            String sql=typeCode.stream().map(it-> "b.type like '%"+it+"%' ").collect(Collectors.joining(" OR "));
            where.append(sql);
            where.append(" ) ");

        }
    }
    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY b.id;");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }



}

