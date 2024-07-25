package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse (BuildingEntity buildingEntity)
    {
        BuildingSearchResponse res = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getItems();
    //    String rentArea = rentAreaEntities.stream().map(it -> it.getValue()).collect (Collectors.joining ( ", "));
        //    res.setRentArea(rentArea);
        List<RentAreaEntity> rentAreas= buildingEntity.getItems();
        String areaResult=rentAreas.stream().map(it->it.getValue().toString()).collect(Collectors.joining(","));
        res.setRentArea(areaResult);
        Map<String, String> districts = District.type();
        String districtName = "";
        if(buildingEntity.getDistrict() != null && buildingEntity.getDistrict() != "")
        {
            districtName = districts.get(buildingEntity.getDistrict());

        }
        if(districtName != null && districtName != "")
        { String address=buildingEntity.getStreet() +","+buildingEntity.getWard() +
                ", "+ districtName;
            while (address.startsWith(",")) {
                address = address.substring(1);
            }

            res.setAddress(address);

        }

        return res;
    }
}
