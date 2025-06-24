package org.spring.example.board.service;

import org.spring.example.board.dto.PostDto;
import org.spring.example.board.mapper.PostMapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PostService {

    private final PostMapper postMapper;

    public PostService(PostMapper postMapper) {
        this.postMapper = postMapper;
    }


    // 고정글 조회 (게시판 타입 별로 분류)
    public List<PostDto> findPinnedPostsByBoardId(int boardId) {
        return postMapper.findPinnedPostsByBoardId(boardId, true);
    }

    // 일반글 페이징 조회 (고정글 제외)
    public List<PostDto> findPagedNormalPostsByBoardId(int boardId, int page, int size) {
        int offset = (page - 1) * size;
        return postMapper.findPagedNormalPostsByBoardId(boardId, size, offset);
    }

    // 일반글 수 (고정글 제외)
    public int countNormalPostsByBoardId(int boardId) {
        return postMapper.countNormalPostsByBoardId(boardId);
    }


    // 전체 게시글 수 (고정글 포함)
    public int countAllPostsByBoardId(int boardId) {
        return postMapper.countAllPostsByBoardId(boardId);
    }

    // 게시글 상세 조회
    public PostDto findPostById(Long postId){
        return postMapper.findPostById(postId);
    }

    // 게시글 등록
    public int createPost(PostDto postDto){
        return postMapper.createPost(postDto);
    }

    // 게시글 수정
    public int updatePost(PostDto postDto){
        return postMapper.updatePost(postDto);
    }

    // 게시글 삭제
    public int softDelete(PostDto postDto) {
        return postMapper.softDelete(postDto);
    }

    // 키워드 검색 (FAQ 게시판 기능)
    public List<PostDto> searchPostsByKeyword(int boardId, String keyword) {
        return postMapper.searchPostsByKeyword(boardId, keyword);
    }
}
