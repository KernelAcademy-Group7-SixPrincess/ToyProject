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
    public String form(Model m, HttpServletRequest request) {


        try {

            List<ReviewBoardDto> list = reviewBoardService.getPage(new HashMap<>());
            m.addAttribute("review", list);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
        }

        return "review/reviewBoardForm";
    }

    @GetMapping("/listByAcc" )
    public String showReviewsByAccId(@RequestParam("accId") Long accId, Model model) {
        System.out.println("accId = " + accId);  // 로그 찍기
        List<ReviewBoardDto> reviews = reviewBoardService.getReviewsByAccId(accId);
        System.out.println("reviews.size() = " + reviews.size());  // 로그 찍기
        model.addAttribute("reviews", reviews);
        return "review/reviewBoardForm";
    }



    }