package org.spring.example.user.service;

import org.spring.example.user.dao.UserDao;
import org.spring.example.user.domain.User;
import org.spring.example.user.dto.UsersignupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void signup(UsersignupDto dto){
        User user = new User();
        user.setName(dto.getName());
        user.setPassword(dto.getPassword());
        user.setEmail(dto.getEmail());
        user.setPhone(dto.getPhone());
        user.setBirth(dto.getBirth());
        user.setGender(dto.getGender());
        user.setNickname(dto.getNickname());

        userDao.signup(user);
    }

    @Override
    public void signupcheck(UsersignupDto dto){
        User user = new User();
    }
//
//    @Override
//    public List<User> findAll(){
//        return userDao.findAll();
//    }
}
