package org.spring.example.review;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.review.ReviewBoardDto;
import java.util.List;

    @Mapper
    public interface ReviewBoardMapper {

        List<ReviewBoardDto> selectAll();

        ReviewBoardDto select(Long reviewId);

        int insert(ReviewBoardDto dto);

        int update(ReviewBoardDto dto);

        int delete(Long reviewId);

        int count();

        List<ReviewBoardDto> findByAccId(Long accId);
    }



