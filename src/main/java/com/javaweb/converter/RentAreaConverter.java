package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    @Autowired
    private ModelMapper modelMapper;
    public RentAreaEntity toRentAreaEntity( String val,BuildingEntity buildingEntity) {

        RentAreaEntity res = new RentAreaEntity();
        res.setValue(val);
        res.setBuilding1(buildingEntity);

        return res;
    }

    public List<RentAreaEntity> toRentAreaEntityList (BuildingDTO buildingDTO, BuildingEntity buildingEntity)
    {
        String[] rentAreas = buildingDTO.getRentArea().split( ",");
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        for (String val: rentAreas) rentAreaEntityList.add(toRentAreaEntity(val, buildingEntity));
        return rentAreaEntityList;
    }
    public RentAreaEntity toRentAreaEntity1(BuildingDTO buildingDTO, String val,String type,BuildingEntity buildingEntity) {

       BuildingEntity building=modelMapper.map(buildingDTO, BuildingEntity.class);
//        BuildingEntity  building=new BuildingEntity();
//        building.setId(buildingDTO.getId());
        building.setTypeCode(type);
        RentAreaEntity res = new RentAreaEntity();
        res.setValue(val);
        res.setBuilding1(building);

        return res;
    }
}