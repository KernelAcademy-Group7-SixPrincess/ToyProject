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

export const isEmailValid = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());

export const isPasswordValid = (password) => {
    const hasLetter = /[a-zA-Z]/.test(password);
    const hasNumber = /\d/.test(password);
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
    return password.length >= 8 && ((hasLetter && hasNumber) || (hasLetter && hasSpecial) || (hasNumber && hasSpecial));
};

export const isNicknameValid = (nickname) => /^[가-힣a-zA-Z0-9]{2,14}$/.test(nickname);

export const isBirthValid = (year, month, day) => year && month && day;

export const isPasswordMatch = (pw1, pw2) => pw1 === pw2;
