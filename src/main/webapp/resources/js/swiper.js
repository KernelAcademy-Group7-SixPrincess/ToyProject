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