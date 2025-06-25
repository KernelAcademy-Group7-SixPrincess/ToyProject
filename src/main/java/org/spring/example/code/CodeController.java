package org.spring.example.code;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
public class CodeController {
    private final CodeService codeService;

    @GetMapping("/code/{codeTypeId}")
    public List<CodeDto> findCodeByCodeTypeId(@PathVariable String codeTypeId) {
        log.info("codeTypeId = {}", codeTypeId);
        return codeService.findCodeByCodeTypeId(codeTypeId);
    }
}
