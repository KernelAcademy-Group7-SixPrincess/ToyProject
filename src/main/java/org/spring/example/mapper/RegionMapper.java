package org.spring.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.spring.example.region.RegionDto;

import java.util.List;

public interface RegionMapper {
    List<RegionDto> getSido();
    List<RegionDto> getSigungu(String sidoCode);
    List<RegionDto> getDong(@Param("sidoCode")String sidoCode,
                            @Param("sigunguCode")String sigunguCode);
}
