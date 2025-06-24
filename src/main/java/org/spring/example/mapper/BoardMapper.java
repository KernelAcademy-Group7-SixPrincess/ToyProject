package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.board.dto.BoardDto;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDto> selectAllBoards();

    BoardDto selectById(long boardId);

    int insert(BoardDto boardDto);

    int update(BoardDto boardDto);

    int delete(int boardId);
}
