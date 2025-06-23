package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import org.spring.example.common.dto.SearchDto;
import org.spring.example.reservation.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class SearchController {
    private final ReservationService reservationService;


    @GetMapping("/search")
    public String search(SearchDto searchDto, Model model) {
        // 조건에 맞는 객실 필터링 후 ID 반환
        // 조건 : 키워드, 지역
        // 객실과 조인 후 인원 조건 필터링
        List<Integer> roomIdList = new ArrayList<>();

        // 예약 가능한 객실 ID 리스트 조회
//        List<Integer> canReserveList = reservationService.canReserve()

        return null;
    }
}
