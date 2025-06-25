package org.spring.example.amenity.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Amenity {
    private Long id;
    private Long amenityCategoryId;
    private String name;
    private LocalDateTime createdAt;
}
