package org.spring.example.review;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;
import javax.servlet.http.*;
import java.time.*;
import java.util.*;

@Controller
@RequestMapping("/review/board")
public class ReviewBoardController {
    @Autowired
    ReviewBoardService reviewBoardService;


    @PostMapping("/modify")
        public String modify(ReviewBoardDto reviewBoardDto,
                             // Integer page, Integer pageSize, // 페이지네이션 관련 인자 삭제
                             RedirectAttributes rattr, Model m, HttpSession session) {
            reviewBoardDto.setUserId((Long) session.getAttribute("id"));
            try {
                if (reviewBoardService.modify(reviewBoardDto)!= 1)
                    throw new Exception("Modify failed.");

                // rattr.addAttribute("page", page); // 페이지네이션 관련 인자 삭제
                // rattr.addAttribute("pageSize", pageSize); // 페이지네이션 관련 인자 삭제
                rattr.addFlashAttribute("msg", "MOD_OK");
                // 성공 시, 목록 페이지로 리다이렉트
                return "redirect:/review/board/form";
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute(reviewBoardDto);
                // m.addAttribute("page", page); // 페이지네이션 관련 인자 삭제
                // m.addAttribute("pageSize", pageSize); // 페이지네이션 관련 인자 삭제
                m.addAttribute("msg", "MOD_ERR");
                return "review/reviewBoardForm"; // 수정 실패 시, 수정하려던 내용을 다시 보여줌.
            }
        }


        @GetMapping("/create")
        public String create(Model m) {
            m.addAttribute("mode", "new");
            return "review/reviewBoardForm";
        }

        @PostMapping("/create") // insert니까 delete인 remove하고 동일
        public String create(ReviewBoardDto reviewBoardDto, RedirectAttributes rattr, Model m, HttpSession session) {
            reviewBoardDto.setUserId((Long) session.getAttribute("id")); // 작성자 ID 설정

            try {
                if (reviewBoardService.write(reviewBoardDto) != 1)
                    throw new Exception("Write failed.");

                rattr.addFlashAttribute("msg", "WRT_OK");
                // 작성 완료 후, 목록 페이지로 리다이렉트
                return "redirect:/review/board/form";
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("mode", "new"); // 글쓰기 모드로 유지
                m.addAttribute(reviewBoardDto);      // 등록하려던 내용을 보여줘야 함.
                m.addAttribute("msg", "WRT_ERR");
                return "review/reviewBoardForm";
            }
        }

        @GetMapping("/read")
        public String read(Long reviewId,
                           // Integer page, Integer pageSize, // 페이지네이션 관련 인자 삭제
                           RedirectAttributes rattr, Model m) {
            try {
                ReviewBoardDto reviewBoardDto = reviewBoardService.read(reviewId);
                m.addAttribute(reviewBoardDto);

            } catch (Exception e) {
                e.printStackTrace();

                rattr.addFlashAttribute("msg", "READ_ERR");

                return "redirect:/review/board/form";
            }
            return "review/reviewBoardForm";
        }

        @PostMapping("/remove")
        public String remove( Long id,
                              RedirectAttributes rattr, HttpSession session) {
            Long loggedInUserId = (Long) session.getAttribute("id");
            if (loggedInUserId == null) {
                rattr.addFlashAttribute("msg", "NOT_LOGGED_IN");
                return "redirect:/login/login"; // 로그인 페이지로 리다이렉트
            }

            String msg = "DEL_OK";
            try {
                if (reviewBoardService.remove(id, loggedInUserId) != 1)
                    throw new Exception("Delete failed.");
            } catch (Exception e) {
                e.printStackTrace();
                msg = "DEL_ERR";
            }


            rattr.addFlashAttribute("msg", msg);
            return "redirect:/review/board/form";
        }

    @GetMapping("/form")
    public String form(@RequestParam(value = "accId", required = false) Long accId, Model m) {
        try {
            List<ReviewBoardDto> reviews; // JSP와 통일된 이름 'reviews' 사용
            if (accId != null) {
                // accId가 있으면 특정 숙소의 리뷰를 가져옴
                System.out.println("DEBUG: Filtering reviews by accId = " + accId); // 디버그 로그 추가
                reviews = reviewBoardService.getReviewsByAccId(accId);
            } else {
                // accId가 없으면 모든 리뷰를 가져옴 (기존 로직)
                System.out.println("DEBUG: Fetching all reviews (no accId provided)."); // 디버그 로그 추가
                reviews = reviewBoardService.getPage(new HashMap<>()); // getPage는 모든 리뷰를 가져올 것으로 예상
            }
            System.out.println("DEBUG: Number of reviews fetched = " + reviews.size()); // 디버그 로그 추가

            m.addAttribute("reviews", reviews); // 모델에 'reviews'라는 이름으로 리스트 추가

            // 숙소의 평균 평점 및 리뷰어 수 정보를 가져와서 모델에 추가
            // (reviews 리스트가 비어있지 않다면 첫 번째 리뷰에서 정보를 가져옴)
            if (!reviews.isEmpty()) {
                ReviewBoardDto firstReview = reviews.get(0);
                m.addAttribute("accAvgrate", firstReview.getAccAvgrate());
                m.addAttribute("accReviewerCnt", firstReview.getAccReviewerCnt());
            } else {
                // 리뷰가 없을 경우 N/A, 0 등으로 표시될 수 있도록 기본값 설정 (선택 사항)
                m.addAttribute("accAvgrate", null); // 또는 0.0
                m.addAttribute("accReviewerCnt", 0);
            }


            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            // 오류 발생 시 빈 리스트를 넘겨서 JSP가 오류 처리하도록 할 수 있음
            m.addAttribute("reviews", Collections.emptyList());
        }

        return "review/reviewBoardForm";
    }

}