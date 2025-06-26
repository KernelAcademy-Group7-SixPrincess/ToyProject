package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.service.AccService;
import org.spring.example.room.service.RoomService;
import org.spring.example.search.dto.SearchDto;
import org.spring.example.reservation.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class SearchController {
    private final SearchService searchService;

    @GetMapping("/search")
    public String search(@ModelAttribute SearchDto searchDto, Model model) {
        log.info(searchDto.toString());
        List<Acc> accList = searchService.findAccBySearchDto(searchDto);
        log.info("accList={}", accList);
        model.addAttribute("accList", accList);
        model.addAttribute("searchDto", searchDto);
        return "search/search";
    }
}
