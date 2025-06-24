package org.spring.example.user.service;

import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;

public interface UserService {
     public void signup(UsersignupDto usersignupDto);

     public int login(UserloginDto userloginDto);

     public UserinfoDto getUserinfo(String email);
}
