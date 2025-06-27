package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.code.CodeDto;
import org.spring.example.search.dto.SearchDto;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccMapper {
    // 전체 조회
    List<Acc> findAll();

    // ID로 조회
    Acc findById(Long accId);

    // 지역으로 조회
    List<Acc> findByRegion(String region);

    Acc findByIdWithRooms(Long accId);

    // 지역 및 타입으로 조회
    List<Acc> findByRegionAndType(Map<String, Object> params);

    // 타입으로 조회 (XML에 findByType 있음)
    List<Acc> findByType(SearchDto searchDto);

    // 평점 높은 숙소 상위 N개 조회
    List<Acc> findTopRated(int limit);

    // 키워드 검색
    List<Acc> searchByKeyword(String keyword);

    // 숙소 등록
    int insert(Acc acc);

    // 숙소 수정
    int update(Acc acc);

    // 숙소 삭제 (soft delete)
    int delete(Long accId);

    List<Acc> findAccBySearchDto(SearchDto searchDto);

}
