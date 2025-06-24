package org.spring.example.roomAmenity.mapper;

import org.spring.example.roomAmenity.domain.RoomAmenity;
import java.util.List;

public interface RoomAmenityMapper {

    // 방에 연결된 편의시설 조회
    List<RoomAmenity> findByRoomId(Long roomId);

    // 편의시설에 연결된 방 목록 조회
    List<RoomAmenity> findByAmenityId(Long amenityId);

    // 방에 편의시설 추가
    void insert(RoomAmenity roomAmenity);

    // 방에서 편의시설 제거
    void delete(RoomAmenity roomAmenity);

    // 해당 방의 모든 amenity 제거
    void deleteByRoomId(Long roomId);
}