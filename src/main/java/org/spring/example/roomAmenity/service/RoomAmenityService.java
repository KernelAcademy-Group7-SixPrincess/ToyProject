package org.spring.example.roomAmenity.service;

import org.spring.example.roomAmenity.domain.RoomAmenity;
import org.spring.example.roomAmenity.mapper.RoomAmenityMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomAmenityService {

    private final RoomAmenityMapper roomAmenityMapper;

    public RoomAmenityService(RoomAmenityMapper roomAmenityMapper) {
        this.roomAmenityMapper = roomAmenityMapper;
    }

    public List<RoomAmenity> findByRoomId(Long roomId) {
        return roomAmenityMapper.findByRoomId(roomId);
    }

    public List<RoomAmenity> findByAmenityId(Long amenityId) {
        return roomAmenityMapper.findByAmenityId(amenityId);
    }

    public void insert(RoomAmenity roomAmenity) {
        roomAmenityMapper.insert(roomAmenity);
    }

    public void delete(RoomAmenity roomAmenity) {
        roomAmenityMapper.delete(roomAmenity);
    }

    public void deleteByRoomId(Long roomId) {
        roomAmenityMapper.deleteByRoomId(roomId);
    }
}