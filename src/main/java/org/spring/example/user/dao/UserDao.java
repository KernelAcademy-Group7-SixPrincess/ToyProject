package org.spring.example.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.spring.example.user.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserDao {
//    User findById(long id);

//    List<User> findAll();
    void signup(User user);

    void signupcheck(User user);
}
