package org.spring.example.room.service;

import org.spring.example.room.dto.Room;

import java.util.List;

public interface RoomService {
    void createRoom(Room room);
    Room findRoomByRoomId(long roomId);
    List<Room> findRoomsByAccId(long accId);
    void updateRoomByRoom(Room room);
    void deleteRoomByRoomId(long roomId);
}
