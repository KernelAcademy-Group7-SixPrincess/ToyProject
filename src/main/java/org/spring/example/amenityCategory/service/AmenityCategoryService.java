package org.spring.example.amenityCategory.service;

import org.spring.example.amenityCategory.domain.AmenityCategory;
import org.spring.example.amenityCategory.mapper.AmenityCategoryMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AmenityCategoryService {

    private final AmenityCategoryMapper amenityCategoryMapper;

    public AmenityCategoryService(AmenityCategoryMapper amenityCategoryMapper) {
        this.amenityCategoryMapper = amenityCategoryMapper;
    }

    public List<AmenityCategory> findAll() {
        return amenityCategoryMapper.findAll();
    }

    public AmenityCategory findById(Long id) {
        return amenityCategoryMapper.findById(id);
    }

    public void insert(AmenityCategory category) {
        amenityCategoryMapper.insert(category);
    }

    public void update(AmenityCategory category) {
        amenityCategoryMapper.update(category);
    }

    public void delete(Long id) {
        amenityCategoryMapper.delete(id);
    }
}