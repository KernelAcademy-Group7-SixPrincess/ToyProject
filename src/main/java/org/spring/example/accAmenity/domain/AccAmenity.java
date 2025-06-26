package org.spring.example.accAmenity.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccAmenity {
    private Long accId;
    private Long amenityId;
}