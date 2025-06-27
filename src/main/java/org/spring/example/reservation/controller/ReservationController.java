package org.spring.example.reservation.controller;

import org.spring.example.reservation.ReservationService;
import org.spring.example.reservation.dto.ReservationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    // GET 요청: cart 페이지 보여주기
    @GetMapping("/cart")
    public String showCart(@RequestParam Long roomId, Model model) {
        // roomId로 필요한 정보를 조회해서 model에 담아야 함
        // 예를 들어, roomService가 있다고 가정
        // RoomDto room = roomService.findById(roomId);
        // model.addAttribute("room", room);

        // 현재 dto가 없으므로 빈 ReservationDto 생성해도 되고, 실제 예약 데이터가 있으면 넣기
        model.addAttribute("reservation", new ReservationDto());
        return "cart/index"; // 장바구니 JSP 뷰로 이동
    }

    // POST 요청: cart에서 예약 확인 화면으로 (예약정보 담긴 dto 받아서 처리)
    @PostMapping("/cart")
    public String goToCart(@ModelAttribute ReservationDto dto, Model model) {
        model.addAttribute("reservation", dto);
        return "cart/index"; // JSP로 장바구니 화면
    }

    @PostMapping("/confirm")
    public String confirmReservation(@ModelAttribute ReservationDto dto, HttpSession session) {
        Long userId = (Long) session.getAttribute("loginUserId");
        dto.setUserId(userId);
        dto.setStatusCodeId("STATUS");
        dto.setStatusCodeCode(1); // 예약 요청
        dto.setUsageStatusCodeId("USAGE_STATUS");
        dto.setUsageStatusCodeCode(1); // 체크인 전
        dto.setDate(LocalDateTime.now());
        reservationService.reserve(dto);
        return "redirect:/reservation/complete";
    }

    @GetMapping("/complete")
    public String completePage(Model model) {
//        List<ReservationDto> reservations = reservationService.getLatestReservations(userId); // 방금 예약한 리스트 조회
//        model.addAttribute("reservations", reservations);
        return "reservation/complete";
    }

    @GetMapping("/list")
    public String list(@SessionAttribute("loginUserId") Long userId, Model model) {
        model.addAttribute("reservations", reservationService.getReservationsByUser(userId));
        return "reservation/list";
    }
}
