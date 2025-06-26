package org.spring.example.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("BoardDto")
public class BoardDto {
    private Long boardId;
    private String boardType;

    public Long getBoardId() {
        return boardId;
    }

    public void setBoardId(Long boardId) {
        this.boardId = boardId;
    }

    public String getBoardType() {
        return boardType;
    }

    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }
}

