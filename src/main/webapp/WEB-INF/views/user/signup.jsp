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
<header class="site-header">
    <nav class="nav" aria-label="메인 메뉴">
        <div class="nav__logo">
            <a href="/" class="nav__logo-link" aria-label="홈으로 이동">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 106 18" class="logo-svg" role="img" aria-hidden="true" focusable="false">
                    <title>사이트 로고</title>
                    <path
                            d="M94.8 18V6.7c0-.4-.3-.8-.8-.8-.4 0-.8.3-.8.8V18h-5.1V5.9C88.1 2.6 90.8 0 94 0s5.9 2.6 5.9 5.9V18h-5.1zm-9.5-5.1h1.8V18H76.9c-2.3 0-4.1-1.8-4.1-4.1V4.1c0-2.3 1.8-4.1 4.1-4.1h10.2v5.1h-1.8v7.8zm-4.5 0V5.1H79c-.6 0-1 .5-1 1v5.7c0 .6.5 1 1 1l1.8.1zM19.4 3.3v-.7c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-3.3h-3.5c-1.6 2-4.1 3.3-6.9 3.3C4 18 0 14 0 9s4-9 8.9-9c2.8 0 5.3 1.3 6.9 3.3h3.6zM17.8 8c0 .3.1.7.1 1s0 .7-.1 1h1.6V8h-1.6zm-8.9 5.1c2.3 0 4.1-1.8 4.1-4.1s-1.8-4.1-4.1-4.1S4.8 6.7 4.8 9s1.9 4.1 4.1 4.1zM38.3 1.2c.7.7 1.2 1.8 1.2 2.9V18h-5.1V6.2c0-.6-.5-1-1-1h-5.6c-1.4 0-2.5-1.2-2.5-2.6S26.4 0 27.8 0h7.6c1.1 0 2.2.5 2.9 1.2zM43.1 0c1.4 0 2.5 1.2 2.5 2.6V18h-5.1V2.6c0-1.4 1.1-2.6 2.6-2.6zm23.1 6.4V2.6c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-6.4h-1.9c-1.1 3.7-4.5 6.4-8.5 6.4-4.9 0-8.9-4-8.9-9s4-9 8.9-9c4 0 7.4 2.7 8.5 6.4h2zm-10.4 6.7c2.3 0 4.1-1.8 4.1-4.1S58 4.9 55.8 4.9 51.7 6.7 51.7 9s1.8 4.1 4.1 4.1zm47.6 4.9c-1.4 0-2.5-1.2-2.5-2.6s1.1-2.6 2.5-2.6 2.5 1.2 2.5 2.6-1.1 2.6-2.5 2.6z"
                            fill=""
                    ></path>
                </svg>
            </a>
        </div>

        <div class="nav__actions guest">
            <a href="/user/auth" class="site-header__auth-link">로그인/회원가입</a>

            <button class="nav__menu-btn" aria-label="메뉴 열기" aria-controls="menu" aria-expanded="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
                    <path d="M2 4h16v2H2V4zM2 14h16v2H2v-2zM18 9H2v2h16V9z" fill=""></path>
                </svg>
            </button>

            <div class="nav__content-wrap guest" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/notice">공지사항</a></li>
                    <li><a href="/faq">자주묻는질문</a></li>
                    <li><a href="/qna">고객문의</a></li>
                </ul>
            </div>

            <div class="nav__content-wrap user" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/notice">공지사항</a></li>
                    <li><a href="/faq">자주묻는질문</a></li>
                    <li><a href="/qna">고객문의</a></li>
                </ul>
            </div>
        </div>

        <!--
        <div class="nav__actions user">
          <a href="/login/auth.html" class="">
            <div class="user__name-wrap">
              <img alt="프로필 이미지" srcset="https://www.yeogi.com/_next/image?url=https%3A%2F%2Fimage.goodchoice.kr%2Fprofile%2Fico%2Fico_21.png&w=64&q=75, https://www.yeogi.com/_next/image?url=https%3A%2F%2Fimage.goodchoice.kr%2Fprofile%2Fico%2Fico_21.png&w=64&q=75" src="https://www.yeogi.com/_next/image?url=https%3A%2F%2Fimage.goodchoice.kr%2Fprofile%2Fico%2Fico_21.png&w=64&q=75" width="26" height="26" decoding="async" data-nimg="1" loading="lazy" style="color: transparent" />
              <h2 class="nickname">고구마달랭이</h2>
            </div>
          </a>
          <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
            <path d="M2 4h16v2H2V4zM2 14h16v2H2v-2zM18 9H2v2h16V9z" fill=""></path>
          </svg>

          <div class="nav__content-wrap guest" id="menu" hidden>
            <div class="guest-panel">
              <a href="/login/auth" class="auth-link">로그인/회원가입</a>
            </div>
            <ul class="nav__menu-lists">
                <li><a href="/">국내숙소</a></li>
                <li><a href="/notice">공지사항</a></li>
                <li><a href="/faq">자주묻는질문</a></li>
                <li><a href="/qna">고객문의</a></li>
            </ul>
          </div>

          <div class="nav__content-wrap user" id="menu">
            <div class="guest-panel">
              <a href="/login/auth" class="auth-link">로그인/회원가입</a>
            </div>
            <ul class="nav__menu-lists">
              <li><a href="/">국내숙소</a></li>
              <li><a href="/">고객센터</a></li>
            </ul>
          </div>
        </div>
        -->
    </nav>
