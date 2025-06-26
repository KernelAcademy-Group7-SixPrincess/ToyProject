package org.spring.example.user;


import org.spring.example.roles.service.RolesService;
import org.spring.example.user.dto.UserContextDto;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.dto.UserloginDto;
import org.spring.example.user.dto.UsersignupDto;
import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private RolesService rolesService;

//    로그인 선택 페이지
    @GetMapping("/user/auth")
    public String auth() {
        return "user/auth";
    }

//    로그인 페이지
    @RequestMapping("/user/login")
    public String login() {
        return "user/login";
    }

//    회원가입
    @GetMapping("/user/signup")
    public String signup() {
        return "user/signup";
    }


    //    이메일 중복 체크
    @GetMapping("/user/check-email")
    @ResponseBody
    public String checkEmailDuplicate(@RequestParam("email") String email) {
        System.out.println("중복 체크 요청 이메일: " + email);
        boolean isDuplicate = userService.isEmailDuplicate(email);
        return isDuplicate ? "duplicate" : "available";
    }

//    회원가입 성공
    @PostMapping("/user/signup")
    public String signok(@ModelAttribute UsersignupDto dto, @ModelAttribute UserinfoDto userinfoDto) {
        userService.signup(dto);
        userinfoDto = userService.getUserinfo(dto.getEmail());
        rolesService.setUserRole(userinfoDto.getId());
        return "user/signupSuccess";
    }



//  로그인 결과 체크
    @PostMapping("/user/login")
    public String userlogincheck(@ModelAttribute UserloginDto userloginDto, @ModelAttribute UserinfoDto userinfoDto, @ModelAttribute UserContextDto userContextDto, HttpSession session, Model model) {
        // 로그인 결과 확인
        int loginUser = userService.login(userloginDto);

        if (loginUser == 1) {
            // 로그인 성공 → 세션에 저장
            UserinfoDto userinfo = userService.getUserinfo(userloginDto.getEmail());
            Long userrole = rolesService.getUserRoleCount(userinfo.getId());
            if (userrole == 0L) {
                userrole = 0L;
            } else {
                userrole = 1L;
            }
            UserContextDto usercontext = userService.setUserContext(userinfo, userrole);
            session.setAttribute("loginUser", usercontext);
            return "redirect:/";
        } else {
            // 로그인 실패 → 다시 로그인 페이지로
            model.addAttribute("loginError", "이메일 또는 비밀번호가 올바르지 않습니다.");
            return "user/login"; // 로그인 페이지
        }
    }

//    로그아웃
    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
