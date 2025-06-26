package org.spring.example.review.dao;


import org.spring.example.review.ReviewReplyDto;

import java.util.List;
public interface ReviewReplyDao {

        int count(Long reviewReplyId) throws Exception;
        int delete(Long  reviewReplyId, Long  reviewId) throws Exception;
        int insert(ReviewReplyDto dto) throws Exception;
        ReviewReplyDto select(Long  reviewReplyId) throws Exception;
        List<ReviewReplyDto> selectAll(Long  reviewId) throws Exception;
        int update(ReviewReplyDto reviewReplyDto) throws Exception;
        List<ReviewReplyDto> selectAllRepliesByReviewId(Long reviewId);

}
