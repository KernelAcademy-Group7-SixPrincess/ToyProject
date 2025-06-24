package org.spring.example.roomAmenity;

import org.spring.example.roomAmenity.domain.RoomAmenity;
import org.spring.example.roomAmenity.service.RoomAmenityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/room-amenities")
public class RoomAmenityController {

    private final RoomAmenityService roomAmenityService;

    public RoomAmenityController(RoomAmenityService roomAmenityService) {
        this.roomAmenityService = roomAmenityService;
    }

    // 특정 방의 편의시설 목록
    @GetMapping("/room/{roomId}")
    public String findByRoomId(@PathVariable Long roomId, Model model) {
        List<RoomAmenity> list = roomAmenityService.findByRoomId(roomId);
        model.addAttribute("roomAmenities", list);
        return "room_amenity/list";
    }

    // 방에 편의시설 추가 폼 (필요시)
    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("roomAmenity", new RoomAmenity());
        return "room_amenity/new";
    }

    // 추가 처리
    @PostMapping("/add")
    public String insert(@ModelAttribute RoomAmenity roomAmenity) {
        roomAmenityService.insert(roomAmenity);
        return "redirect:/room-amenities/room/" + roomAmenity.getRoomId();
    }

    // 삭제 처리
    @PostMapping("/delete")
    public String delete(@ModelAttribute RoomAmenity roomAmenity) {
        roomAmenityService.delete(roomAmenity);
        return "redirect:/room-amenities/room/" + roomAmenity.getRoomId();
    }
}