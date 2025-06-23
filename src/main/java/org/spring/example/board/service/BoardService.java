package org.spring.example.board.service;

import org.spring.example.board.dto.BoardDto;
import org.spring.example.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    private final BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public List<BoardDto> getAllBoards() {
        return boardMapper.selectAllBoards();
    }

    public BoardDto getBoardById(int boardId) {
        return boardMapper.selectById(boardId);
    }

    public int createBoard(BoardDto boardDto) {
        return boardMapper.insert(boardDto);
    }

    public int updateBoard(BoardDto boardDto) {
        return boardMapper.update(boardDto);
    }

    public int deleteBoard(int boardId) {
        return boardMapper.delete(boardId);
    }
}
