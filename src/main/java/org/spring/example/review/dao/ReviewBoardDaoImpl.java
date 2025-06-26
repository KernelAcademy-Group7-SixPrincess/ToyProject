package org.spring.example.review.dao;

import org.apache.ibatis.session.SqlSession;
import org.spring.example.review.ReviewBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository

public class ReviewBoardDaoImpl implements ReviewBoardDao {

        @Autowired
        private SqlSession session;
        private String namespace = "org.spring.example.mapper.ReviewBoardMapper";

        @Override
        public int count() throws Exception {
            return session.selectOne(namespace + ".count");
        }

    @Override
    public int delete(Long review_id, Long user_id) throws Exception{
        Map map=new HashMap();
        map.put("id",review_id);
        map.put("user_id",user_id);
        return session.delete(namespace +".delete",map);
    }
    public int insert(ReviewBoardDto dto) throws Exception{
            return session.insert(namespace +".insert",dto);
    }
    @Override
    public List<ReviewBoardDto> selectAll() throws Exception{
        return session.selectList("org.spring.example.mapper.ReviewBoardMapper.selectAll");
    }


    @Override
    public ReviewBoardDto select(Long review_id) throws Exception {
        return session.selectOne(namespace+".select", review_id);
    }


    @Override
    public int update(ReviewBoardDto dto) throws Exception{
            return session.update(namespace +".update",dto);
    }

    @Override
    public List<ReviewBoardDto> getReviewsByAccId(Long accId) {
        return session.selectList(namespace + ".getReviewsByAccId", accId);
    }

    @Override
    public ReviewBoardDto getReviewStatsByAccId(Long accId) {
        return session.selectOne(namespace + ".getReviewStatsByAccId", accId);
    }
}
