package org.spring.example.user;


import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

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

    @PostMapping("/user/logincheck")
    public String userlogincheck(@ModelAttribute UserloginDto dto, HttpSession session, Model model) {
        // 로그인 결과 확인
        int loginUser = userService.login(dto);

        if (loginUser == 1) {
            // 로그인 성공 → 세션에 저장
//            session.setAttribute("loginUser", loginUser);
            return "redirect:/user/index"; // or forward
        } else {
            // 로그인 실패 → 다시 로그인 페이지로
//            model.addAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
            return "user/login"; // 로그인 페이지
        }
    }

    @GetMapping("/user/index")
    public String index() {
        return "user/userindex";
    }

}
