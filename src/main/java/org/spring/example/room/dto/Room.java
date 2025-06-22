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
    private Long id;
    /**
     * 숙소 ID
     */
    private long accId;
    /**
     * 객실 타입 코드유형 ID
     */
    private String typeCodeId;
    /**
     * 객실 타입 코드
     */
    private int typeCodeCode;
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
    private int statusCodeCode;
    /**
     * 객실 상태 이름
     */
    private String statusCodeName;
    /**
     * 객실 대표 이미지 ID
     */
    private long mainImageId;
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
    private int size;
    /**
     * 객실 방 수
     */
    private int roomCnt;
    /**
     * 객실 층 수
     */
    private int floor;
    /**
     * 객실 기준 인원
     */
    private int capacity;
    /**
     * 객실 최대 인원
     */
    private int maxCapacity;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
