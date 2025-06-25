package org.spring.example.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
