package org.spring.example.amenityCategory;

import org.spring.example.amenityCategory.domain.AmenityCategory;
import org.spring.example.amenityCategory.service.AmenityCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class AmenityCategoryController {

    private final AmenityCategoryService categoryService;

    public AmenityCategoryController(AmenityCategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // 목록 조회
    @GetMapping
    public String list(Model model) {
        List<AmenityCategory> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "category/list";  // ex) /WEB-INF/views/category/list.jsp
    }

    // 등록 폼
    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("category", new AmenityCategory());
        return "category/new";  // ex) /WEB-INF/views/category/new.jsp
    }

    // 등록 처리
    @PostMapping
    public String create(@ModelAttribute AmenityCategory category) {
        categoryService.insert(category);
        return "redirect:/categories";
    }

    // 수정 폼
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        AmenityCategory category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "category/edit";
    }

    // 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute AmenityCategory category) {
        categoryService.update(category);
        return "redirect:/categories";
    }

    // 삭제
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        categoryService.delete(id);
        return "redirect:/categories";
    }
}