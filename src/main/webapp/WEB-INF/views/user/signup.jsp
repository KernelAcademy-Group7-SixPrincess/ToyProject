<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>회원가입 - 저기어때</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/login.css" />
</head>
<body class="signup">
<%@ include file="../common/header.jsp" %>


<main class="container">
    <section aria-labelledby="signup-heading" class="signup__title-wrap">
        <h2 class="signup_title heading_title">필수 정보 입력</h2>
        <p class="signup_desc">가입을 위해 필수 정보를 입력해 주세요.</p>
    </section>

    <form action="/user/signup" method="post" aria-labelledby="form-title">
        <fieldset>
            <legend class="visually-hidden" id="form-title">회원가입 폼</legend>
            <div class="form-group">
                <label for="name">
                    이름
                    <span aria-hidden="true" class="required"></span>
                </label>
                <input type="text" id="name" name="name" placeholder="이름 입력" required aria-required="true" />
                <span class="error_msg" role="alert" id="nameError">이름을 입력해주세요.</span>
            </div>

            <div class="form-group">
                <label for="email">
                    이메일
                    <span aria-hidden="true" class="required"></span>
                </label>
                <input type="email" id="email" name="email" placeholder="abc@gccompany.co.kr" required aria-required="true" />
                <span class="error_msg" role="alert" id="emailError">올바른 형식의 이메일 주소를 입력해주세요.</span>
            </div>

            <div class="form-group">
                <label for="password">
                    비밀번호
                    <span aria-hidden="true" class="required"></span>
                </label>
                <input type="password" id="password" name="password" placeholder="최소 8자 이상" required aria-required="true" minlength="8" />
                <span class="error_msg" id="passwordError">영문,숫자,특수문자 중 2가지 이상을 조합해주세요.</span>
            </div>

            <div class="form-group">
                <label for="confirmPassword">
                    비밀번호 확인
                    <span aria-hidden="true" class="required"></span>
                </label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="위 비밀번호와 동일하게 입력" required aria-required="true" />
                <span id="confirmPasswordError" class="error_msg">비밀번호가 일치하지 않습니다.</span>
            </div>

            <div class="form-group">
                <label for="phone">
                    휴대폰 번호
                    <span aria-hidden="true" class="required"></span>
                </label>
                <input type="text" id="phone" name="phone" placeholder="01012345678" required aria-required="true" />
                <span class="error_msg" id="phoneError">휴대폰 번호를 정확히 입력해주세요.</span>
            </div>

            <div class="form-group birth">
                <label for="birthDate">
                    생년월일
                    <span aria-hidden="true" class="required"></span>
                </label>
                <div class="birth-select">
                    <input type="date"
                           id="birthDate"
                           name="birth"
                           placeholder="연도-월-일"
                           required
                           min="1900-01-01"
                           class="custom-input" />
                </div>
                <span class="error_msg" id="birthDateError">생년월일을 올바르게 입력해주세요.</span>
            </div>


            <div class="form-group gender">
                <label for="gender">
                    성별
                    <span aria-hidden="true" class="required"></span>
                </label>
                <div class="radio-wrap">
                    <label for="genderFemale">
                        <input type="radio" id="genderFemale" name="gender" value="F" required aria-required="true" />
                        여자
                    </label>
                    <label for="genderMale">
                        <input type="radio" id="genderMale" name="gender" value="M" />
                        남자
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="job">
                    직업
                    <span aria-hidden="true" class="required"></span>
                </label>
                <select id="job" name="job" required aria-required="true">
                    <option value="">직업을 선택해주세요 (필수)</option>
                    <option value="무직">무직</option>
                    <option value="학생">학생</option>
                    <option value="자영업자">자영업자</option>
                    <option value="개발자">개발자</option>
                    <option value="기타">기타</option>
                </select>
                <span class="error_msg" id="jobError">직업을 선택해주세요.</span>
            </div>

            <div class="form-group nickname">
                <label for="nickname">
                    닉네임
                    <span aria-hidden="true" class="required"></span>
                </label>
                <div class="nickname-wrap">
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임 입력 (특수문자 불가)" required aria-required="true" />
                </div>
                <span class="error_msg" id="nicknameError">닉네임은 한글, 영문, 숫자 2~14자로 작성하세요.</span>
            </div>

            <button type="submit" class="submit_btn" disabled>확인</button>
        </fieldset>
    </form>
</main>


<%@ include file="../common/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="module" src="${pageContext.request.contextPath}/resources/js/auth-validation/validationUtils.js"></script>
<script type="module" src="${pageContext.request.contextPath}/resources/js/auth-validation/signupValidation.js"></script>

</body>
</html>
