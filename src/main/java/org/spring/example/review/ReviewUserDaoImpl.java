package org.spring.example.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
    public class ReviewUserDaoImpl implements ReviewUserDao {

    @Autowired
    private SqlSession session; // DataSource 대신 SqlSession 주입

    // MyBatis 매퍼 XML 파일의 namespace와 일치해야 합니다.
    private static String namespace = "org.spring.example.review.ReviewUserMapper";

    // mapResultSetToUserDto 헬퍼 메서드는 MyBatis가 자동으로 처리하므로 필요 없습니다.
    // private ReviewUserDto mapResultSetToUserDto(ResultSet rs) ... 이 메서드 통째로 삭제

    @Override
    public int deleteUser(BigInteger id) throws Exception {
        // SQL 쿼리 직접 작성 대신 session.delete() 호출
        // 여기서는 '소프트 삭제'를 위해 update 쿼리를 사용하도록 변경했습니다.
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("status", "DELETED");
        map.put("deletedAt", LocalDateTime.now()); // 탈퇴 시간 기록
        return session.update(namespace + ".softDeleteUser", map); // SQL ID는 .xml에 정의됩니다.
    }

    @Override
    public ReviewUserDto selectUserById(BigInteger id) throws Exception {
        // SQL 쿼리 직접 작성 대신 session.selectOne() 호출
        return session.selectOne(namespace + ".selectUserById", id); // SQL ID는 .xml에 정의됩니다.
    }

    @Override
    public ReviewUserDto selectUserByEmail(String email) throws Exception {
        // SQL 쿼리 직접 작성 대신 session.selectOne() 호출
        return session.selectOne(namespace + ".selectUserByEmail", email); // SQL ID는 .xml에 정의됩니다.
    }

    @Override
    public int insertUser(ReviewUserDto reviewUserDto) throws Exception {
        // SQL 쿼리 직접 작성 대신 session.insert() 호출
        return session.insert(namespace + ".insertUser", reviewUserDto); // SQL ID는 .xml에 정의됩니다.
    }

    @Override
    public int updateUser(ReviewUserDto reviewUserDto) throws Exception {
        // SQL 쿼리 직접 작성 대신 session.update() 호출
        return session.update(namespace + ".updateUser", reviewUserDto); // SQL ID는 .xml에 정의됩니다.
    }

    @Override
    public int count() throws Exception {
        // SQL 쿼리 직접 작성 대신 session.selectOne() 호출
        return session.selectOne(namespace + ".countUsers"); // SQL ID는 .xml에 정의됩니다.
    }



    @Override
    public List<ReviewUserDto> selectAllUsers() throws Exception {
        // SQL 쿼리 직접 작성 대신 session.selectList() 호출
        return session.selectList(namespace + ".selectAllUsers"); // SQL ID는 .xml에 정의됩니다.
    }
}