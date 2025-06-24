package org.spring.example.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("BoardDto")
public class BoardDto {
    private int boardId;
    private String boardType;

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getBoardType() {
        return boardType;
    }

    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }
}

