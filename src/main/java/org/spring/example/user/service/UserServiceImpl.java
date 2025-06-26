package org.spring.example.user.service;

import org.spring.example.mapper.UserMapper;
import org.spring.example.user.dto.UserContextDto;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

//    회원가입시 필요한 입력 정보
    @Override
    public void signup(UsersignupDto dto){
        userMapper.signup(dto);
    }

//    로그인시 필요한 정보
    @Override
    public int login(UserloginDto dto){
        return userMapper.loginCheck(dto);
    }

//    유저정보 조회
    @Override
    public UserinfoDto getUserinfo(String email){
        return userMapper.getUserInfo(email);
    }


//    회원가입시 이메일 중복 검증
    @Override
    public boolean isEmailDuplicate(String email) {
        return userMapper.isEmailDuplicate(email) == 1;
    }

//    회원정보, 역할 저장
    @Override
    public UserContextDto getUserContext(UserinfoDto userinfoDto,  Long roleId) {
        UserContextDto userContextDto = new UserContextDto();
        userContextDto.setId(userinfoDto.getId());
        userContextDto.setPassword(userinfoDto.getPassword());
        userContextDto.setName(userinfoDto.getName());
        userContextDto.setGender(userinfoDto.getGender());
        userContextDto.setEmail(userinfoDto.getEmail());
        userContextDto.setBirthDate(userinfoDto.getBirthDate());
        userContextDto.setPhone(userinfoDto.getPhone());
        userContextDto.setNickname(userinfoDto.getNickname());
        userContextDto.setSignupAt(userinfoDto.getSignupAt());
        userContextDto.setUserStatus(userinfoDto.getUserStatus());
        userContextDto.setPointBalance(userinfoDto.getPointBalance());
        userContextDto.setDeletedAt(userinfoDto.getDeletedAt());
        userContextDto.setUpdatedAt(userinfoDto.getUpdatedAt());
        userContextDto.setCodeTypeId(userinfoDto.getCodeTypeId());
        userContextDto.setCode(userinfoDto.getCode());
        userContextDto.setRoleId(roleId);
        return userContextDto;
    }
}