package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public interface RentAreaRepository extends JpaRepository<RentAreaEntity,Long> {

    void deleteByBuildingFloorArea(Long floorArea);

   void deleteByBuildingId(Long buildingId);


}
