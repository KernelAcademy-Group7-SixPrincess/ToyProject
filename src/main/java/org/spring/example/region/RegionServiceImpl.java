package org.spring.example.region;

import lombok.RequiredArgsConstructor;
import org.spring.example.mapper.RegionMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RegionServiceImpl implements RegionService {
    private final RegionMapper regionMapper;

    @Override
    public List<RegionDto> getSido() {
        return regionMapper.getSido();
    }

    @Override
    public List<RegionDto> getSigungu(RegionDto regionDto) {
        return regionMapper.getSigungu(regionDto.getSidoCode());
    }

    @Override
    public List<RegionDto> getDong(RegionDto regionDto) {
        return regionMapper.getDong(regionDto.getSidoCode(),  regionDto.getSigunguCode());
    }
}
