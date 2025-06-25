package org.spring.example.region;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class RegionServiceTest {

    @Autowired
    private RegionService regionService;

    /**
     * 사전 조건: region 테이블에 sido_code가 11, 26, 41, 27 이 각각 최소 하나씩 있어야 함
     */
    @Transactional
    @Rollback
    @Test
    public void getSidoTest() {
        // When
        List<RegionDto> sidoList = regionService.getSido();

        // Then
        assertThat(sidoList).isNotNull();
        // 4개 시도(11,26,41,27)
        assertThat(sidoList).hasSize(4);

        List<String> codes = sidoList.stream()
                .map(RegionDto::getSidoCode)
                .collect(Collectors.toList());
        assertThat(codes).containsExactlyInAnyOrder("11", "26", "41", "27");
    }

    /**
     * 사전 조건: region 테이블에 sido_code="11" 내 데이터가 있어야 함
     * (sigungu_code 1101 하나)
     */
    @Transactional
    @Rollback
    @Test
    public void getSigunguTest() {
        // Given
        RegionDto dto = new RegionDto();
        dto.setSidoCode("11");

        // When
        List<RegionDto> sigunguList = regionService.getSigungu(dto);

        // Then
        assertThat(sigunguList).isNotNull();
        // 11번 시도 내에 sigungu_code는 1101 하나
        assertThat(sigunguList).hasSize(1);

        RegionDto only = sigunguList.get(0);
        assertThat(only.getSidoCode()).isEqualTo("11");
        assertThat(only.getSigunguCode()).isEqualTo("1101");
        assertThat(only.getSigunguName()).isEqualTo("종로구");
    }

    /**
     * 사전 조건: region 테이블에 sido_code="11", sigungu_code="1101" 내 데이터가 있어야 함
     * (dong_code 110101, 110102)
     */
    @Transactional
    @Rollback
    @Test
    public void getDongTest() {
        // Given
        RegionDto dto = new RegionDto();
        dto.setSidoCode("11");
        dto.setSigunguCode("1101");

        // When
        List<RegionDto> dongList = regionService.getDong(dto);

        // Then
        assertThat(dongList).isNotNull();
        // 두 개 동(110101,110102)
        assertThat(dongList).hasSize(2);

        List<String> dongCodes = dongList.stream()
                .map(RegionDto::getDongCode)
                .collect(Collectors.toList());
        assertThat(dongCodes).containsExactlyInAnyOrder("110101", "110102");

        // 이름도 확인
        List<String> dongNames = dongList.stream()
                .map(RegionDto::getDongName)
                .collect(Collectors.toList());
        assertThat(dongNames).containsExactlyInAnyOrder("청운효자동", "삼청동");
    }
}
