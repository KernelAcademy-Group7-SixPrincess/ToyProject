package org.spring.example.common.code.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;


/**
 * Code 테이블의 DTO 입니다. <br>
 * <p>
 *     codeTypeId(String) : PK, 코드 유형 타입 ID <br>
 *     code(int): PK, 코드 값 <br>
 *     codeTypeName(String) : 코드 유형 타입 이름 <br>
 *     codeName(String) : 코드 이름 <br>
 * </p>
 * 불변 객체이며, {@link Builder} 패턴으로 생성합니다.
 * @author SeungminShin97
 * @since 2025.06.19
 */
@Getter
@Builder
@AllArgsConstructor
public class Code {
    private final String codeTypeId;
    private final int code;
    private final String codeTypeName;
    private final String codeName;
    private final char isUsed;
}
