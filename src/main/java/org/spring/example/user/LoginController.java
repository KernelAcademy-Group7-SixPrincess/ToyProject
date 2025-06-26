package org.spring.example.user;

//import org.spring.example.user.dto.UserinfoDto;
//import org.spring.example.user.dto.UserloginDto;
//import org.spring.example.user.dto.UsersignupDto;
//import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
//    @Autowired
//    private UserService userService;

    @GetMapping("/user/auth")
    public String Auth(Model model) {

        return "user/auth";
    }

    @GetMapping("/user/login")
    public String Login(Model model) {

        return "user/login";
    }

    @GetMapping("/user/signup")
    public String Signup(Model model) {

        return "user/signup";
    }

//    @PostMapping("/user/signup")
//    public String SignupSuccess(@ModelAttribute UsersignupDto dto) {
//        userService.signup(dto);
//        return "user/signupSucess";
//    }
//
//    @PostMapping("/user/logincheck")
//    public String userlogincheck(@ModelAttribute UserloginDto userloginDto, @ModelAttribute UserinfoDto userinfoDto, HttpSession session, Model model) {
//        int loginUser = userService.login(userloginDto);
//
//        if (loginUser == 1) {
//            UserinfoDto userinfo = userService.getUserinfo(userloginDto.getEmail());
//            model.addAttribute("usernickname", userinfo.getNickname());
//            session.setAttribute("loginUser", userinfo);
//            return "redirect:/";
//        } else {
//            return "user/login";
//        }
//    }

    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
