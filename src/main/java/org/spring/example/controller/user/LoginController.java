package org.spring.example.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login/auth")
    public String login() {
        return "user/auth";
    }

    @GetMapping("/login/email")
    public String loginWithEmail() {
        return "user/email";
    }
}
