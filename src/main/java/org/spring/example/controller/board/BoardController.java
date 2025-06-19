package org.spring.example.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BoardController {

    @GetMapping("/board")
    public String Board(Model model) {

        return "board/board";
    }
}
