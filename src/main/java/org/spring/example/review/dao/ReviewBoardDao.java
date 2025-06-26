package org.spring.example.review.dao;

import org.spring.example.review.ReviewBoardDto;

import java.util.List;

public interface ReviewBoardDao {

       int count() throws Exception;  // 게시글 전체 개수를 조회합니다.

       int delete(Long reviewId, Long user_id) throws Exception;// 특정 ID와 사용자 ID에 해당하는 게시글을 삭제


       int insert(ReviewBoardDto dto) throws Exception;  // 새로운 게시글을 삽입
       List<ReviewBoardDto> selectAll() throws Exception;// 모든 게시글을 조회
       ReviewBoardDto select(Long reviewId) throws Exception;// 특정 ID에 해당하는 게시글 하나를 조회

       int update(ReviewBoardDto dto) throws Exception;

       List<ReviewBoardDto> getReviewsByAccId(Long accId); // 숙소별 리뷰 목록
       ReviewBoardDto getReviewStatsByAccId(Long accId);   // 숙소별 리뷰 통계
}
