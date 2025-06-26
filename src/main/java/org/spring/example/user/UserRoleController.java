package org.spring.example.user;

import org.spring.example.roles.service.RolesService;
import org.spring.example.user.dto.UserContextDto;
import org.spring.example.user.dto.UserinfoDto;
import org.spring.example.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class UserRoleController {

    @Autowired
    private UserService userService;
    @Autowired
    private RolesService rolesService;

//    유저 세션 판매자 정보로 변경
    @GetMapping("/user/check-role-seller")
    public String userRoleSeller(@ModelAttribute UserContextDto userContextDto, HttpSession session) {
        UserContextDto loginuser = (UserContextDto) session.getAttribute("loginUser");
        if(rolesService.getUserRoleCount(loginuser.getId()) == 1L) {
            rolesService.addUserRole(loginuser.getId(), 2L);
            UserinfoDto userinfo = userService.getUserinfo(loginuser.getEmail());
            UserContextDto changeroleuser = userService.setUserContext(userinfo, rolesService.getUserRoleCount(loginuser.getId()));
            session.setAttribute("loginUser", changeroleuser);
        } else{
            UserinfoDto userinfo = userService.getUserinfo(loginuser.getEmail());
            UserContextDto changeroleuser = userService.setUserContext(userinfo, rolesService.getUserRoleCount(loginuser.getId()));
            session.setAttribute("loginUser", changeroleuser);
        }
        return "redirect:/";
    }

//    유저 세션 이용자로 변경
    @GetMapping("/user/check-role-user")
    public String userRoleUser(@ModelAttribute UserContextDto userContextDto, HttpSession session) {
        UserContextDto loginuser = (UserContextDto) session.getAttribute("loginUser");
        UserinfoDto userinfo = userService.getUserinfo(loginuser.getEmail());
        UserContextDto changeroleuser = userService.setUserContext(userinfo, 1L);
        session.setAttribute("loginUser", changeroleuser);
        return "redirect:/";
    }


}
