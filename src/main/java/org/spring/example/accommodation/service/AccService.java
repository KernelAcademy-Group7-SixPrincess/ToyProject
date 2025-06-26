package org.spring.example.accommodation.service;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.code.CodeDto;

import java.util.List;

public interface AccService {
        // 전체 숙소 조회
        List<Acc> getAllAccs();

        // ID로 숙소 조회
        Acc getAccById(Long accId);

        // 지역(region)과 타입(typeCode)으로 숙소 조회
        List<Acc> getByRegionAndType(String region, Integer typeCode);

        // 평점 상위 N개 숙소 조회
        List<Acc> getTopRated(int limit);

        // 키워드로 숙소 검색
        List<Acc> searchByKeyword(String keyword);

        // 타입으로 숙소 조회 (AccMapper에 findByType 있음)
        List<Acc> getByType(CodeDto codeDto);

        // 숙소 등록
        int addAcc(Acc acc);

        // 숙소 수정
        int updateAcc(Acc acc);

        // 숙소 삭제 (soft delete)
        int deleteAcc(Long accId);
}
