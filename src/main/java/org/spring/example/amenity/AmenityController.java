package org.spring.example.amenity;

import org.spring.example.amenity.domain.Amenity;
import org.spring.example.amenity.service.AmenityService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/amenities")
public class AmenityController {

    private final AmenityService amenityService;

    public AmenityController(AmenityService amenityService) {
        this.amenityService = amenityService;
    }

    // 1. 특정 편의시설 조회 (수정 폼에 쓰일 데이터 확인)
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> findById(@PathVariable Long id) {
        Amenity amenity = amenityService.findById(id);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("responseData", amenity);
        return ResponseEntity.ok(response);
    }

    // 2. 새 편의시설 등록 (생성)
    @PostMapping
    public ResponseEntity<Map<String, Object>> register(@RequestBody Amenity amenity) {
        amenityService.insert(amenity);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity registered successfully");
        response.put("responseData", amenity);
        return ResponseEntity.ok(response);
    }

    // 3. 편의시설 수정 (업데이트)
    @PutMapping("/{id}")
    public ResponseEntity<Map<String, Object>> update(@PathVariable Long id, @RequestBody Amenity amenity) {
        // 편의시설의 id를 URL 경로의 id로 강제
        amenity.setId(id);
        amenityService.update(amenity);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity updated successfully");
        response.put("responseData", amenity);
        return ResponseEntity.ok(response);
    }

    // 4. 편의시설 삭제
    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, Object>> delete(@PathVariable Long id) {
        amenityService.delete(id);
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity deleted successfully");
        response.put("deletedId", id);
        return ResponseEntity.ok(response);
    }
}