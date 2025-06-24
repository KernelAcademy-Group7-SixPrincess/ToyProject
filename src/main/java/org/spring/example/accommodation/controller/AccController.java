package org.spring.example.accommodation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccController {
    @GetMapping("/acctest")
    public String showAccList(@RequestParam String region, Model model) {
        model.addAttribute("region", region);
        return "accommodation/acctest";
    }
}
