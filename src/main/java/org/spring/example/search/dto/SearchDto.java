package org.spring.example.search.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * 검색 시 필요한 조건들을 담은 Dto <br>
 * accId : 숙소의 ID <br>
 * statusCodeId : 객실의 상태 ID <br>
 * statusCodeCode : 객실의 상태 코드
 */
@Getter
@Setter
@Builder
@AllArgsConstructor
@ToString
public class SearchDto {
    // 숙소의 객실 리스트 조회시 필요한 파라미터
    private Long accId;
    private String statusCodeId;
    private Integer statusCodeCode;

    // 예약 여부 확인에 필요한 파라미터
    private Long roomId;

    // 검색 시 필요한 파라미터
    private String keyword;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkIn;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkOut;
    private Integer guests;
    private String sidoCode;
    private String region;
    private String codeTypeId;
    private Integer code;
}
