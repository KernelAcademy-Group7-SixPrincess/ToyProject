package org.spring.example.review;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;
import javax.servlet.http.*;
import java.math.BigInteger;
import java.time.*;
import java.util.*;

@Controller
@RequestMapping("/review/board")
public class ReviewBoardController {
    @Autowired
    ReviewBoardService reviewBoardService;

    @PostMapping("/modify")
    public String modify(ReviewBoardDto reviewBoardDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {
      reviewBoardDto.setUserId((BigInteger) session.getAttribute("id"));
        try {
            if (reviewBoardService.modify(reviewBoardDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "MOD_OK");
            return "review/reviewBoardForm";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(reviewBoardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("msg", "MOD_ERR");
            return "review/reviewBoardForm"; // 등록하려던 내용을 보여줘야 함.
        }
    }



    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "review/reviewBoardForm";
    }

    @PostMapping("/write") // insert니까 delete인 remove하고 동일
    public String write(ReviewBoardDto reviewBoardDto, RedirectAttributes rattr, Model m, HttpSession session) {
        BigInteger id = (BigInteger)session.getAttribute("id");
        try {
            if (reviewBoardService.write(reviewBoardDto) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "review/reviewBoardForm";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new"); // 글쓰기 모드로
            m.addAttribute(reviewBoardDto);      // 등록하려던 내용을 보여줘야 함.
            m.addAttribute("msg", "WRT_ERR");
            return "review/reviewBoardForm";
        }
    }

    @GetMapping("/read")
    public String read(BigInteger id, Integer page, Integer pageSize, RedirectAttributes rattr, Model m) {
        try {
            ReviewBoardDto reviewBoardDto = reviewBoardService.read(id);
            m.addAttribute(reviewBoardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "review/reviewBoardForm";
        }

        return "review/reviewBoardForm";
    }

    @PostMapping("/remove")

    public String remove( BigInteger id, Integer page, Integer pageSize, RedirectAttributes rattr, HttpSession session) {
        BigInteger loggedInUserId = (BigInteger) session.getAttribute("id"); // "sessionId"보다는 "id"가 더 일반적입니다.
        if (loggedInUserId == null) {
            rattr.addFlashAttribute("msg", "NOT_LOGGED_IN");
            return "redirect:/login/login"; // 로그인 페이지로 리다이렉트
        }

        String msg = "DEL_OK";

        try {
            if(reviewBoardService.remove(id,loggedInUserId)!=1)
                throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addAttribute("page", page);
        rattr.addAttribute("pageSize", pageSize);
        rattr.addFlashAttribute("msg", msg);
        return "review/reviewBoardForm";
    }

    @GetMapping("/form")
    public String list(@RequestParam(defaultValue ="1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,Model m, HttpServletRequest request) {
     //       if(!loginCheck(request))
     //       return "redirect:/login/login?toURL="+request.getRequestURI(); // 로그인을 안했으면 로그인 화면으로 이동

        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int totalCnt = reviewBoardService.getCount();
            m.addAttribute("totalCnt", totalCnt);

            // --- 수정된 부분: PageHandler 생성 전에 page와 pageSize 유효성 검사 및 조정 ---
            // (page-1)과 naviSize는 PageHandler 내부에서 처리되므로 여기서는 단순히 page와 pageSize 값만 조정
            if(page < 1) page = 1; // 페이지는 1보다 작을 수 없습니다.
            // PageHandler가 totalPage를 계산할 것이므로 여기서는 굳이 totalPage를 넘는지 검사할 필요 없음.
            // 최대 페이지를 넘어가는 값은 PageHandler 내부에서 endPage를 통해 자연스럽게 처리됩니다.

            if(pageSize < 1 || pageSize > 50) pageSize = 10; // pageSize는 1-50 범위로 제한

            // 유효성이 검증된 page와 pageSize로 PageHandler를 생성합니다.
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            // --- 여기서 다시 한번 page의 유효성 재검사 (선택 사항이지만 안전을 위해) ---
            // 만약 요청된 page가 실제 totalPage를 초과할 경우, 첫 페이지로 강제 이동합니다.
            if (page > pageHandler.getTotalPage() && pageHandler.getTotalPage() > 0) {
                page = pageHandler.getTotalPage(); // 마지막 페이지로 이동
                // 또는 page = 1; // 첫 페이지로 이동
                // 이 경우, page가 변경되었으니 PageHandler를 다시 생성해주는 것이 완벽합니다.
                pageHandler = new PageHandler(totalCnt, page, pageSize);
            } else if (pageHandler.getTotalPage() == 0 && totalCnt > 0) {
                // 게시물이 있는데 totalPage가 0인 경우는 PageHandler 계산 오류이므로 이 로직은 불필요하지만
                // 혹시 모를 상황에 대비하여.
                page = 1;
                pageHandler = new PageHandler(totalCnt, page, pageSize);
            } else if (totalCnt == 0) {
                page = 1; // 게시물이 없으면 1페이지
            }


            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

            List<ReviewBoardDto> list = reviewBoardService.getPage(map);
            m.addAttribute("review", list);
            m.addAttribute("ph", pageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }

        return "review/reviewBoardForm"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = request.getSession(false);
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session!=null && session.getAttribute("id")!=null;
    }
}
