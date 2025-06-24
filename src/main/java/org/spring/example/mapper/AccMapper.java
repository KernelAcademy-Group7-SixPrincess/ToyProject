package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.accommodation.domain.Acc;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccMapper {
    List<Acc> findAll();
    Acc findById(Long accId);
    List<Acc> findByRegionAndType(Map<String, Object> params);
    List<Acc> findTopRated(int limit);
    List<Acc> searchByKeyword(String keyword);
}
