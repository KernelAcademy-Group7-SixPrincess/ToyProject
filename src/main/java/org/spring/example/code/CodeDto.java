package org.spring.example.code;

import lombok.Data;

@Data
public class CodeDto {
    private String codeTypeId;
    private Integer code;
    private String codeTypeName;
    private String codeName;
    private Boolean isUsed;
}
