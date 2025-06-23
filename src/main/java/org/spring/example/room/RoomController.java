package org.spring.example.room;

import lombok.RequiredArgsConstructor;
import org.spring.example.common.dto.SearchDto;
import org.spring.example.reservation.service.ReservationService;
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

    @GetMapping(value = "/rooms", params = "accId")
    public List<Room> getRoomsByAccId(@RequestParam long accId) {
        return roomService.findRoomsByAccId(accId);
    }

    @GetMapping(value = "/rooms/search")
    public List<Room> getRoomsByAccIdAndStatus(SearchDto searchDto) {
        if(searchDto.getCheckIn() == null)
            return roomService.findRoomsByAccIdAndStatusWithPrice(searchDto);
        return roomService.findRoomsByAccIdAndStatus(searchDto);
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
