package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.code.CodeDto;

import java.util.List;

@Mapper
public interface CodeMapper {
    List<CodeDto> findCodeByCodeTypeId(String codeTypeId);
}
