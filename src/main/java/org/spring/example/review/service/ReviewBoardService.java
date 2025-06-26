package org.spring.example.review.service;

import org.spring.example.review.ReviewBoardDto;
import org.spring.example.review.ReviewReplyDto;

import java.util.List;
import java.util.Map;


public interface ReviewBoardService {
    int getCount() throws Exception;
    int remove(Long reviewId, Long user_id) throws Exception;
    int write(ReviewBoardDto reviewBoardDto) throws Exception;
    ReviewBoardDto read(Long reviewId) throws Exception;
    List<ReviewBoardDto> getPage(Map map) throws Exception;
    List<ReviewReplyDto> selectAll(Long reviewId) throws Exception;
    int modify(ReviewBoardDto reviewBoardDto) throws Exception;
    List<ReviewBoardDto> getAll() throws Exception;
    List<ReviewBoardDto> getReviewsByAccId(Long accId);
    ReviewBoardDto getReviewStatsByAccId(Long accId);
}
