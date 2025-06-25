package org.spring.example.region;

import java.util.List;

public interface RegionService {
    List<RegionDto> getSido();
    List<RegionDto> getSigungu(RegionDto regionDto);
    List<RegionDto> getDong(RegionDto regionDto);
}
