package org.spring.example.search;

import lombok.RequiredArgsConstructor;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.search.dto.SearchDto;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class SearchApiController {
    private final SearchService searchService;

    @GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Acc> searchAjax(SearchDto searchDto) {
        return searchService.findAccBySearchDto(searchDto);
    }
}
