package org.spring.example.amenityCategory;

import org.spring.example.amenityCategory.domain.AmenityCategory;
import org.spring.example.amenityCategory.service.AmenityCategoryService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/amenity/categories")
public class AmenityCategoryController {

    private final AmenityCategoryService categoryService;

    public AmenityCategoryController(AmenityCategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // 1. 전체 카테고리 목록 조회
    @GetMapping
    public ResponseEntity<Map<String, Object>> list() {
        List<AmenityCategory> categories = categoryService.findAll();
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("responseData", categories);
        return ResponseEntity.ok(response);
    }

    // 2. 단일 카테고리 조회
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> findById(@PathVariable Long id) {
        AmenityCategory category = categoryService.findById(id);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("responseData", category);
        return ResponseEntity.ok(response);
    }

    // 3. 카테고리 등록
    @PostMapping
    public ResponseEntity<Map<String, Object>> create(@RequestBody AmenityCategory category) {
        categoryService.insert(category);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity category created successfully");
        response.put("responseData", category);
        return ResponseEntity.ok(response);
    }

    // 4. 카테고리 수정
    @PutMapping("/{id}")
    public ResponseEntity<Map<String, Object>> update(@PathVariable Long id, @RequestBody AmenityCategory category) {
        category.setId(id);
        categoryService.update(category);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity category updated successfully");
        response.put("responseData", category);
        return ResponseEntity.ok(response);
    }

    // 5. 카테고리 삭제
    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, Object>> delete(@PathVariable Long id) {
        categoryService.delete(id);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity category deleted successfully");
        response.put("deletedId", id);
        return ResponseEntity.ok(response);
    }
}