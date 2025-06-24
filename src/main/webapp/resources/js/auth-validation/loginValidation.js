import { showError, clearError, isEmailValid } from "./validationUtils.js";

const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const loginBtn = document.querySelector(".submit_btn");

emailInput.addEventListener("input", () => {
    isEmailValid(emailInput.value) ? clearError(emailInput, "emailError") : showError(emailInput, "emailError", "올바른 이메일 형식이 아닙니다.");
    loginBtn.disabled = !validateLogin();
});

passwordInput.addEventListener("input", () => {
    if (passwordInput.value.length < 8) {
        showError(passwordInput, "passwordError", "비밀번호는 최소 8자 이상이어야 합니다.");
    } else {
        clearError(passwordInput, "passwordError");
    }
    loginBtn.disabled = !validateLogin();
});

const validateLogin = () => {
    const email = emailInput.value.trim();
    const password = passwordInput.value;
    return isEmailValid(email) && password.length >= 8;
};
