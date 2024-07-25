package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.BuildingRepository;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO AddOrUpdateBuilding(BuildingDTO buildingDTO);
    void deleteBuildings(List<Long> buildingIds);
    void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
     BuildingDTO findById(Long buildingId);
}
