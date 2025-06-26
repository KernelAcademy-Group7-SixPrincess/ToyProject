package org.spring.example.mapper;

import org.spring.example.amenityCategory.domain.AmenityCategory;

import java.util.List;


public interface AmenityCategoryMapper {

    // 모든 편의시설 카테고리 조회
    List<AmenityCategory> findAll();

    // ID로 하나 조회
    AmenityCategory findById(Long id);

    // 새 Amenity 등록
    void insert(AmenityCategory category);

    // 수정
    void update(AmenityCategory category);

    // 삭제
    void delete(Long id);
}
