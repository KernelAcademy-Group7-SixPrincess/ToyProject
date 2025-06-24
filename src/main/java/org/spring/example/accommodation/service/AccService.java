package org.spring.example.accommodation.service;

import org.spring.example.accommodation.domain.Acc;

import java.util.List;

public interface AccService {
        List<Acc> getAllAccs();
        Acc getAccById(Long accId);
        List<Acc> getByRegionAndType(String region, Integer typeCode);
        List<Acc> getTopRated(int limit);
        List<Acc> searchByKeyword(String keyword);
}
