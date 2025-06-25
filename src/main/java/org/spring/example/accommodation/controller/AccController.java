package org.spring.example.accommodation.controller;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.service.AccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AccController {

    @Autowired
    private AccService accService;

    @GetMapping("/acclist")
    public String showAccByRegion(@RequestParam String region, Model model) {
        List<Acc> accList = accService.getByRegion(region);  // 전체 숙소 목록 조회
        model.addAttribute("accList", accList);       // JSP에서 필터링에 사용
        model.addAttribute("region", region);
        return "accommodation/acclist";
    }

    @GetMapping("/acc/{region}/{accId}")
    public String getAccDetail(@PathVariable Long accId, Model model) {
        Acc acc = accService.getAccByIdWithRooms(accId);
        model.addAttribute("acc", acc); // JSP에서 ${acc} 혹은 request.getAttribute("acc")로 받음
        return "accommodation/accinfo"; //
    }

}

