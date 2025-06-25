// const navBtn = document.querySelector(".nav__menu-btn");
// const guestNavMenu = document.querySelector(".nav__content-wrap.guest");
//
// navBtn.addEventListener("click", () => {
//     guestNavMenu.hidden = !guestNavMenu.hidden;
// });

const navBtn = document.querySelector(".nav__menu-btn");
if (navBtn) {
    navBtn.addEventListener("click", () => {
        const guestNavMenu = document.querySelector(".nav__content-wrap.guest");
        if (guestNavMenu) {
            guestNavMenu.hidden = !guestNavMenu.hidden;
        }
    });
}



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
