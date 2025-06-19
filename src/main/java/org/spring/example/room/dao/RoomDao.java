package org.spring.example.room.dao;

import org.spring.example.room.dto.RoomDto;

public interface RoomDao {
    RoomDto getRoom(Long id);

}
