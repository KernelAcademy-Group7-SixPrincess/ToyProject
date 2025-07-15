package org.spring.example.room.service;

import org.spring.example.search.dto.SearchDto;
import org.spring.example.room.dto.Room;

import java.util.List;

public interface RoomService {
    void createRoom(Room room);
    Room findRoomByRoomId(long roomId);
    List<Room> findRoomsByAccId(long accId);
    List<Room> findRoomsByAccIdAndStatus(SearchDto searchDto);
    List<Room> findRoomsByAccIdAndStatusWithPrice(SearchDto searchDto);
    List<Room> findAllRooms();
    void updateRoomByRoom(Room room);
    void deleteRoomByRoomId(long roomId);
}
