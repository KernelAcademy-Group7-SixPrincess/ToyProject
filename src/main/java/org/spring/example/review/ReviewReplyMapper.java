package org.spring.example.review;


import org.apache.ibatis.annotations.Mapper;
import org.spring.example.review.ReviewReplyDto;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

public interface ReviewReplyMapper {

    // 특정 댓글 하나 조회
        ReviewReplyDto select(Long  replyId);

        // 댓글 전체 조회 (리뷰 ID 기준)
        List<ReviewReplyDto> selectAll(Long  reviewId);

        // 댓글 삽입
        int insert(ReviewReplyDto dto);

        // 댓글 수정
        int update(ReviewReplyDto dto);

        // 댓글 삭제 (댓글 ID + 리뷰 ID + 작성자 기준)
        int delete(Map<String, Object> paramMap);

        // 댓글 개수 조회 (댓글 ID 기준)
        int count(Long reviewReplyId);
    }


