package org.spring.example.global.exceptionHandler;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(value=Exception.class)
    public String handleException(Exception e, HttpServletRequest request, Model model){
        String redirectPath = request.getHeader("referer");
        model.addAttribute("redirectPath", redirectPath);
        return "error/error";
    }
}
