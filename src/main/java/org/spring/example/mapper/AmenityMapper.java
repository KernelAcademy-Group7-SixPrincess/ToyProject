package org.spring.example.mapper;
import org.spring.example.amenity.domain.Amenity;
import java.util.List;

public interface AmenityMapper {

    // 모든 편의시설 조회
    List<Amenity> findAll();

    // ID로 하나 조회
    Amenity findById(Long id);

    // 새 Amenity 등록
    void insert(Amenity amenity);

    // 수정
    void update(Amenity amenity);

    // 삭제
    void delete(Long id);
}
