package org.spring.example.room.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor(force = true)
@AllArgsConstructor
public class Room {
    /**
     * 객실 ID(BIGINT) <br>
     * NOT NULL
     */
    private Long roomId;
    /**
     * 숙소 ID
     */
    private Long accId;
    /**
     * 객실 타입 코드유형 ID
     */
    private String typeCodeId;
    /**
     * 객실 타입 코드
     */
    private Integer typeCodeCode;
    /**
     * 객실 타입 이름
     */
    private String typeCodeName;
    /**
     * 객실 상태 코드유형 ID
     */
    private String statusCodeId;
    /**
     * 객실 상태 코드
     */
    private Integer statusCodeCode;
    /**
     * 객실 상태 이름
     */
    private String statusCodeName;
    /**
     * 객실 대표 이미지 ID
     */
    private String mainImageId;
    /**
     * 객실 이름
     */
    private String name;
    /**
     * 객실 정보
     */
    private String info;
    /**
     * 객실 추가 정보
     */
    private String addInfo;
    /**
     * 객실 크기
     */
    private Integer size;
    /**
     * 객실 방 수
     */
    private Integer roomCnt;
    /**
     * 객실 층 수
     */
    private Integer floor;
    /**
     * 객실 기준 인원
     */
    private Integer capacity;
    /**
     * 객실 최대 인원
     */
    private Integer maxCapacity;
    /**
     * 객실 가격
     */
    private Integer price;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
