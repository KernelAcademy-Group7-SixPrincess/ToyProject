package org.spring.example.accommodation.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalTime;

@Getter
@Setter
@ToString
public class Acc {
    private Long accId;
    private Long userId;
    private Long regionId;
    private String typeCodeId;
    private int typeCodeCode;
    private String gradeCodeId;
    private int gradeCodeCode;
    private Long mainImageId;
    private String name;
    private String address;
    private double avgrate;
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
    private LocalTime createdAt;
    private LocalTime updatedAt;
}
