package org.spring.example.review;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.spring.example.review.ReviewReplyDto;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

    @Autowired
     ReviewBoardDao reviewBoardDao;
    @Autowired
    ReviewReplyDao reviewReplyDao;
    @Autowired
    private SqlSessionTemplate session;

    @Override
    public int getCount() throws Exception {
    return reviewBoardDao.count();

    }



    @Override
    public int remove(Long id, Long userId) throws Exception{
        return reviewBoardDao.delete(id,userId);
    }
    @Override
    public int write(ReviewBoardDto reviewBoardDto) throws Exception{
        return reviewBoardDao.insert(reviewBoardDto);
    }

    @Override
    public ReviewBoardDto read(Long id) throws Exception{
        return reviewBoardDao.select(id);
    }
    @Override
    public ReviewBoardDto readAll(Long id) throws Exception{
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
    @Override
    public List<ReviewBoardDto> getAll() throws Exception {
        List<ReviewBoardDto> reviews = reviewBoardDao.selectAll();
        for (ReviewBoardDto review : reviews) {
            List<ReviewReplyDto> replies = reviewReplyDao.selectAll(review.getReviewId());
            review.setReplies(replies);
        }
        return reviews;
    }
    @Override
    public List<ReviewReplyDto> selectAll(Long reviewId) throws Exception {

        return session.selectList("reviewReply.selectAllRepliesByReviewId", reviewId);
    }

    @Override
    public List<ReviewBoardDto> getReviewsByAccId(Long accId) {

        return reviewBoardDao.findByAccId(accId);
    }



}
