package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.reservation.dto.ReservationDto;
import java.util.List;

@Mapper
public interface ReservationMapper {
    void insertReservation(ReservationDto reservation);
    ReservationDto findById(Long id);
    List<ReservationDto> findByUserId(Long userId);
    List<ReservationDto> findDetailedByUserId(Long userId);
    List<ReservationDto> findLatestByUserId(Long userId);
}


