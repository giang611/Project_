package com.javaweb.api.admin;

import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.BuildingService;
import jdk.nashorn.internal.ir.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {


@Autowired
  private BuildingService buildingService;
    @PostMapping
   public ResponseEntity<BuildingDTO> AddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO)
    {
         if(buildingDTO.getTypeCode().size()!=0) {
             return ResponseEntity.ok(buildingService.AddOrUpdateBuilding(buildingDTO));
         }
         return null;

    }
    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids )
    {
    buildingService.deleteBuildings(ids);
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable Long id)
    {
         ResponseDTO result = buildingService.listStaffs(id);
         return result;
    }
    @PostMapping("/assignment")
    public void updateAssignment(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO)
    {
          buildingService.addAssignmentBuilding(assignmentBuildingDTO);
    }



}
