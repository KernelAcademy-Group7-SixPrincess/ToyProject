package org.spring.example.region;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/regions")
public class RegionController {
    private final RegionService regionService;

    @GetMapping("/sido")
    public List<RegionDto> getSido() {
        return regionService.getSido();
    }

    @GetMapping("/sigungu")
    public List<RegionDto> getSigungu(RegionDto regionDto) {
        return regionService.getSigungu(regionDto);
    }

    @GetMapping("/dong")
    public List<RegionDto> getDong(RegionDto regionDto) {
        return regionService.getDong(regionDto);
    }
}
