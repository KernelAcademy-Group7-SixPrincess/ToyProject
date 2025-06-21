package org.spring.example.board;

import org.spring.example.board.dto.PostDto;
import org.spring.example.board.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

@Controller
public class BoardController {

    private final PostService postService;

    public BoardController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/faq")
    public String faqList(Model model) {
        // FAQ 게시판 나중에 구현
        return "board/faq/list";
    }


    @GetMapping("/notice")
    public String noticeList(@RequestParam(defaultValue = "1") int page, Model model) {
        int boardId = 1; // 공지사항 게시판 ID
        int pageSize = 8;

        List<PostDto> pinnedPosts = postService.findPinnedPostsByBoardId(boardId);
        List<PostDto> normalPosts = postService.findPagedNormalPostsByBoardId(boardId, page, pageSize);

        int totalCount = postService.countNormalPostsByBoardId(boardId);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
        DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        for (PostDto post : pinnedPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
                post.setIsoDate(post.getCreatedAt().format(isoFormatter));
            } else {
                post.setFormattedDate("");
                post.setIsoDate("");
            }
        }

        for (PostDto post : normalPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
                post.setIsoDate(post.getCreatedAt().format(isoFormatter));
            } else {
                post.setFormattedDate("");
                post.setIsoDate("");
            }
        }

        model.addAttribute("pinnedPosts", pinnedPosts);
        model.addAttribute("normalPosts", normalPosts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

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
        PostDto post = postService.findPostById(postId);
        model.addAttribute("post", post);
        return "board/notice/detail";
    }

    @GetMapping("/notice/{postId}/edit")
    public String showEditForm(@PathVariable Long postId, Model model) {
        PostDto post = postService.findPostById(postId);
        model.addAttribute("post", post);
        return "board/notice/edit";
    }

    @PostMapping("/notice/{postId}/edit")
    public String submitEdit(@PathVariable Long postId, @ModelAttribute PostDto postDto) {
        postDto.setPostId(postId);
        postDto.setUserId(1L); // 테스트 유저
        postDto.setBoardId(1); // 공지 게시판

        postService.updatePost(postDto);
        return "redirect:/notice/" + postId;
    }

    @PostMapping("/notice/{postId}/delete")
    public String deletePost(@PathVariable Long postId) {
        PostDto postDto = new PostDto();
        postDto.setPostId(postId);
        postDto.setDeletedBy(1L); // 테스트 유저

        postService.softDelete(postDto);
        return "redirect:/notice";
    }
}
