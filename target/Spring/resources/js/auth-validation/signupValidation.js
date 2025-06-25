import {
    showError,
    clearError,
    isEmailValid,
    isPasswordValid,
    isNicknameValid,
    isBirthValid,
    isPasswordMatch,
    isNameValid, isPhoneValid,
    isJobValid,
} from "./validationUtils.js";

const submitBtn = document.querySelector(".submit_btn");
if (submitBtn) {
    submitBtn.disabled = true;
}

// 이메일 중복 확인으로 추가한 코드
let isEmailAvailable = false; // 이메일 중복 검사 결과 저장

const checkEmailDuplicate = async (email) => {
    try {
        const response = await fetch(`/user/check-email?email=${encodeURIComponent(email)}`);
        const text = await response.text();
        isEmailAvailable = text.trim() === "available";

        if (!isEmailAvailable) {
            showError(emailInput, "emailError", "이미 사용 중인 이메일입니다.");
        } else {
            clearError(emailInput, "emailError");
        }
    } catch (error) {
        console.error("이메일 중복 검사 실패:", error);
        showError(emailInput, "emailError", "이메일 확인 중 오류 발생");
        isEmailAvailable = false;
    }
    submitBtn.disabled = !validateAll();
};


const validateAll = () => {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const phone = document.getElementById("phone").value.trim();
    const birth = document.getElementById("birthDate").value.trim();
    const genderChecked = document.querySelector('input[name="gender"]:checked');
    const job = document.getElementById("job").value;
    const nickname = document.getElementById("nickname").value.trim();

    return isNameValid(name) && isEmailValid(email) && isEmailAvailable && isPasswordValid(password) && isPasswordMatch(password, confirmPassword) && isNicknameValid(nickname) && genderChecked !== null && isBirthValid(birth) && isJobValid(job);
};

const validateField = async (field) => {
    const value = field.value.trim();
    const id = field.id;

    if (id === "name") {
        isNameValid(value) ? clearError(field, "nameError") : showError(field, "nameError", "이름은 2~10자의 한글 또는 영문만 입력할 수 있습니다.");
    } else if (id === "email") {
        // isEmailValid(value) ? clearError(field, "emailError") : showError(field, "emailError", "올바른 이메일 주소를 입력해주세요.");
        // 이메일 중복확인으로 바꾼 코드
        if (isEmailValid(value)) {
            await checkEmailDuplicate(value);
        } else {
            showError(field, "emailError", "올바른 이메일 주소를 입력해주세요.");
            isEmailAvailable = false;
        }
    } else if (id === "password") {
        isPasswordValid(value) ? clearError(field, "passwordError") : showError(field, "passwordError", "영문, 숫자, 특수문자 중 2가지 이상 조합해주세요.");
    } else if (id === "confirmPassword") {
        isPasswordMatch(document.getElementById("password").value, value) ? clearError(field, "confirmPasswordError") : showError(field, "confirmPasswordError", "비밀번호가 일치하지 않습니다.");
    } else if (id === "phone") {
        isPhoneValid(value) ? clearError(field, "phoneError") : showError(field, "phoneError", "유효한 휴대폰 번호를 입력해주세요. (예: 01012345678)");
    } else if (id === "birthDate") {
        isBirthValid(value) ? clearError(field, "birthDateError") : showError(field, "birthDateError", "생년월일을 올바르게 입력해주세요.");
    } else if (id === "nickname") {
        isNicknameValid(value) ? clearError(field, "nicknameError") : showError(field, "nicknameError", "닉네임은 한글, 영문, 숫자 2~14자로 작성하세요.");
    } else if (id === "job") {
        isJobValid(value) ? clearError(field, "jobError") : showError(field, "jobError", "직업을 선택해주세요.");
    }
    submitBtn.disabled = !validateAll();
};

const emailInput = document.getElementById("email");

document.querySelectorAll("input").forEach((input) => {
    input.addEventListener("input", async () => {
        await validateField(input);
        submitBtn.disabled = !validateAll();
    });
    input.addEventListener("blur", () => validateField(input));
});

document.querySelectorAll("select, input[type=radio]").forEach((el) => {
    el.addEventListener("change", () => {
        submitBtn.disabled = !validateAll();
    });
});
