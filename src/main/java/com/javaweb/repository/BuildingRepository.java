package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface BuildingRepository  extends JpaRepository<BuildingEntity,Long>, BuildingRepositoryCustom {
    void deleteByIdIn(List<Long> ids);

}
