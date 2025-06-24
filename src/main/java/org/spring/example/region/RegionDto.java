package org.spring.example.region;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegionDto {
    private Long regionId;
    private String sidoCode;
    private String sigunguCode;
    private String dongCode;
    private String sidoName;
    private String sigunguName;
    private String dongName;
}
