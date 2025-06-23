package org.spring.example.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

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
    private long accId;
    private String statusCodeId;
    private int statusCodeCode;

}
