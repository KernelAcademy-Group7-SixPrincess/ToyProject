package org.spring.example.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/user/auth")
    public String Auth(Model model) {

        return "user/auth";
    }


    @GetMapping("/user/login")
    public String Login(Model model) {

        return "user/login";
    }
}
