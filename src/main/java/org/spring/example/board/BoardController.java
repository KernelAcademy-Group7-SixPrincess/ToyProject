package org.spring.example.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


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

    @GetMapping("/notice/write")
    public String noticeWriteForm() {
        return "board/notice/write";
    }

    @GetMapping("/3")
    public String noticeDetail() {
        return "board/notice/detail";
    }

}