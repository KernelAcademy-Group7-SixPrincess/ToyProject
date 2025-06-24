import { showError, clearError, isEmailValid, isPasswordValid, isNicknameValid, isBirthValid, isPasswordMatch } from "./validationUtils.js";

const yearSelect = document.getElementById("birthYear");
const monthSelect = document.getElementById("birthMonth");
const daySelect = document.getElementById("birthDay");
const submitBtn = document.querySelector(".submit_btn");
if (submitBtn) {
    submitBtn.disabled = true;
}

const currentYear = new Date().getFullYear();
for (let y = currentYear; y >= currentYear - 100; y--) {
    yearSelect.append(new Option(`${y}년`, y));
}
for (let m = 1; m <= 12; m++) {
    monthSelect.append(new Option(`${m}월`, m));
}
for (let d = 1; d <= 31; d++) {
    daySelect.append(new Option(`${d}일`, d));
}

const validateAll = () => {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const nickname = document.getElementById("nickname").value.trim();
    const genderChecked = document.querySelector('input[name="gender"]:checked');
    const year = yearSelect.value;
    const month = monthSelect.value;
    const day = daySelect.value;

    return isEmailValid(email) && isPasswordValid(password) && isPasswordMatch(password, confirmPassword) && isNicknameValid(nickname) && genderChecked !== null && isBirthValid(year, month, day);
};

const validateField = (field) => {
    const value = field.value.trim();
    const id = field.id;

    if (id === "email") {
        isEmailValid(value) ? clearError(field, "emailError") : showError(field, "emailError", "올바른 이메일 주소를 입력해주세요.");
    } else if (id === "password") {
        isPasswordValid(value) ? clearError(field, "passwordError") : showError(field, "passwordError", "영문, 숫자, 특수문자 중 2가지 이상 조합해주세요.");
    } else if (id === "confirmPassword") {
        isPasswordMatch(document.getElementById("password").value, value) ? clearError(field, "confirmPasswordError") : showError(field, "confirmPasswordError", "비밀번호가 일치하지 않습니다.");
    } else if (id === "nickname") {
        isNicknameValid(value) ? clearError(field, "nicknameError") : showError(field, "nicknameError", "닉네임은 한글, 영문, 숫자 2~14자로 작성하세요.");
    }
};

document.querySelectorAll("input").forEach((input) => {
    input.addEventListener("input", () => {
        validateField(input);
        submitBtn.disabled = !validateAll();
    });
    input.addEventListener("blur", () => validateField(input));
});

document.querySelectorAll("select, input[type=radio]").forEach((el) => {
    el.addEventListener("change", () => {
        submitBtn.disabled = !validateAll();
    });
});
