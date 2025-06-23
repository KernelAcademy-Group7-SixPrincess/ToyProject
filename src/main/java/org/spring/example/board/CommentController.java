package org.spring.example.board;

import org.spring.example.board.dto.CommentDto;
import org.spring.example.board.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CommentController {

    private CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @PostMapping("/comment/write")
    public String writeComment(CommentDto commentDto) {

        commentDto.setUserId(1);
        commentService.saveComment(commentDto);


        System.out.println("postId: " + commentDto.getPostId());
        return "redirect:/board/qna/" + commentDto.getPostId();
    }
}
