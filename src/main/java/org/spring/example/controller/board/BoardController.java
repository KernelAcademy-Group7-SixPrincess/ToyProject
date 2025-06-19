package org.spring.example.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BoardController {

    @GetMapping("/faq")
    public String Faq(Model model) {

        return "board/faq/list";
    }

    @GetMapping("/notice")
    public String Notice(Model model) {

        return "board/notice/list";
    }
}
