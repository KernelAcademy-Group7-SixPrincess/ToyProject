package org.spring.example.user.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Setter
@Getter
public class UsersignupDto {
    private String password;
    private String name;
    private String email;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birth;

    private String phone;
    private String nickname;
    private String gender;
    private String job;

}
