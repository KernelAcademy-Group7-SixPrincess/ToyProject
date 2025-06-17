const navBtn = document.querySelector(".nav__menu-btn");
const guestNavMenu = document.querySelector(".nav__content-wrap.guest");

navBtn.addEventListener("click", () => {
    guestNavMenu.hidden = !guestNavMenu.hidden;
});