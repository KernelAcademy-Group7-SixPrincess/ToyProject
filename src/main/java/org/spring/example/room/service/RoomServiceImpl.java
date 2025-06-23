package org.spring.example.room.service;

import lombok.RequiredArgsConstructor;
import org.spring.example.common.dto.SearchDto;
import org.spring.example.room.dto.Room;
import org.spring.example.room.mapper.RoomMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class RoomServiceImpl implements RoomService {

    private final RoomMapper roomMapper;

    @Override
    @Transactional
    public void createRoom(Room room) {
        roomMapper.createRoom(room);
    }

    @Override
    public Room findRoomByRoomId(long roomId) {
        return roomMapper.findRoomById(roomId);
    }

    @Override
    public List<Room> findRoomsByAccId(long accId) {
        List<Room> roomList = roomMapper.findRoomsByAccId(accId);
        if(roomList.isEmpty()) throw new NoSuchElementException("No rooms found");
        return roomList;
    }

    @Override
    public List<Room> findRoomsByAccIdAndStatus(SearchDto searchDto) {
        return roomMapper.findRoomsByAccIdAndStatus(searchDto);
    }

    @Override
    public List<Room> findAllRooms() {
        return roomMapper.findAllRooms();
    }

    @Override
    public void updateRoomByRoom(Room room) {
        roomMapper.updateRoomByRoom(room);
    }

    @Override
    public void deleteRoomByRoomId(long roomId) {
        roomMapper.deleteRoomByRoomId(roomId);
    }


}
