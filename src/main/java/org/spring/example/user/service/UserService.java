package org.spring.example.user.service;

import org.spring.example.user.domain.User;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;

import java.util.List;

public interface UserService {
     public void signup(UsersignupDto usersignupDto);

     public int login(UserloginDto userloginDto);
}
