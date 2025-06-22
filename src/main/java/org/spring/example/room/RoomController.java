package org.spring.example.room;

import lombok.RequiredArgsConstructor;
import org.spring.example.common.dto.APIResponse;
import org.spring.example.room.dto.Room;
import org.spring.example.room.service.RoomService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class RoomController {

    private final RoomService roomService;

    @PostMapping("/rooms")
    public void createRoom(Room room) {
        roomService.createRoom(room);
    }

    @GetMapping("/rooms")
    public List<Room> getAllRooms() {
        return roomService.findAllRooms();
    }

    @GetMapping("/rooms{roomId}")
    public Room getRoomByRoomId(@PathVariable long roomId) {
        return roomService.findRoomByRoomId(roomId);
    }

    @GetMapping("/rooms")
    public List<Room> getRoomsByAccId(@RequestParam long accId) {
        return roomService.findRoomsByAccId(accId);
    }

    @PutMapping("/room{roomId}")
    public void updateRoom(@PathVariable long roomId, @RequestBody Room room) {
        if(room == null)
            throw new IllegalArgumentException("Room is null");
        if(roomId != room.getId())
            throw new IllegalArgumentException("Invalid room id");
        roomService.updateRoomByRoom(room);
    }

    @DeleteMapping("/room{roomId}")
    public void deleteRoom(@PathVariable long roomId, @RequestBody Room room) {
        if(room == null)
            throw new IllegalArgumentException("Room is null");
        if(roomId != room.getId())
            throw new IllegalArgumentException("Invalid room id");
        roomService.deleteRoomByRoomId(roomId);
    }



}
