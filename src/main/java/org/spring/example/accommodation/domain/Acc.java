package org.spring.example.accommodation.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.time.LocalTime;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Acc {
    private Long accId;
    private Long userId;
    private Long regionId;
    private String typeCodeId;
    private int typeCodeCode;
    private String gradeCodeId;
    private int gradeCodeCode;
    private String mainImageUrl;
    private String name;
    private String address;
    private String accIntro;
    private double avgrate;
    private int reviewerCnt;
    private LocalTime checkInTime;
    private LocalTime checkOutTime;
    private String businessName;
    private String hostName;
    private String tel;
    private String email;
    private String licenseNum;
    private String info;
    private String addPeopleInfo;
    private String breakfastInfo;
    private String cookInfo;
    private String cancelRefundInfo;
    private String etcInfo;
    private String description;
    private String subwayInfo;
    private String roomFacilityInfo;
    private String frontFacilityInfo;
    private String extraNotice;
    private String parkingInfo;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String sidoName;
}
