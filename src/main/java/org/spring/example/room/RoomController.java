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

    @PostMapping("/room")
    public void createRoom(Room room) {
        roomService.createRoom(room);
    }

    @GetMapping("/room")
    public Room getRoom(@RequestParam long roomId) {
        return roomService.findRoomByRoomId(roomId);
    }

    @GetMapping("/rooms")
    public List<Room> getRooms(@RequestParam long accId) {
        return roomService.findRoomsByAccId(accId);
    }

    @PutMapping("/room")
    public void updateRoom(Room room) {
        roomService.updateRoomByRoom(room);
    }

    @DeleteMapping("/room")
    public void deleteRoom(@RequestParam long roomId) {
        roomService.deleteRoomByRoomId(roomId);
    }


}
