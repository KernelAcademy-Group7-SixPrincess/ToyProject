package org.spring.example.board;

import org.spring.example.board.dto.CommentDto;
import org.spring.example.board.dto.PostDto;
import org.spring.example.board.service.CommentService;
import org.spring.example.board.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final PostService postService;
    private final CommentService commentService;


    public BoardController(PostService postService, CommentService commentService) {
        this.postService = postService;
        this.commentService = commentService;
    }

    @GetMapping("/{type}")
    public String listPosts(@PathVariable String type,
                            @RequestParam(defaultValue = "1") int page,
                            @RequestParam(required = false) String keyword,
                            Model model) {

        int boardId = getBoardIdByType(type);
        int pageSize = 8;
        List<PostDto> pinnedPosts = postService.findPinnedPostsByBoardId(boardId);
        List<PostDto> normalPosts = postService.findPagedNormalPostsByBoardId(boardId, page, pageSize);
        int totalCount = postService.countNormalPostsByBoardId(boardId);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);


        if ("faq".equals(type) && keyword != null && !keyword.isBlank()) {
            // FAQ 검색
            normalPosts = postService.searchPostsByKeyword(boardId, keyword);
        }


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
        DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        for (PostDto post : pinnedPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
                post.setIsoDate(post.getCreatedAt().format(isoFormatter));
            }
        }

        for (PostDto post : normalPosts) {
            if (post.getCreatedAt() != null) {
                post.setFormattedDate(post.getCreatedAt().format(formatter));
                post.setIsoDate(post.getCreatedAt().format(isoFormatter));
            }
        }

        model.addAttribute("pinnedPosts", pinnedPosts);
        model.addAttribute("normalPosts", normalPosts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "board/" + type + "/list";
    }

    @GetMapping("/{type}/write")
    public String writeForm(@PathVariable String type) {
        return "board/" + type + "/write";
    }

    @PostMapping("/{type}/submit")
    public String submitPost(@PathVariable String type, @ModelAttribute PostDto postDto) {
        postDto.setBoardId(getBoardIdByType(type));
        postDto.setUserId(1L); // 테스트 유저

        postService.createPost(postDto);
        return "redirect:/board/" + type;
    }

    @GetMapping("/{type}/{postId}")
    public String viewPost(@PathVariable String type, @PathVariable Long postId, Model model) {
        PostDto post = postService.findPostById(postId);

        List<CommentDto> commentList = commentService.selectCommentsByPostId(postId);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        for (CommentDto comment : commentList) {
            if (comment.getCreatedAt() != null) {
                comment.setFormattedDate(comment.getCreatedAt().format(formatter));
            }
        }

        model.addAttribute("post", post);
        model.addAttribute("commentList", commentList);

        return "board/" + type + "/detail";
    }

    @GetMapping("/{type}/{postId}/edit")
    public String editForm(@PathVariable String type, @PathVariable Long postId, Model model) {
        PostDto post = postService.findPostById(postId);
        model.addAttribute("post", post);
        return "board/" + type + "/edit";
    }

    @PostMapping("/{type}/{postId}/edit")
    public String submitEdit(@PathVariable String type, @PathVariable Long postId, @ModelAttribute PostDto postDto) {
        postDto.setPostId(postId);
        postDto.setUserId(1L);
        postDto.setBoardId(getBoardIdByType(type));

        postService.updatePost(postDto);

        if ("faq".equals(type)) {
            return "redirect:/board/" + type;
        } else {
            return "redirect:/board/" + type + "/" + postId;
        }
    }

    @PostMapping("/{type}/{postId}/delete")
    public String deletePost(@PathVariable String type, @PathVariable Long postId) {
        PostDto postDto = new PostDto();
        postDto.setPostId(postId);
        postDto.setDeletedBy(1L);

        postService.softDelete(postDto);
        return "redirect:/board/" + type;
    }

    private int getBoardIdByType(String type) {
        return switch (type) {
            case "notice" -> 1;
            case "faq" -> 2;
            case "qna" -> 3;
            default -> throw new IllegalArgumentException("Unknown board type: " + type);
        };
    }
}
