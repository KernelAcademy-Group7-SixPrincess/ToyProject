package org.spring.example.accAmenity;

import org.spring.example.accAmenity.domain.AccAmenity;
import org.spring.example.accAmenity.service.AccAmenityService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/acc-amenities")
public class AccAmenityController {

    private final AccAmenityService accAmenityService;

    public AccAmenityController(AccAmenityService accAmenityService) {
        this.accAmenityService = accAmenityService;
    }

    // 특정 숙소의 편의시설 목록 조회
    @GetMapping("/acc/{accId}")
    public ResponseEntity<Map<String, Object>> findByAccId(@PathVariable Long accId) {
        List<AccAmenity> list = accAmenityService.findByAccId(accId);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("responseData", list);
        return ResponseEntity.ok(response);
    }

    // 새로운 편의시설 추가 (POST)
    @PostMapping
    public ResponseEntity<Map<String, Object>> insert(@RequestBody AccAmenity accAmenity) {
        accAmenityService.insert(accAmenity);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity added");
        response.put("accId", accAmenity.getAccId());

        return ResponseEntity.ok(response);
    }

    // 편의시설 삭제 (DELETE 방식으로 변경)
    @DeleteMapping
    public ResponseEntity<Map<String, Object>> delete(@RequestBody AccAmenity accAmenity) {
        accAmenityService.delete(accAmenity);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Amenity deleted");
        response.put("accId", accAmenity.getAccId());

        return ResponseEntity.ok(response);
    }
}