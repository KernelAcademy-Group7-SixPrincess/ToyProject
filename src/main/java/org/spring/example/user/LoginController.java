package org.spring.example.user;


import org.spring.example.user.dto.UsersignupDto;
import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/auth")
    public String auth() {
        return "user/auth";
    }

    @GetMapping("/user/login")
    public String login() {
        return "user/login";
    }

    @GetMapping("/user/signup")
    public String signup() {
        return "user/signup";
    }

    @PostMapping("/user/signok")
    public String signok(@ModelAttribute UsersignupDto dto) {
        userService.signup(dto);
        System.out.println("signok");
        return "user/signok";
    }

//    @Autowired
//    private UserService userService;

//    @GetMapping("/user/list")
//    @ResponseBody  // ← 브라우저에서 바로 JSON 형태로 출력
//    public List<User> getAllUsers() {
//        return userService.findAll();
//    }
}
