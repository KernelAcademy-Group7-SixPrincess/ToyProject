package org.spring.example.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewReplyDaoImpl implements ReviewReplyDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.spring.example.ReviewReplyMapper.";

    @Override
    public int count(Long  reviewReplyId) throws Exception {
        return session.selectOne(namespace+"count", reviewReplyId);
    } // T selectOne(String statement)



    @Override
    public int delete(Long  reviewReplyId, Long  reviewId) throws Exception {
        Map map = new HashMap();
        map.put("reviewReplyId", reviewReplyId);
        map.put("reviewId", reviewId);
        return session.delete(namespace+"delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(ReviewReplyDto reviewReplyDto) throws Exception {
        return session.insert(namespace+"insert", reviewReplyDto);
    } // int insert(String statement, Object parameter)


    @Override
    public ReviewReplyDto select(Long reviewReplyId) throws Exception {
        return session.selectOne(namespace + "select", reviewReplyId);
    } // T selectOne(String statement, Object parameter)



    @Override
    public int update(ReviewReplyDto reviewReplyDto) throws Exception {
        return session.update(namespace+"update", reviewReplyDto);
    } // int update(String statement, Object parameter)

    @Override
    public List<ReviewReplyDto> selectAll(Long reviewId) throws Exception {
        // MyBatis 매퍼 파일에 정의된 ID를 사용합니다.
        return session.selectList("reviewReply.selectAllRepliesByReviewId", reviewId);
    }
}

