const navBtn = document.querySelector(".nav__menu-btn");
const guestNavMenu = document.querySelector(".nav__content-wrap.guest");

navBtn.addEventListener("click", () => {
    guestNavMenu.hidden = !guestNavMenu.hidden;
});


const swiper = new Swiper(".swiper", {
    loop: true,
    slidesPerView: 6,
    slidesPerGroup: 6,
    spaceBetween: 24,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});

console.log(swiper)