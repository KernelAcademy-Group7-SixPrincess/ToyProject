package org.spring.example.global;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GlobalErrorController {

    @RequestMapping("/error")
    public String error(HttpServletRequest request, Model model) {
        String redirectPath = request.getHeader("referer");
        model.addAttribute("redirectPath", redirectPath);
        return "error/error";
    }
}
