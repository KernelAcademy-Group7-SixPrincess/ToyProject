package org.spring.example.code;

import org.springframework.stereotype.Service;

import java.util.List;


public interface CodeService {
    List<CodeDto> findCodeByCodeTypeId(String codeTypeId);
}
