package org.spring.example.review;

import org.spring.example.review.service.ReviewBoardService;
import org.spring.example.review.service.ReviewReplyService;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;
import javax.servlet.http.*;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.*;
import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/review/board")
public class ReviewBoardController {
    // 로거 인스턴스 생성 (클래스당 하나씩 선언)
    private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);

    @Autowired
    ReviewBoardService reviewBoardService;
    @Autowired
    ReviewReplyService reviewReplyService;

    @PostMapping("/modify")
    public String modify(ReviewBoardDto reviewBoardDto,

                         RedirectAttributes rattr, Model m, HttpSession session) {
        reviewBoardDto.setUserId((Long) session.getAttribute("id"));
        try {
            if (reviewBoardService.modify(reviewBoardDto) != 1)
                throw new Exception("Modify failed.");


            rattr.addFlashAttribute("msg", "MOD_OK");
            // 성공 시, 목록 페이지로 리다이렉트
            return "redirect:/review/board/form";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(reviewBoardDto);

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
    public String remove(Long id,
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
            List<ReviewBoardDto> reviews;

            if (accId != null) {
                System.out.println("DEBUG: Filtering reviews by accId = " + accId);
                reviews = reviewBoardService.getReviewsByAccId(accId);
                for (ReviewBoardDto review : reviews) {
                    List<ReviewReplyDto> replies = reviewReplyService.selectAllRepliesByReviewId(review.getReviewId());
                    if (replies != null && !replies.isEmpty()) {
                        review.setReply(replies.get(0)); // 가장 첫 번째 답변만 연결
                        // review.setReplies(replies); // 이 줄은 제거되었습니다. 전체 댓글 리스트는 이제 설정하지 않습니다.
                    }
                    // else 블록도 제거되었습니다. 단일 'reply' 필드만 사용하므로 빈 리스트 설정이 필요 없습니다.
                }

            } else {
                System.out.println("DEBUG: Fetching all reviews (no accId provided).");
                reviews = reviewBoardService.getAll();
                for (ReviewBoardDto review : reviews) {
                    List<ReviewReplyDto> replies = reviewReplyService.selectAllRepliesByReviewId(review.getReviewId());
                    if (replies != null && !replies.isEmpty()) {
                        review.setReply(replies.get(0));

                    }

                }
            }

            System.out.println("DEBUG: Number of reviews fetched = " + (reviews != null ? reviews.size() : "null"));

            // 리뷰 출력 디버깅 (전체 댓글 리스트 출력 부분은 제거되었습니다)
            if (reviews != null) {
                for (ReviewBoardDto r : reviews) {
                    System.out.println("리뷰: " + r.getComment() + ", 평점: " + r.getRate() +
                            ", 작성일: " + r.getCreatedAt() + ", 리뷰 ID: " + r.getReviewId());
                    if (r.getReply() != null) { // 단일 reply 필드 확인
                        System.out.println("  대표 댓글 내용: " + r.getReply().getComments());
                    } else {
                        System.out.println("  대표 댓글이 없습니다.");
                    }
                }
            } else {
                System.out.println("DEBUG: 'reviews' list is null.");
            }

            // 랜덤 추출 (선택)
            // Collections.shuffle(reviews);
            // reviews = reviews.stream().limit(3).collect(Collectors.toList());

            // 모델에 리뷰 리스트 추가
            m.addAttribute("reviews", reviews);

            // 평균 평점과 리뷰어 수 계산
            if (reviews != null && !reviews.isEmpty()) {
                double avgRate = reviews.stream()
                        .mapToDouble(ReviewBoardDto::getRate)
                        .average()
                        .orElse(0.0);
                int reviewerCnt = reviews.size();

                DecimalFormat df = new DecimalFormat("#.#");
                df.setRoundingMode(RoundingMode.HALF_UP);
                String formattedAvgRate = df.format(avgRate);


                m.addAttribute("accAvgrate", formattedAvgRate);
                m.addAttribute("accReviewerCnt", reviewerCnt);
            } else {
                m.addAttribute("accAvgrate", "0.0");
                m.addAttribute("accReviewerCnt", 0);
            }

            // 오늘 자정 기준 시간
            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());

        } catch (Exception e) {
            logger.error("리뷰 목록 로딩 중 오류 발생", e);
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("reviews", Collections.emptyList());
        }

        return "review/reviewBoardForm";
    }
}
