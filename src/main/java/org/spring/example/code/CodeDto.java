package org.spring.example.code;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CodeDto {
    private String codeTypeId;
    private Integer code;
    private String codeTypeName;
    private String codeName;
    private Boolean isUsed;
}
