package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.search.dto.SearchDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

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

        String region = extractRegion(searchDto.getKeyword(), accList);
        model.addAttribute("region", region);

        model.addAttribute("accList", accList);
        model.addAttribute("searchDto", searchDto);
        return "search/search";
    }

    private String extractRegion(String keyword, List<Acc> accList) {
        if (keyword != null) {
            keyword = keyword.trim();
            if (keyword.contains("제주")) return "jeju";
            if (keyword.contains("서울")) return "seoul";
            if (keyword.contains("부산")) return "busan";
            if (keyword.contains("강원")) return "gangwon";
            if (keyword.contains("인천")) return "incheon";
            if (keyword.contains("경북")) return "gyeongbuk";
            if (keyword.contains("경남")) return "gyeongnam";
            if (keyword.contains("경기")) return "gyeonggi";
            if (keyword.contains("전남")) return "jeonnam";
            if (keyword.contains("대전")) return "daejeon";
        }

        // fallback: accList 주소에서 유추
        if (accList != null && !accList.isEmpty()) {
            String address = accList.get(0).getAddress();
            if (address != null) {
                if (address.contains("제주")) return "jeju";
                if (address.contains("서울")) return "seoul";
                if (address.contains("부산")) return "busan";
                if (address.contains("강원")) return "gangwon";
                if (address.contains("인천")) return "incheon";
                if (address.contains("경북")) return "gyeongbuk";
                if (address.contains("경남")) return "gyeongnam";
                if (address.contains("경기")) return "gyeonggi";
                if (address.contains("전남")) return "jeonnam";
                if (address.contains("대전")) return "daejeon";
            }
        }

        return ""; // 기본값 (없으면 /acc//10 문제 발생 가능)
    }
}
