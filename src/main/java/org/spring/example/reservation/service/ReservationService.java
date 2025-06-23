package org.spring.example.reservation.service;

import org.spring.example.common.dto.SearchDto;
import org.springframework.stereotype.Service;

@Service
public interface ReservationService {
    Boolean canReserve(SearchDto searchDto);
}
