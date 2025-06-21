package org.spring.example.board.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.spring.example.board.dto.PostDto;

import java.util.List;

@Mapper
public interface PostMapper {
    List<PostDto> selectAllPost();
    PostDto selectById(Long postId);
    List<PostDto> selectByBoardId(int boardId);
    List<PostDto> getPinnedPostsByBoardId(int boardId);
    List<PostDto> getNormalPostsByBoardId(int boardId);
    List<PostDto> selectByBoardIdAndPinned(@Param("boardId") int boardId, @Param("isPinned") boolean isPinned);
    int insert(PostDto post);
    int update(PostDto post);
    int softDelete(PostDto postDto);
}
