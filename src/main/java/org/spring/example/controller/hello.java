package org.spring.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class hello {
    @GetMapping
    public String home(Model model) {
        return "index";
    }
}
