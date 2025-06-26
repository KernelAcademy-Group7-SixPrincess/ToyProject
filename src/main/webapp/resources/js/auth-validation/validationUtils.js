export const showError = (input, errorId, message) => {
    input.classList.add("error");
    const error = document.getElementById(errorId);
    if (error) {
        error.textContent = message;
        error.style.display = "block";
    }
};

export const clearError = (input, errorId) => {
    input.classList.remove("error");
    const error = document.getElementById(errorId);
    if (error) {
        error.style.display = "none";
    }
};

export const isNameValid = (name) => /^[가-힣a-zA-Z]{2,10}$/.test(name.trim());


export const isEmailValid = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());

export const isPasswordValid = (password) => {
    const hasLetter = /[a-zA-Z]/.test(password);
    const hasNumber = /\d/.test(password);
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
    return password.length >= 8 && ((hasLetter && hasNumber) || (hasLetter && hasSpecial) || (hasNumber && hasSpecial));
};

export const isPhoneValid = (phone) => {
    const trimmed = phone.trim();
    return /^01[016789]\d{7,8}$/.test(trimmed);
};

export const isNicknameValid = (nickname) => /^[가-힣a-zA-Z0-9]{2,14}$/.test(nickname);


export const isBirthValid = (dateString) => {
    if (!dateString) return false;

    const today = new Date();
    const inputDate = new Date(dateString);

    // 시간 제거 (날짜만 비교)
    today.setHours(0, 0, 0, 0);
    inputDate.setHours(0, 0, 0, 0);

    return inputDate <= today;
};

export const isPasswordMatch = (pw1, pw2) => pw1 === pw2;


export const isJobValid = (job) => {
    return job !== "";
};