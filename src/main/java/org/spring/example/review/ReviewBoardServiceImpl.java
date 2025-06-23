package org.spring.example.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {
    @Autowired
     ReviewBoardDao reviewBoardDao;

    @Override
    public int getCount() throws Exception {
    return reviewBoardDao.count();

    }



    @Override
    public int remove(BigInteger id, BigInteger userId) throws Exception{
        return reviewBoardDao.delete(id,userId);
    }
    @Override
    public int write(ReviewBoardDto reviewBoardDto) throws Exception{
        return reviewBoardDao.insert(reviewBoardDto);
    }

    @Override
    public ReviewBoardDto read(BigInteger id) throws Exception{
        return reviewBoardDao.select(id);
    }
    @Override
    public ReviewBoardDto readAll(BigInteger id) throws Exception{
        return reviewBoardDao.select(id);
    }
    @Override
    public List<ReviewBoardDto> getPage(Map map) throws Exception {
        return reviewBoardDao.selectPage(map);

    }

    @Override
    public  int modify(ReviewBoardDto reviewBoardDto) throws Exception{
        return reviewBoardDao.update(reviewBoardDto);
    }


}
