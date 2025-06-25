package org.spring.example.board.service;

import org.spring.example.board.dto.CommentDto;
import org.spring.example.mapper.CommentMapper;
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

    public void updateComment(CommentDto commentDto) {
        commentMapper.updateComment(commentDto);
    }

    public void deleteComment(CommentDto commentDto) {
        commentMapper.deleteComment(commentDto);
    }

    public List<CommentDto> selectCommentsByPostId(Long postId) {
        return commentMapper.selectCommentsByPostId(postId);
    }
}
