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
    public Long getUserRoleCount(Long userId){
        return rolesMapper.getUserRoleCount(userId);
    }

//    역할 저장
    @Override
    public void setUserRole(Long userId){
        rolesMapper.setUserRole(userId);
    }

//    역할 추가
    @Override
    public void addUserRole(Long userId,  Long roleId){
        rolesMapper.addUserRole(userId, roleId);
    }
}
