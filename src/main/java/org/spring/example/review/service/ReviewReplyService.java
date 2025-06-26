package org.spring.example.review.service;



import org.spring.example.review.ReviewReplyDto;

import java.util.List;

public interface ReviewReplyService {
    ReviewReplyDto getReply(Long replyId);
    List<ReviewReplyDto> getRepliesByReviewId(Long reviewId);
    int addReply(ReviewReplyDto dto);
    int updateReply(ReviewReplyDto dto);
    int deleteReply(Long replyId, Long reviewId); // 수정됨

    List<ReviewReplyDto> selectAllRepliesByReviewId(Long reviewId);
}


