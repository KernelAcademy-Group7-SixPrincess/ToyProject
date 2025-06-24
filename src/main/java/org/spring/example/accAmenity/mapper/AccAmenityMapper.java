package org.spring.example.accAmenity.mapper;

import org.spring.example.accAmenity.domain.AccAmenity;
import java.util.List;

public interface AccAmenityMapper {

    List<AccAmenity> findByAccId(Long accId);

    List<AccAmenity> findByAmenityId(Long amenityId);

    void insert(AccAmenity accAmenity);

    void delete(AccAmenity accAmenity);

    void deleteByAccId(Long accId);
}