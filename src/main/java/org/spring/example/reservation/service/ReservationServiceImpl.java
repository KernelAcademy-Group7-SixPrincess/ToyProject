package org.spring.example.reservation.service;

import lombok.RequiredArgsConstructor;
import org.spring.example.common.dto.SearchDto;
import org.spring.example.mapper.ReservationMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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
