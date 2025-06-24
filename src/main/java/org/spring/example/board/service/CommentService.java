package org.spring.example.board.service;

import org.spring.example.board.dto.CommentDto;
import org.spring.example.board.mapper.CommentMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    private final CommentMapper commentMapper;

    public CommentService(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    public void saveComment(CommentDto commentDto) {
        commentMapper.insertComment(commentDto);
    }

    public List<CommentDto> getCommentsByPostId(Long postId) {
        return commentMapper.selectCommentsByPostId(postId);
    }
}
