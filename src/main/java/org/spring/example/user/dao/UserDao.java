package org.spring.example.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao {
    void signup(UsersignupDto usersignupDto);

    int  loginCheck(UserloginDto userloginDto);

    UserinfoDto getUserInfo(String email);
}
