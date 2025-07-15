package org.spring.example.reservation;

import org.spring.example.reservation.ReservationService;
import org.spring.example.reservation.dto.ReservationDto;
import org.spring.example.mapper.ReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public void reserve(ReservationDto dto) {
        reservationMapper.insertReservation(dto);
    }

    @Override
    public List<ReservationDto> getReservationsByUser(Long userId) {
        return reservationMapper.findByUserId(userId);
    }

    // ReservationServiceImpl.java
    @Override
    public List<ReservationDto> getLatestReservations(Long userId) {
        return reservationMapper.findLatestByUserId(userId);
    }


    @Override
    public ReservationDto getReservation(Long id) {
        return reservationMapper.findById(id);
    }

    @Override
    public List<ReservationDto> getDetailedReservationsByUser(Long userId) {
        return reservationMapper.findDetailedByUserId(userId);
    }
}
