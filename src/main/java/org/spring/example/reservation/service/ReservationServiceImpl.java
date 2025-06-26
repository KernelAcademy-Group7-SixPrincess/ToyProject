package org.spring.example.reservation.service;

import lombok.RequiredArgsConstructor;
import org.spring.example.search.dto.SearchDto;
import org.spring.example.mapper.ReservationMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements  ReservationService {
    private final ReservationMapper reservationMapper;

    @Override
    public Boolean canReserve(SearchDto searchDto) {
        int reserveCnt = reservationMapper.canReserve(searchDto);
        return reserveCnt <= 0;
    }
}
