package org.spring.example.mapper;

import org.spring.example.search.dto.SearchDto;

public interface ReservationMapper {
    int canReserve(SearchDto searchDto);
}
