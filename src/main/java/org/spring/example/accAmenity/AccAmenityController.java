package org.spring.example.accAmenity;

import org.spring.example.accAmenity.domain.AccAmenity;
import org.spring.example.accAmenity.service.AccAmenityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/acc-amenities")
public class AccAmenityController {

    private final AccAmenityService accAmenityService;

    public AccAmenityController(AccAmenityService accAmenityService) {
        this.accAmenityService = accAmenityService;
    }

    // 특정 숙소의 편의시설 목록
    @GetMapping("/acc/{accId}")
    public String findByAccId(@PathVariable Long accId, Model model) {
        List<AccAmenity> list = accAmenityService.findByAccId(accId);
        model.addAttribute("accAmenities", list);
        return "acc_amenity/list";
    }

    // 편의시설 추가 폼
    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("accAmenity", new AccAmenity());
        return "acc_amenity/new";
    }

    // 추가 처리
    @PostMapping("/add")
    public String insert(@ModelAttribute AccAmenity accAmenity) {
        accAmenityService.insert(accAmenity);
        return "redirect:/acc-amenities/acc/" + accAmenity.getAccId();
    }

    // 삭제 처리
    @PostMapping("/delete")
    public String delete(@ModelAttribute AccAmenity accAmenity) {
        accAmenityService.delete(accAmenity);
        return "redirect:/acc-amenities/acc/" + accAmenity.getAccId();
    }
}