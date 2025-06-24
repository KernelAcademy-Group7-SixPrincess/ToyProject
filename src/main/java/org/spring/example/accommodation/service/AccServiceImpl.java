package org.spring.example.accommodation.service;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.mapper.AccMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccServiceImpl implements AccService {

    @Autowired
    private AccMapper accMapper;

    @Override
    public List<Acc> getAllAccs() {
        return accMapper.findAll();
    }

    @Override
    public Acc getAccById(Long accId) {
        return accMapper.findById(accId);
    }

    @Override
    public List<Acc> getByRegionAndType(String region, Integer typeCode) {
        Map<String, Object> params = new HashMap<>();
        params.put("region", region);
        params.put("typeCode", typeCode);
        return accMapper.findByRegionAndType(params);
    }

    @Override
    public List<Acc> getTopRated(int limit) {
        return accMapper.findTopRated(limit);
    }

    @Override
    public List<Acc> searchByKeyword(String keyword) {
        return accMapper.searchByKeyword(keyword);
    }
}
