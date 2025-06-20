package org.spring.example.board;

import org.spring.example.board.dto.PostDto;
import org.spring.example.board.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class BoardController {

    private final PostService postService;

    public BoardController(PostService postService) {
        this.postService = postService;
    }



    @GetMapping("/faq")
    public String faqList(Model model) {
        // FAQ 게시판 처리 나중에 구현
        return "board/faq/list";
    }

    @GetMapping("/notice")
    public String noticeList(Model model) {
        int noticeBoardId = 1;

        List<PostDto> pinnedPosts = postService.getPinnedPostsByBoardId(noticeBoardId);
        List<PostDto> normalPosts = postService.getNormalPostsByBoardId(noticeBoardId);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd.");
        for (PostDto post : pinnedPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
            } else {
                post.setFormattedDate(""); // 또는 원하는 기본값
            }
        }
        for (PostDto post : normalPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
            } else {
                post.setFormattedDate("");
            }
        }

        model.addAttribute("pinnedPosts", pinnedPosts);
        model.addAttribute("normalPosts", normalPosts);

        return "board/notice/list";
    }



    @GetMapping("/notice/write")
    public String noticeWriteForm() {
        return "board/notice/write";
    }

    @PostMapping("/notice/submit")
    public String submitNotice(@ModelAttribute PostDto postDto) {
        postDto.setBoardId(1); // 공지사항 id = 1
        postDto.setUserId(1L); // 테스트 유저
        postService.createPost(postDto);
        return "redirect:/notice";
    }

    @GetMapping("/notice/{postId}")
    public String noticeDetail(@PathVariable Long postId, Model model) {
        PostDto post = postService.getPostById(postId);
        model.addAttribute("post", post);
        return "board/notice/detail";
    }
}
