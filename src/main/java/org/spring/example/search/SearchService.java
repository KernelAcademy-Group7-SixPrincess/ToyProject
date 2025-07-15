package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.code.CodeDto;
import org.spring.example.mapper.AccMapper;
import org.spring.example.search.dto.SearchDto;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class SearchService {
    private final AccMapper accMapper;

    public List<Acc> findAccBySearchDto(SearchDto searchDto) {
        String keyword     = searchDto.getKeyword();
        String codeTypeId  = searchDto.getCodeTypeId();
        Integer code       = searchDto.getCode();
        String sidoCode    = searchDto.getSidoCode();
        String region      = searchDto.getRegion();

        // 1. keyword만 있는 경우
        if (keyword != null
                && (codeTypeId == null || codeTypeId.isEmpty())
                && code == null
                && (sidoCode == null || sidoCode.isEmpty())) {
            return accMapper.searchByKeyword(keyword);
        }

        if(keyword == null
                && codeTypeId != null && !codeTypeId.isEmpty()
                && code != null
                && (sidoCode == null || sidoCode.isEmpty())) {
            return accMapper.findByType(searchDto);
        }

        // 2. keyword + codeTypeId + code 있는 경우
        if (keyword != null
                && codeTypeId != null && !codeTypeId.isEmpty()
                && code != null
                && (sidoCode == null || sidoCode.isEmpty())) {
            if(code == 0)
                return accMapper.searchByKeyword(keyword);
            return accMapper.findByType(searchDto);
        }

        // 3. keyword + codeTypeId + code + sidoCode 있는 경우
        if (keyword != null
                && codeTypeId != null && !codeTypeId.isEmpty()
                && code != null
                && sidoCode != null && !sidoCode.isEmpty()) {
            Map<String, Object> map = new HashMap<>();
            map.put("keyword", keyword);
            map.put("codeTypeId", codeTypeId);
            map.put("code", code);
            map.put("sidoCode", sidoCode);
            return accMapper.findByRegionAndType(map);
        }


        // 4. keyword + sidoCode 있는 경우
        if (keyword != null
                && (codeTypeId == null || codeTypeId.isEmpty())
                && code == null
                && sidoCode != null && !sidoCode.isEmpty()) {
            return accMapper.findByRegion(region);
        }
        return accMapper.findAll();
    }


}
