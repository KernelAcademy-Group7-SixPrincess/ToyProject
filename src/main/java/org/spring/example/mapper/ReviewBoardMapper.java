package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.review.ReviewBoardDto;
import java.util.List;
import java.util.Map;

@Mapper
    public interface ReviewBoardMapper {

        List<ReviewBoardDto> selectAll();

        ReviewBoardDto select(Long reviewId);

        int insert(ReviewBoardDto dto);

        int update(ReviewBoardDto dto);

        int delete(Long reviewId);

        int count();

        List<ReviewBoardDto> getReviewsByAccId(Long accId);
        ReviewBoardDto getReviewStatsByAccId(Long accId);
        // 3. accId에 대한 평균 평점 및 평가자 수
    }



