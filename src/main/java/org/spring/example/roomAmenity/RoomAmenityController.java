package org.spring.example.roomAmenity;

import org.spring.example.roomAmenity.domain.RoomAmenity;
import org.spring.example.roomAmenity.service.RoomAmenityService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/amenities/room")
public class RoomAmenityController {

    private final RoomAmenityService roomAmenityService;

    public RoomAmenityController(RoomAmenityService roomAmenityService) {
        this.roomAmenityService = roomAmenityService;
    }

    // 특정 방의 편의시설 목록 조회
    @GetMapping("/{roomId}")
    public ResponseEntity<Map<String, Object>> findByRoomId(@PathVariable Long roomId) {
        List<RoomAmenity> roomAmenities = roomAmenityService.findByRoomId(roomId);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("responseData", roomAmenities);

        return ResponseEntity.ok(response);
    }

    // 편의시설 추가 (폼 없음, 바로 JSON으로 받음)
    @PostMapping
    public ResponseEntity<Map<String, Object>> insert(@RequestBody RoomAmenity roomAmenity) {
        roomAmenityService.insert(roomAmenity);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Room amenity added");
        response.put("roomId", roomAmenity.getRoomId());

        return ResponseEntity.ok(response);
    }

    // 편의시설 삭제
    @DeleteMapping
    public ResponseEntity<Map<String, Object>> delete(@RequestBody RoomAmenity roomAmenity) {
        roomAmenityService.delete(roomAmenity);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Room amenity deleted");
        response.put("roomId", roomAmenity.getRoomId());

        return ResponseEntity.ok(response);
    }
}