package org.spring.example.roles.service;


public interface RolesService {
//    역할 조회
    Long getUserRoleCount(Long userId);

//    역할 저장
    void setUserRole(Long userId);

//    역할 추가
    void addUserRole(Long userId, Long roleId);
}
