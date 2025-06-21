const yearSelect = document.getElementById("birthYear");
const monthSelect = document.getElementById("birthMonth");
const daySelect = document.getElementById("birthDay");
const submitBtn = document.querySelector(".submit_btn");

const currentYear = new Date().getFullYear();
for (let y = currentYear; y >= currentYear - 100; y--) {
    const option = document.createElement("option");
    option.value = y;
    option.textContent = y + "년";
    yearSelect.appendChild(option);
}
for (let m = 1; m <= 12; m++) {
    const option = document.createElement("option");
    option.value = m;
    option.textContent = m + "월";
    monthSelect.appendChild(option);
}
for (let d = 1; d <= 31; d++) {
    const option = document.createElement("option");
    option.value = d;
    option.textContent = d + "일";
    daySelect.appendChild(option);
}

const showError = (input, errorId, message) => {
    input.classList.add("error");
    const error = document.getElementById(errorId);
    if (error) {
        error.textContent = message;
        error.style.display = "block";
    }
};

const clearError = (input, errorId) => {
    input.classList.remove("error");
    const error = document.getElementById(errorId);
    if (error) {
        error.style.display = "none";
    }
};

const validateInputs = () => {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const nickname = document.getElementById("nickname").value.trim();
    const genderChecked = document.querySelector('input[name="gender"]:checked');
    const year = yearSelect.value;
    const month = monthSelect.value;
    const day = daySelect.value;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const nicknameRegex = /^[가-힣a-zA-Z0-9]{2,14}$/;

    const hasLetter = /[a-zA-Z]/.test(password);
    const hasNumber = /\d/.test(password);
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
    const passwordLengthOK = password.length >= 8;
    const passwordValid = passwordLengthOK && ((hasLetter && hasNumber) || (hasLetter && hasSpecial) || (hasNumber && hasSpecial));

    const isEmailValid = emailRegex.test(email);
    const isPasswordMatch = password === confirmPassword;
    const isNicknameValid = nicknameRegex.test(nickname);
    const isGenderValid = genderChecked !== null;
    const isBirthValid = year && month && day;

    console.log({
        isEmailValid,
        passwordValid,
        isPasswordMatch,
        isNicknameValid,
        isGenderValid,
        isBirthValid,
    });

    return isEmailValid && passwordValid && isPasswordMatch && isNicknameValid && isGenderValid && isBirthValid;
};

const validateSingleField = (field) => {
    const id = field.id;
    const value = field.value.trim();

    if (id === "email") {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!regex.test(value)) {
            showError(field, "emailError", "올바른 형식의 이메일 주소를 입력해주세요.");
        } else {
            clearError(field, "emailError");
        }
    }

    if (id === "password") {
        const hasLetter = /[a-zA-Z]/.test(value);
        const hasNumber = /\d/.test(value);
        const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(value);
        const passwordLengthOK = value.length >= 8;
        const passwordValid = passwordLengthOK && ((hasLetter && hasNumber) || (hasLetter && hasSpecial) || (hasNumber && hasSpecial));
        if (!passwordValid) {
            showError(field, "passwordError", "영문,숫자,특수문자 중 2가지 이상을 조합해주세요.");
        } else {
            clearError(field, "passwordError");
        }
    }

    if (id === "confirmPassword") {
        const pw = document.getElementById("password").value;
        if (pw !== value) {
            showError(field, "confirmPasswordError", "비밀번호가 일치하지 않습니다.");
        } else {
            clearError(field, "confirmPasswordError");
        }
    }

    if (id === "nickname") {
        const regex = /^[가-힣a-zA-Z0-9]{2,14}$/;
        if (!regex.test(value)) {
            showError(field, "nicknameError", "닉네임은 한글, 영문, 숫자 2~14자로 작성하세요.");
        } else {
            clearError(field, "nicknameError");
        }
    }
};

const inputs = document.querySelectorAll("input");
inputs.forEach((input) => {
    input.addEventListener("input", () => {
        validateSingleField(input);
        submitBtn.disabled = !validateInputs();
    });

    input.addEventListener("blur", () => validateSingleField(input));
});

const confirmPasswordInput = document.getElementById("confirmPassword");
confirmPasswordInput.addEventListener("input", () => {
    validateSingleField(confirmPasswordInput);
    submitBtn.disabled = !validateInputs();
});

const selects = document.querySelectorAll("select, input[type=radio]");
selects.forEach((el) => {
    el.addEventListener("change", () => {
        submitBtn.disabled = !validateInputs();
    });
});
