package org.spring.example.accommodation.service;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.mapper.AccMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class AccServiceImpl implements AccService {

    @Autowired
    private AccMapper accMapper;

    // 전체 숙소 조회
    @Override
    public List<Acc> getAllAccs() {
        return accMapper.findAll();
    }

    // acc_id로 숙소 조회
    @Override
    public Acc getAccById(Long accId) {
        return accMapper.findById(accId);
    }

    // acc_id로 숙소 + 객실 리스트 조회
    @Override
    public Acc getAccByIdWithRooms(Long accId) {
        return accMapper.findByIdWithRooms(accId);
    }

    // 지역 + 타입으로 숙소 조회
    @Override
    public List<Acc> getByRegionAndType(String region, Integer typeCode) {
        Map<String, Object> params = new HashMap<>();
        params.put("region", region);
        params.put("typeCode", typeCode);
        return accMapper.findByRegionAndType(params);
    }

    @Override
    public List<Acc> getByRegion(String region) {
        String sidoName = switch (region) {
            case "seoul"       -> "서울특별시";
            case "busan"       -> "부산광역시";
            case "daegu"       -> "대구광역시";
            case "incheon"     -> "인천광역시";
            case "gwangju"     -> "광주광역시";
            case "daejeon"     -> "대전광역시";
            case "ulsan"       -> "울산광역시";
            case "sejong"      -> "세종특별자치시";
            case "gyeonggi"    -> "경기도";
            case "chungbuk"    -> "충청북도";
            case "chungnam"    -> "충청남도";
            case "jeonnam"     -> "전라남도";
            case "gyeongbuk"   -> "경상북도";
            case "gyeongnam"   -> "경상남도";
            case "jeju"        -> "제주특별자치도";
            case "gangwon"     -> "강원특별자치도";
            case "jeonbuk"     -> "전북특별자치도";
            default            -> null;
        };
        if (sidoName == null) return List.of();

        return accMapper.findAll().stream().filter(acc -> sidoName.equals(acc.getSidoName()))
                .collect(Collectors.toList());
    }

    // 평점 상위 N개 숙소
    @Override
    public List<Acc> getTopRated(int limit) {
        return accMapper.findTopRated(limit);
    }

    // 키워드 검색
    @Override
    public List<Acc> searchByKeyword(String keyword) {
        return accMapper.searchByKeyword(keyword);
    }

    // 타입 코드별 숙소 조회
    @Override
    public List<Acc> getByType(int typeCode) {
        return accMapper.findByType(typeCode);
    }

    // 숙소 등록
    @Override
    public int addAcc(Acc acc) {
        return accMapper.insert(acc);
    }

    // 숙소 수정
    @Override
    public int updateAcc(Acc acc) {
        return accMapper.update(acc);
    }

    // 숙소 삭제 (soft delete)
    @Override
    public int deleteAcc(Long accId) {
        return accMapper.delete(accId);
    }
}
