package org.spring.example.board.service;

import org.spring.example.board.dto.CommentDto;
import org.spring.example.mapper.CommentMapper;
import org.spring.example.mapper.PostMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    private final CommentMapper commentMapper;
    private final PostMapper postMapper;

    public CommentService(CommentMapper commentMapper, PostMapper postMapper) {
        this.commentMapper = commentMapper;
        this.postMapper = postMapper;
    }

    public void saveComment(CommentDto commentDto) {
        commentMapper.insertComment(commentDto);
        postMapper.markPostAsAnswered((long) commentDto.getPostId());
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
