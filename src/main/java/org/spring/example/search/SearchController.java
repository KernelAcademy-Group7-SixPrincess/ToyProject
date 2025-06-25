package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import org.spring.example.accommodation.service.AccService;
import org.spring.example.room.service.RoomService;
import org.spring.example.search.dto.SearchDto;
import org.spring.example.reservation.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class SearchController {
    private final RoomService roomService;
    private final AccService accService;
    private final ReservationService reservationService;


    @GetMapping("/search")
    public String search(
            @RequestParam String keyword,
            @RequestParam String checkDateInfo,
            @RequestParam int personal,
            @RequestParam(required = false) String sidoCode,
            Model model) {

        String[] dates = checkDateInfo.split(" ~ ");
        LocalDate checkIn = LocalDate.parse(dates[0]);
        LocalDate checkOut = LocalDate.parse(dates[1]);

        SearchDto searchDto = SearchDto.builder()
                .keyword(keyword).checkIn(checkIn).checkOut(checkOut).personal(personal).build();

        if(sidoCode != null) {
            searchDto.setSidoCode(sidoCode);
        }
        // 조건에 맞는 객실 필터링 후 ID 반환
        // 조건 : 인원수
        // 객실과 조인 후 인원 조건 필터링
        List<Integer> roomIdList = new ArrayList<>();

        // 예약 가능한 객실 ID 리스트 조회
//        List<Integer> canReserveList = reservationService.canReserve()


        return "search/search";
    }
}
