package org.spring.example.accommodation.domain;

import lombok.*;
import org.spring.example.room.dto.Room;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

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
    private String typeCodeName;
    private String gradeCodeId;
    private int gradeCodeCode;
    private String gradeCodeName;
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
    private List<Room> roomList;

    private String addPeopleInfoFormatted;
    private String breakfastInfoFormatted;
    private String cookInfoFormatted;
    private String cancelRefundInfoFormatted;
    private String etcInfoFormatted;

    private String subwayInfoFormatted;
    private String roomFacilityInfoFormatted;
    private String frontFacilityInfoFormatted;
    private String parkingInfoFormatted;
    private String extraNoticeFormatted;
}
