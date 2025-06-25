package org.spring.example.review;

import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface ReviewBoardDao {

       int count() throws Exception;  // 게시글 전체 개수를 조회합니다.

       int delete(Long reviewId, Long user_id) throws Exception;// 특정 ID와 사용자 ID에 해당하는 게시글을 삭제


       int insert(ReviewBoardDto dto) throws Exception;  // 새로운 게시글을 삽입
       List<ReviewBoardDto> selectAll() throws Exception;// 모든 게시글을 조회
       ReviewBoardDto select(Long reviewId) throws Exception;// 특정 ID에 해당하는 게시글 하나를 조회
       List<ReviewBoardDto> selectPage(Map map) throws Exception;// 페이지네이션을 위해 특정 범위의 게시글을 조회
       int update(ReviewBoardDto dto) throws Exception;
       List<ReviewBoardDto> findByAccId(@Param("accId") Long accId);
}
