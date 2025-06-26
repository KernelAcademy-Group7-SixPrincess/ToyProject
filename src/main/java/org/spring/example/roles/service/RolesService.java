package org.spring.example.roles.service;


public interface RolesService {
//    역할 조회
    Long getUserRole(Long userId);

//    역할 저장
    void setUserRole(Long userId);
}
