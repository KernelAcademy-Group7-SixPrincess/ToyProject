package org.spring.example.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.user.domain.User;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserDao {
    void signup(UsersignupDto usersignupDto);

    int  loginCheck(UserloginDto userloginDto);
}
