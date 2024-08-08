package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;

import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImp implements BuildingService {
    @Autowired
    private BuildingRepository buildingRespository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RentAreaRepository rentAreaRepository;
//    @Autowired
//    private RentAreaService rentAreaService;
    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building=buildingRespository.findById(buildingId).get();
        List<UserEntity> staffs=userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment=building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS=new ArrayList<>();
            ResponseDTO responseDTO=new ResponseDTO();
            for(UserEntity it:staffs)
            {
                StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
                staffResponseDTO.setFullName(it.getFullName());
                staffResponseDTO.setStaffId(it.getId());
                if(staffAssignment.contains(it))
                {
                    staffResponseDTO.setChecked("checked");
                }
                staffResponseDTOS.add(staffResponseDTO);
            }
         responseDTO.setData(staffResponseDTOS);
            responseDTO.setMessage("success");
            return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest) {
      List<BuildingEntity> buildingEntities= buildingRespository.findAll(buildingSearchRequest);
        List<BuildingSearchResponse> result=new ArrayList<>();
        for(BuildingEntity it:buildingEntities)
        {
            result.add(buildingConverter.toBuildingSearchResponse(it));
        }
        return result;
    }

    @Override
    public BuildingDTO AddOrUpdateBuilding(BuildingDTO buildingDTO) {
        Long buildingId = buildingDTO.getId();
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);
        if(buildingDTO.getId()!=null)
        {
            building.setUserEntities(buildingRespository.findById(buildingDTO.getId()).get().getUserEntities());
        }
        List<String> typeCode = buildingDTO.getTypeCode();
        String type = String.join(",", typeCode);

        building.setTypeCode(type);


        String rentArea = buildingDTO.getRentArea();
        List<RentAreaEntity> tmp = new ArrayList<>();
        if (rentArea != "") {
            String[] rentAreaValue = rentArea.trim().split(",");


            building.setItems(rentAreaConverter.toRentAreaEntityList(buildingDTO, building));
        }
            buildingRespository.save(building);
            return buildingDTO;


    }
    @Override
    public void deleteBuildings(List<Long> buildingIds) {
       buildingRespository.deleteByIdIn(buildingIds);
    }

    @Override
    public void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<UserEntity> users=userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
        BuildingEntity building=buildingRespository.findById(assignmentBuildingDTO.getBuildingId()).get();
        building.setUserEntities(users);
        buildingRespository.save(building);
    }

    @Override
    public BuildingDTO findById(Long buildingId) {
         BuildingEntity buildingEntity=buildingRespository.findById(buildingId).get();
         BuildingDTO building=modelMapper.map(buildingEntity, BuildingDTO.class);
         return building;
    }


}
