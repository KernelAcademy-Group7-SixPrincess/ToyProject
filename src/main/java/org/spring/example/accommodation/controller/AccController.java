package org.spring.example.accommodation.controller;

import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.service.AccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AccController {

    @Autowired
    private AccService accService;

    @GetMapping("/acclist")
    public String showAccByRegion(@RequestParam String region, Model model) {
        List<Acc> accList = accService.getByRegion(region);  // 전체 숙소 목록 조회
        model.addAttribute("accList", accList);       // JSP에서 필터링에 사용
        model.addAttribute("region", region);
        return "search/search";
    }

    @GetMapping("/acc/{region}/{accId}")
    public String getAccDetail(@PathVariable Long accId, Model model) {
        Acc acc = accService.getAccByIdWithRooms(accId);
        if (acc == null) {
            model.addAttribute("error", "숙소 정보를 불러올 수 없습니다.");
            return "errorPage";
        }

        // 문자열 포맷팅 처리
        acc.setAddPeopleInfoFormatted(formatWithBullet(acc.getAddPeopleInfo()));
        acc.setBreakfastInfoFormatted(formatWithBullet(acc.getBreakfastInfo()));
        acc.setCookInfoFormatted(formatWithBullet(acc.getCookInfo()));
        acc.setCancelRefundInfoFormatted(formatWithBullet(acc.getCancelRefundInfo()));
        acc.setEtcInfoFormatted(formatWithBullet(acc.getEtcInfo()));

        acc.setSubwayInfoFormatted(formatWithBullet(acc.getSubwayInfo()));
        acc.setRoomFacilityInfoFormatted(formatWithBullet(acc.getRoomFacilityInfo()));
        acc.setFrontFacilityInfoFormatted(formatWithBullet(acc.getFrontFacilityInfo()));
        acc.setParkingInfoFormatted(formatWithBullet(acc.getParkingInfo()));
        acc.setExtraNoticeFormatted(formatWithBullet(acc.getExtraNotice()));

        // boolean 체크 처리
        boolean hasExtraInfo =
                isNotEmpty(acc.getAddPeopleInfo()) ||
                        isNotEmpty(acc.getBreakfastInfo()) ||
                        isNotEmpty(acc.getCookInfo()) ||
                        isNotEmpty(acc.getCancelRefundInfo()) ||
                        isNotEmpty(acc.getEtcInfo());

        boolean hasFacilityInfo =
                isNotEmpty(acc.getSubwayInfo()) ||
                        isNotEmpty(acc.getRoomFacilityInfo()) ||
                        isNotEmpty(acc.getFrontFacilityInfo()) ||
                        isNotEmpty(acc.getParkingInfo()) ||
                        isNotEmpty(acc.getExtraNotice());

        model.addAttribute("acc", acc);
        model.addAttribute("hasExtraInfo", hasExtraInfo);
        model.addAttribute("hasFacilityInfo", hasFacilityInfo);

        return "accommodation/accinfo";
    }

    private boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }

    private String formatWithBullet(String input) {
        if (input == null || input.trim().isEmpty()) return "없음";

        String[] lines = input.split("\\n");
        StringBuilder sb = new StringBuilder();

        for (String line : lines) {
            line = line.trim();
            if (line.isEmpty()) continue;

            if (line.startsWith("[") || line.startsWith("<")) {
                sb.append("<br>").append(line);
            } else if (line.startsWith("(") || line.equalsIgnoreCase("null")) {
                sb.append("&nbsp;&nbsp;").append(line);
            } else {
                sb.append("&nbsp;&nbsp;⦁ ").append(line);
            }

            sb.append("<br>");
        }
        return sb.toString();
    }

}

