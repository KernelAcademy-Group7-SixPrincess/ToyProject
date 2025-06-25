package org.spring.example.user;


import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/auth")
    public String auth() {
        return "user/auth";
    }

    @RequestMapping("/user/login")
    public String login() {
        return "user/login";
    }

    @GetMapping("/user/signup")
    public String signup() {
        return "user/signup";
    }

    @PostMapping("/user/signup")
    public String signok(@ModelAttribute UsersignupDto dto) {
        userService.signup(dto);
        System.out.println("signok");
        return "user/signupSuccess";
    }

    @PostMapping("/user/login")
    public String userlogincheck(@ModelAttribute UserloginDto userloginDto, @ModelAttribute UserinfoDto userinfoDto,  HttpSession session, Model model) {
        // 로그인 결과 확인
        int loginUser = userService.login(userloginDto);

        if (loginUser == 1) {
            // 로그인 성공 → 세션에 저장
//            String safeEmail = HtmlUtils.htmlEscape(dto.getEmail());
            UserinfoDto userinfo = userService.getUserinfo(userloginDto.getEmail());
            model.addAttribute("usernickname", userinfo.getNickname());
            session.setAttribute("loginUser", userinfo);
            return "redirect:/"; // or forward
        } else {
            // 로그인 실패 → 다시 로그인 페이지로
//            model.addAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
            return "user/login"; // 로그인 페이지
        }
    }

    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
