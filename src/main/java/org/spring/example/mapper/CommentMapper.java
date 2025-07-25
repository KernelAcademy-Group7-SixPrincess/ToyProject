package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.board.dto.CommentDto;

import java.util.List;

@Mapper
public interface CommentMapper {
    void insertComment(CommentDto commentDto);
    void updateComment(CommentDto commentDto);
    void deleteComment(CommentDto commentDto);

    List<CommentDto> selectCommentsByPostId(Long postId);
}
