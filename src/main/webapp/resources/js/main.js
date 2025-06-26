const navBtn = document.querySelector(".nav__menu-btn");
const guestNavMenu = document.querySelector(".nav__content-wrap.guest");
let fp;

// 홈 화면 진입 시 자동으로 검색창에 날짜 세팅
document.addEventListener("DOMContentLoaded", function() {
    // 오늘 / 내일 Date 객체 준비
    const today    = new Date();
    const tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);
    // 인원 추가 버튼
    const minusBtn = document.querySelector('.guest-btn.minus');
    const plusBtn  = document.querySelector('.guest-btn.plus');
    const countTxt = document.querySelector('.guest-count-text');
    const hiddenIn = document.getElementById('guests-count-input');
    let count = parseInt(countTxt.textContent, 10);

     fp = flatpickr("#date-range", {
        locale: flatpickr.l10ns.ko,
        mode: "range",
        dateFormat: "m.d(D)",
        minDate: "today",
        defaultDate: [ today, tomorrow ],  // <-- 오늘·내일 자동 세팅
        allowInput: false
    });


    minusBtn.addEventListener('click', () => {
        if (count > 1) count--;
        countTxt.textContent = count;
        hiddenIn.value = count;
    });
    plusBtn.addEventListener('click', () => {
        count++;
        countTxt.textContent = count;
        hiddenIn.value = count;
    });
});

navBtn.addEventListener("click", () => {
    guestNavMenu.hidden = !guestNavMenu.hidden;
});

const accordionBtn = document.querySelectorAll(".accordion-trigger");

accordionBtn.forEach((btn) => {
    btn.addEventListener("click", () => {
        const panel = document.getElementById(btn.getAttribute("aria-controls"));
        const isExpanded = btn.getAttribute("aria-expanded") === "true";
        const accordionIcon = btn.querySelector(".accordion-icon");

        if (isExpanded) {
            // 닫기
            btn.setAttribute("aria-expanded", "false");
            panel.style.height = panel.scrollHeight + "px";
            requestAnimationFrame(() => {
                panel.style.height = "0";
            });

            accordionIcon.classList.add("rotate");
        } else {
            // 열기
            btn.setAttribute("aria-expanded", "true");
            panel.style.height = panel.scrollHeight + "px";

            panel.addEventListener("transitionend", function handler() {
                panel.style.height = "auto";
                panel.removeEventListener("transitionend", handler);
            });

            accordionIcon.classList.remove("rotate");
        }
    });
});


function doSearch() {
    const keyword = document.getElementById("search-input").value.trim();

    // 날짜 (flatpickr 인스턴스에서)
    const dates = fp.selectedDates;
    let start="", end="";
    if (dates.length === 2) {
        start = fp.formatDate(dates[0], "Y-m-d");
        end   = fp.formatDate(dates[1], "Y-m-d");
    }

    const guests = document.getElementById("guests-count-input").value;

    // URL 조립
    const params = new URLSearchParams();
    if (keyword)   params.append("keyword", keyword);
    if (start)  params.append("checkIn", start);
    if (end)    params.append("checkOut", end);
    if (guests) params.append("guests", guests);

    // 리다이렉트
    window.location.href = "/search?" + params.toString();
}