package org.spring.example.review;

import java.math.BigInteger;
import java.util.List;

public interface ReviewUserDao  {


        // 1. 사용자 조회 (READ)
        // ID(BIGINT)로 사용자 조회 (user_id 컬럼)
        // parameter: 사용자의 고유 ID (BIGINT)
        // return: 조회된 ReviewUserDto 객체, 없으면 null
        ReviewUserDto selectUserById(BigInteger id) throws Exception;

        // 이메일(로그인 ID)로 사용자 조회
        // parameter: 사용자의 이메일 주소 (email 컬럼)
        // return: 조회된 ReviewUserDto 객체, 없으면 null
        ReviewUserDto selectUserByEmail(String email) throws Exception; // <-- 로그인 기능에 필수적입니다.

        // 2. 사용자 추가 (CREATE - 회원가입)
        // parameter: 저장할 사용자 정보를 담은 ReviewUserDto 객체
        // return: 영향을 받은 행의 수 (보통 1, 실패시 0)
        int insertUser(ReviewUserDto reviewUserDto) throws Exception;

        // 3. 사용자 정보 수정 (UPDATE)
        // parameter: 수정할 정보가 담긴 ReviewUserDto 객체
        // return: 영향을 받은 행의 수 (보통 1, 실패시 0)
        int updateUser(ReviewUserDto reviewUserDto) throws Exception;

        // 4. 총 사용자 수 조회
        // return: 테이블의 총 사용자 수
        int count() throws Exception;

        // 5. 사용자 삭제 (DELETE - 실제로는 소프트 삭제를 권장)
        // parameter: 삭제할 사용자의 ID (BIGINT)
        // return: 영향을 받은 행의 수
        int deleteUser(BigInteger id) throws Exception; // ID는 BigInteger 타입이어야 합니다.

     List<ReviewUserDto> selectAllUsers() throws Exception;
    }
