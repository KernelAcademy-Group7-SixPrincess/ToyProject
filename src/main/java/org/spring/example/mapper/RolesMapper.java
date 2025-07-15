package org.spring.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RolesMapper {
//    유저 역할 조회
    Long getUserRoleCount(Long userId);

//    역할 저장
    void setUserRole(Long userId);

//    역할 추가
    void addUserRole(@Param("userId") Long userId, @Param("roleId") Long roleId);
}
