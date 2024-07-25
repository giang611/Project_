package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaService  {
    void addRentArea(BuildingDTO buildingDTO);
    void deleteBuildings(List<Long> ids);
}
