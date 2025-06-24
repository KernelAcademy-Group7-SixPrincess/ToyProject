package org.spring.example.accAmenity.service;

import org.spring.example.accAmenity.domain.AccAmenity;
import org.spring.example.accAmenity.mapper.AccAmenityMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccAmenityService {

    private final AccAmenityMapper accAmenityMapper;

    public AccAmenityService(AccAmenityMapper accAmenityMapper) {
        this.accAmenityMapper = accAmenityMapper;
    }

    public List<AccAmenity> findByAccId(Long accId) {
        return accAmenityMapper.findByAccId(accId);
    }

    public List<AccAmenity> findByAmenityId(Long amenityId) {
        return accAmenityMapper.findByAmenityId(amenityId);
    }

    public void insert(AccAmenity accAmenity) {
        accAmenityMapper.insert(accAmenity);
    }

    public void delete(AccAmenity accAmenity) {
        accAmenityMapper.delete(accAmenity);
    }

    public void deleteByAccId(Long accId) {
        accAmenityMapper.deleteByAccId(accId);
    }
}