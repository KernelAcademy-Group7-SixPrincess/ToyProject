package org.spring.example.code;

import lombok.RequiredArgsConstructor;
import org.spring.example.mapper.CodeMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CodeServiceImpl implements CodeService {
    private final CodeMapper  codeMapper;

    @Override
    public List<CodeDto> findCodeByCodeTypeId(String codeTypeId) {
        return codeMapper.findCodeByCodeTypeId(codeTypeId);
    }
}
