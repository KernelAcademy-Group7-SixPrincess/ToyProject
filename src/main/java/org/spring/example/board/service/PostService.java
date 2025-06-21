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

    public List<PostDto> getAllPosts() {
        return postMapper.selectAllPost();
    }

    public List<PostDto> getPostsByBoardId(int boardId) {
        return postMapper.selectByBoardId(boardId);
    }

    public List<PostDto> getPinnedPostsByBoardId(int boardId) {
        return postMapper.selectByBoardIdAndPinned(boardId, true);
    }

    public List<PostDto> getNormalPostsByBoardId(int boardId) {
        return postMapper.selectByBoardIdAndPinned(boardId, false);
    }

    public PostDto getPostById(Long postId){
        return postMapper.selectById(postId);
    }

    public int createPost(PostDto postDto){
        return postMapper.insert(postDto);
    }

    public int updatePost(PostDto postDto){
        return postMapper.update(postDto);
    }

    public int deletePost(PostDto postDto) {
        return postMapper.softDelete(postDto);
    }

}
