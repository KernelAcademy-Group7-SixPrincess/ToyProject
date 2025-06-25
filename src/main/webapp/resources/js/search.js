const minusBtn = document.querySelector('.guest-btn.minus');
const plusBtn  = document.querySelector('.guest-btn.plus');
const countTxt = document.querySelector('.guest-count-text');
let count = parseInt(countTxt.textContent, 10);

minusBtn.addEventListener('click', () => {
    if (count > 0) count--;
    countTxt.textContent = count;
});
plusBtn.addEventListener('click', () => {
    count++;
    countTxt.textContent = count;
});