package org.spring.example.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository

public class ReviewBoardDaoImpl implements ReviewBoardDao {

        @Autowired
        private SqlSession session;
        private String namespace = "org.spring.example.review.ReviewBoardMapper";

        @Override
        public int count() throws Exception {
            return session.selectOne(namespace + ".count");
        }

    @Override
    public int delete(BigInteger id, BigInteger user_id) throws Exception{
        Map map=new HashMap();
        map.put("id",id);
        map.put("user_id",user_id);
        return session.delete(namespace +".delete",map);
    }
    public int insert(ReviewBoardDto dto) throws Exception{
            return session.insert(namespace +".insert",dto);
    }
    @Override
    public List<ReviewBoardDto> selectAll() throws Exception{
            return session.selectList(namespace +".selectAll");
    }


    @Override
    public ReviewBoardDto select(BigInteger id) throws Exception {
        return session.selectOne(namespace+".select", id);
    }

    @Override
    public List<ReviewBoardDto> selectPage(Map map) throws Exception{
            return session.selectList(namespace +".selectPage", map);
    }
    @Override
    public int update(ReviewBoardDto dto) throws Exception{
            return session.update(namespace +".update",dto);
    }

}
