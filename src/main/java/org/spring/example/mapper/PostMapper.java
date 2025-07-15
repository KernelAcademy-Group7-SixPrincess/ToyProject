package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.spring.example.board.dto.PostDto;

import java.util.List;

@Mapper
public interface PostMapper {
    // 게시글 상세페이지 조회
    PostDto findPostById(Long postId);

    // 고정글 조회 (게시판별, is_pinned = true)
    List<PostDto> findPinnedPostsByBoardId(@Param("boardId") int boardId,
                                           @Param("pinned") boolean isPinned);

    // 일반글 페이징 (고정글 제외)
    List<PostDto> findPagedNormalPostsByBoardId(@Param("boardId") int boardId,
                                         @Param("limit") int limit,
                                         @Param("offset") int offset);

    // 전체 게시글 수 (고정글 포함)
    int countAllPostsByBoardId(@Param("boardId") int boardId);

    // 일반글 수 (페이징 계산용)
    int countNormalPostsByBoardId(@Param("boardId") int boardId);

    // 글 등록
    int createPost(PostDto post);

    // 글 수정
    int updatePost(PostDto post);

    // 글 삭제 (soft delete)
    int softDelete(PostDto postDto);


    // 키워드 검색
    List<PostDto> searchPostsByKeyword(@Param("boardId") int boardId,
                                       @Param("keyword") String keyword);


    // 답글 여부
    @Update("UPDATE post SET is_answered = true WHERE post_id = #{postId}")
    void markPostAsAnswered(@Param("postId") Long postId);

}
