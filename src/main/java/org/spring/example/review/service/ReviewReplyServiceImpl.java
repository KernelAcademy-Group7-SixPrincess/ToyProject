package org.spring.example.review.service;

import org.spring.example.review.dao.ReviewReplyDao;
import org.spring.example.review.ReviewReplyDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

    private final ReviewReplyDao reviewReplyDao;

    @Autowired
    public ReviewReplyServiceImpl(ReviewReplyDao reviewReplyDao) {
        this.reviewReplyDao = reviewReplyDao;
    }

    @Override
    public ReviewReplyDto getReply(Long replyId) {
        try {
            return reviewReplyDao.select(replyId);
        } catch (Exception e) {
            throw new RuntimeException("댓글 조회 중 오류 발생", e);
        }
    }

    @Override
    public List<ReviewReplyDto> getRepliesByReviewId(Long reviewId) {
        try {
            return reviewReplyDao.selectAll(reviewId);
        } catch (Exception e) {
            throw new RuntimeException("댓글 목록 조회 중 오류 발생", e);
        }
    }

    @Override
    public int addReply(ReviewReplyDto dto) {
        try {
            return reviewReplyDao.insert(dto);
        } catch (Exception e) {
            throw new RuntimeException("댓글 등록 중 오류 발생", e);
        }
    }

    @Override
    public int updateReply(ReviewReplyDto dto) {
        try {
            return reviewReplyDao.update(dto);
        } catch (Exception e) {
            throw new RuntimeException("댓글 수정 중 오류 발생", e);
        }
    }

    @Override
    public int deleteReply(Long replyId, Long reviewId) {
        try {
            return reviewReplyDao.delete(replyId, reviewId);
        } catch (Exception e) {
            throw new RuntimeException("댓글 삭제 중 오류 발생", e);
        }
    }
    @Override
    public List<ReviewReplyDto> selectAllRepliesByReviewId(Long reviewId) {
        return reviewReplyDao.selectAllRepliesByReviewId(reviewId);
    }
}