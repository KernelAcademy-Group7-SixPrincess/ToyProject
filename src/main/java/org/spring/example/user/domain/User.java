package org.spring.example.user.domain;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.time.LocalDate;

@Setter
@Getter
public class User {
        private Long id;
        private String password;
        private String name;
        private String gender;
        private String email;
        private LocalDate birth;
        private String phone;
        private String nickname;
        private Timestamp signupAt;
        private String status;
        private int pointBalance;
        private Timestamp deletedAt;
        private Timestamp createdAt;
        private Timestamp updatedAt;

        private String codeTypeId;
        private int code;

}
