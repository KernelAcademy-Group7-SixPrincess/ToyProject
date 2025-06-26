package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface UserMapper {
//    회원가입
    void signup(UsersignupDto usersignupDto);

//    로그인 정보 확인
    int  loginCheck(UserloginDto userloginDto);

//    유저 정보 조회
    UserinfoDto getUserInfo(String email);

//    회원가입시 이메일 중복 확인
    int isEmailDuplicate(String email);
}
