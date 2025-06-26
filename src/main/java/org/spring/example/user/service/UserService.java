package org.spring.example.user.service;

import org.spring.example.user.dto.UserContextDto;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;

import java.util.Map;

public interface UserService {
//     회원가입
     public void signup(UsersignupDto usersignupDto);

//     로그인
     public int login(UserloginDto userloginDto);

//     유저정보 조회
     public UserinfoDto getUserinfo(String email);

//     이메일 중복 확인
     public boolean isEmailDuplicate(String email);

     // 유저정보, 역할 정보 저장
     public UserContextDto getUserContext(UserinfoDto userinfoDto, Long roleId);
}
