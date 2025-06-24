package org.spring.example.amenity.service;

import org.spring.example.amenity.domain.Amenity;
import org.spring.example.amenity.mapper.AmenityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AmenityService {

    @Autowired
    private AmenityMapper amenityMapper;

    public List<Amenity> findAll() {
        return amenityMapper.findAll();
    }

    public Amenity findById(Long id) {
        return amenityMapper.findById(id);
    }

    public void insert(Amenity amenity) {
        amenityMapper.insert(amenity);
    }

    public void update(Amenity amenity) {
        amenityMapper.update(amenity);
    }

    public void delete(Long id) {
        amenityMapper.delete(id);
    }
}