</header>

<main class="container">
    <section aria-labelledby="signup-heading" class="signup__title-wrap">
        <h2 class="signup_title heading_title">필수 정보 입력</h2>
        <p class="signup_desc">가입을 위해 필수 정보를 입력해 주세요.</p>
    </section>

    <form action="/user/signup" method="post" aria-labelledby="form-title">
        <fieldset>
            <legend class="visually-hidden" id="form-title">회원가입 폼</legend>

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

            <div class="form-group birth">
                <label for="birthYear">
                    생년월일
                    <span aria-hidden="true" class="required"></span>
                </label>
                <div class="birth-select">
                    <select id="birthYear" name="birthYear" required aria-label="년" aria-required="true">
                        <option value="">년도</option>
                    </select>
                    <select id="birthMonth" name="birthMonth" required aria-label="월" aria-required="true">
                        <option value="">월</option>
                    </select>
                    <select id="birthDay" name="birthDay" required aria-label="일" aria-required="true">
                        <option value="">일</option>
                    </select>
                </div>
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

<footer>
    <section class="footer-container">
        <section class="footer-left">
            <h2>고객센터</h2>
            <p>고객행복센터(전화): 오전 9시 ~ 새벽 3시 운영</p>
            <p>카카오톡 문의: 24시간 운영</p>
            <button type="button">📞 1670-6250</button>
            <button type="button">💬 카카오 문의</button>
        </section>

        <nav class="footer-right" aria-label="사이트 링크">
            <section class="footer-section">
                <h3>회사</h3>
                <ul>
                    <li>
                        <a href="https://gccompany.co.kr" target="_blank">회사소개</a>
                    </li>
                </ul>
            </section>
            <section class="footer-section">
                <h3>서비스</h3>
                <ul>
                    <li><a href="/notice">공지사항</a></li>
                    <li><a href="/faq">자주 묻는 질문</a></li>
                    <li>
                        <a href="https://business.yeogi.com" target="_blank"
                        >기업 출장/복지 서비스 문의</a
                        >
                    </li>
                </ul>
            </section>
            <section class="footer-section">
                <h3>모든 여행</h3>
                <ul>
                    <li><a href="/notice">국내숙소</a></li>
                </ul>
            </section>
        </nav>
    </section>

    <section class="footer-bottom">
        <address>
            (주)여기어때컴퍼니<br />
            주소: 서울특별시 강남구 봉은사로 479, 11층 | 대표이사: 정명훈 |
            사업자등록번호: 742-86-00224<br />
            이메일: help@yeogi.com | 통신판매번호: 2017-서울강남-01779
        </address>
        <p>
            <a href="/policy/terms#TERMS" target="_blank">이용약관</a>
            <a href="/policy/terms#PRIVACY_POLICY" target="_blank"
            >개인정보처리방침</a
            >

            <a
                    href="/policy/terms#CONSUMER_DISPUTE_RESOLUTION_STANDARD"
                    target="_blank"
            >소비자 분쟁해결 기준</a
            >
        </p>
    </section>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/signupValidation.js"></script>
</body>
</html>
