package org.spring.example.user.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.time.LocalDate;

@Setter
@Getter
public class UserinfoDto {
        private Long id;
        private String password;
        private String name;
        private String gender;
        private String email;
        private LocalDate birthDate;
        private String phone;
        private String nickname;
        private Timestamp signupAt;
        private String userStatus;
        private int pointBalance;
        private Timestamp deletedAt;
        private Timestamp updatedAt;
        private String codeTypeId;
        private int code;
}

