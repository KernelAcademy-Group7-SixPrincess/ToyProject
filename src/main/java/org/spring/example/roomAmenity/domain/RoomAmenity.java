package org.spring.example.roomAmenity.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomAmenity {
    private Long roomId;
    private Long amenityId;
}