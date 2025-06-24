package org.spring.example.amenity;

import org.spring.example.amenity.domain.Amenity;
import org.spring.example.amenity.service.AmenityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/amenities")
public class AmenityController {

    private final AmenityService amenityService;

    public AmenityController(AmenityService amenityService) {
        this.amenityService = amenityService;
    }

    // --- [수정 폼 화면] ---
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Amenity amenity = amenityService.findById(id);
        model.addAttribute("amenity", amenity);
        return "amenity/edit"; // ex) /WEB-INF/views/amenity/edit.jsp
    }

    // --- [수정 처리] ---
    @PostMapping("/update")
    public String update(@ModelAttribute Amenity amenity) {
        amenityService.update(amenity);
        return "redirect:/amenities";
    }

    // --- [삭제 처리] ---
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        amenityService.delete(id);
        return "redirect:/amenities";
    }
}