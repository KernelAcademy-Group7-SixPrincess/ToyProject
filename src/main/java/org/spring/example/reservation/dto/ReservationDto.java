package org.spring.example.reservation.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationDto {
    private Long id;
    private Long userId;
    private Long roomId;
    private String statusCodeId;
    private int statusCodeCode;
    private String usageStatusCodeId;
    private int usageStatusCodeCode;
    private LocalDateTime date;
    private int period;
    private int peopleCnt;
    private int childCount;
    private int infantCount;
    private String note;
    private String cancelReason;
    private LocalDateTime cancelAt;
    private LocalDateTime checkIn;
    private LocalDateTime checkOut;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // 추가 필드 (reservation 테이블에는 없지만 조인 결과로 포함)
    private String roomName;
    private Integer roomCapacity;
    private Integer roomMaxCapacity;
    private Integer roomPrice;
    private String roomMainImageUrl;
    private String accCheckInTime;   // 숙소 체크인 시간 (String or Time)
    private String accCheckOutTime;
    private String accName; // 숙소 이름// 숙소 체크아웃 시간
}
