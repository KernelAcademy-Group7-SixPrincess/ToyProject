package org.spring.example.roles.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class UserRoles {
    private Long userId;
    private Long roleId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
