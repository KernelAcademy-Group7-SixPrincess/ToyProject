package org.spring.example.roles.service;

import org.spring.example.mapper.RolesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RolesServiceImpl implements RolesService{

    @Autowired
    private RolesMapper rolesMapper;

//    역할 조회
    @Override
    public Long getUserRole(Long userId){
        return rolesMapper.getUserRole(userId);
    }

    @Override
    public void setUserRole(Long userId){
        rolesMapper.setUserRole(userId);
    }
}
