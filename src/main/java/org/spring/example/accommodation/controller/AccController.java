package org.spring.example.accommodation.controller;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.service.AccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AccController {

    @Autowired
    private AccService accService;

    // /acctest?region=jeju 로 들어왔을 때 동작
    @GetMapping("/acctest2")
    public String showAccByRegion(@RequestParam String region, Model model) {
        List<Acc> accList = accService.getAllAccs();  // 전체 숙소 목록 조회
        model.addAttribute("accList", accList);       // JSP에서 필터링에 사용
        return "accommodation/acctest2";
    }
}

