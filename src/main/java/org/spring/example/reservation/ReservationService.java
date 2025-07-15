package org.spring.example.reservation;

import org.spring.example.reservation.dto.ReservationDto;
import java.util.List;

public interface ReservationService {
    void reserve(ReservationDto dto);
    List<ReservationDto> getReservationsByUser(Long userId);
    ReservationDto getReservation(Long id);
    public List<ReservationDto> getDetailedReservationsByUser(Long userId);
    List<ReservationDto> getLatestReservations(Long userId);

}
