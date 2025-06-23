package org.spring.example.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;

/**
 * 검색 시 필요한 조건들을 담은 Dto <br>
 * accId : 숙소의 ID <br>
 * statusCodeId : 객실의 상태 ID <br>
 * statusCodeCode : 객실의 상태 코드
 */
@Getter
@Builder
@AllArgsConstructor
public class SearchDto {
    // 숙소의 객실 리스트 조회시 필요한 파라미터
    private Long accId;
    private String statusCodeId;
    private Integer statusCodeCode;

    // 검색 시 필요한 파라미터
    private LocalDate checkIn;
    private LocalDate checkOut;
    private Integer personal;
}
