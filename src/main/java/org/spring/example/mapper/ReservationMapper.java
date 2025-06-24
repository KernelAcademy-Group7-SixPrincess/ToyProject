package org.spring.example.mapper;

import org.spring.example.common.dto.SearchDto;

public interface ReservationMapper {
    int canReserve(SearchDto searchDto);
}
