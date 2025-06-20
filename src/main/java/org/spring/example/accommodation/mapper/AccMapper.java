package org.spring.example.accommodation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.accommodation.domain.Acc;

import java.util.List;

@Mapper
public interface AccMapper {
    List<Acc> findAll();
}
