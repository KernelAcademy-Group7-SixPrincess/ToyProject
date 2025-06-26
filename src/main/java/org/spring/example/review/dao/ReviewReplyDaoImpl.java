package org.spring.example.review.dao;

import org.apache.ibatis.session.SqlSession;
import org.spring.example.review.ReviewReplyDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewReplyDaoImpl implements ReviewReplyDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.spring.example.mapper.ReviewReplyMapper";

    @Override
    public int count(Long  reviewReplyId) throws Exception {
        return session.selectOne(namespace+"count", reviewReplyId);
    }

    @Override
    public int delete(Long  reviewReplyId, Long  reviewId) throws Exception {
        Map map = new HashMap();
        map.put("reviewReplyId", reviewReplyId);
        map.put("reviewId", reviewId);
        return session.delete(namespace+"delete", map);
    }
    @Override
    public int insert(ReviewReplyDto reviewReplyDto) throws Exception {
        return session.insert(namespace+"insert", reviewReplyDto);
    }

    @Override
    public ReviewReplyDto select(Long reviewReplyId) throws Exception {
        return session.selectOne(namespace + "select", reviewReplyId);
    }

    @Override
    public int update(ReviewReplyDto reviewReplyDto) throws Exception {
        return session.update(namespace+"update", reviewReplyDto);
    }
    @Override
    public List<ReviewReplyDto> selectAll(Long reviewId) throws Exception {
        // MyBatis 매퍼 파일에 정의된 ID를 사용합니다.
        return session.selectList("org.spring.example.mapper.ReviewReplyMapper.selectAllRepliesByReviewId", reviewId);
    }
    @Override
    public List<ReviewReplyDto> selectAllRepliesByReviewId(Long reviewId) {
        return session.selectList(namespace + ".selectAllRepliesByReviewId", reviewId);
    }
}

