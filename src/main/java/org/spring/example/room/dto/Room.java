package org.spring.example.room.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@RequiredArgsConstructor
@Builder
@NoArgsConstructor(force = true)
public class Room {
    /**
     * 객실 ID(BIGINT) <br>
     * NOT NULL
     */
    private final long id;
    /**
     * 숙소 ID
     */
    private final long accId;
    /**
     * 객실 타입 코드유형 ID
     */
    private final String typeCodeId;
    /**
     * 객실 타입 코드
     */
    private final int typeCodeCode;
    /**
     * 객실 타입 이름
     */
    private final String typeCodeName;
    /**
     * 객실 상태 코드유형 ID
     */
    private final String statusCodeId;
    /**
     * 객실 상태 코드
     */
    private final int statusCodeCode;
    /**
     * 객실 상태 이름
     */
    private final String statusCodeName;
    /**
     * 객실 대표 이미지 ID
     */
    private final long mainImageId;
    /**
     * 객실 이름
     */
    private final String name;
    /**
     * 객실 정보
     */
    private final String info;
    /**
     * 객실 추가 정보
     */
    private final String addInfo;
    /**
     * 객실 크기
     */
    private final int size;
    /**
     * 객실 방 수
     */
    private final int roomCnt;
    /**
     * 객실 층 수
     */
    private final int floor;
    /**
     * 객실 기준 인원
     */
    private final int capacity;
    /**
     * 객실 최대 인원
     */
    private final int maxCapacity;
    private final LocalDateTime createdAt;
    private final LocalDateTime updatedAt;
}
