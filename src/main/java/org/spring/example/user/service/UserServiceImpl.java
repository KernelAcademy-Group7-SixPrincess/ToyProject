package org.spring.example.user.service;

import org.spring.example.mapper.UserMapper;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void signup(UsersignupDto dto){
        userMapper.signup(dto);
    }

    @Override
    public int login(UserloginDto dto){
        return userMapper.loginCheck(dto);
    }

    @Override
    public UserinfoDto getUserinfo(String email){
        return userMapper.getUserInfo(email);
    }

}