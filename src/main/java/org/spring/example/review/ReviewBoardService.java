package org.spring.example.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;


public interface ReviewBoardService {
    int getCount() throws Exception;
    int remove(BigInteger id, BigInteger user_id) throws Exception;
    int write(ReviewBoardDto reviewBoardDto) throws Exception;
    ReviewBoardDto read(BigInteger id) throws Exception;
    ReviewBoardDto readAll(BigInteger id) throws Exception;
    List<ReviewBoardDto> getPage(Map map) throws Exception;

    int modify(ReviewBoardDto reviewBoardDto) throws Exception;

}
