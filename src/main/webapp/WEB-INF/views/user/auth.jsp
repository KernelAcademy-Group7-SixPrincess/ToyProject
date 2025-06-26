<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>로그인 - 저기어때</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/login.css" />
</head>
<body class="login">
<%@ include file="../common/header.jsp" %>


<main class="container">
    <header class="auth-logo">
        <h1 class="visually-hidden">서비스 이름</h1>
        <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 106 18"
                class="logo-svg"
                role="img"
                aria-label="서비스 로고"
        >
            <title>서비스 로고</title>
            <path
                    d="M94.8 18V6.7c0-.4-.3-.8-.8-.8-.4 0-.8.3-.8.8V18h-5.1V5.9C88.1 2.6 90.8 0 94 0s5.9 2.6 5.9 5.9V18h-5.1zm-9.5-5.1h1.8V18H76.9c-2.3 0-4.1-1.8-4.1-4.1V4.1c0-2.3 1.8-4.1 4.1-4.1h10.2v5.1h-1.8v7.8zm-4.5 0V5.1H79c-.6 0-1 .5-1 1v5.7c0 .6.5 1 1 1l1.8.1zM19.4 3.3v-.7c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-3.3h-3.5c-1.6 2-4.1 3.3-6.9 3.3C4 18 0 14 0 9s4-9 8.9-9c2.8 0 5.3 1.3 6.9 3.3h3.6zM17.8 8c0 .3.1.7.1 1s0 .7-.1 1h1.6V8h-1.6zm-8.9 5.1c2.3 0 4.1-1.8 4.1-4.1s-1.8-4.1-4.1-4.1S4.8 6.7 4.8 9s1.9 4.1 4.1 4.1zM38.3 1.2c.7.7 1.2 1.8 1.2 2.9V18h-5.1V6.2c0-.6-.5-1-1-1h-5.6c-1.4 0-2.5-1.2-2.5-2.6S26.4 0 27.8 0h7.6c1.1 0 2.2.5 2.9 1.2zM43.1 0c1.4 0 2.5 1.2 2.5 2.6V18h-5.1V2.6c0-1.4 1.1-2.6 2.6-2.6zm23.1 6.4V2.6c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-6.4h-1.9c-1.1 3.7-4.5 6.4-8.5 6.4-4.9 0-8.9-4-8.9-9s4-9 8.9-9c4 0 7.4 2.7 8.5 6.4h2zm-10.4 6.7c2.3 0 4.1-1.8 4.1-4.1S58 4.9 55.8 4.9 51.7 6.7 51.7 9s1.8 4.1 4.1 4.1zm47.6 4.9c-1.4 0-2.5-1.2-2.5-2.6s1.1-2.6 2.5-2.6 2.5 1.2 2.5 2.6-1.1 2.6-2.5 2.6z"
                    fill=""
            ></path>
        </svg>
    </header>

    <section aria-labelledby="login-heading" class="login__title-wrap">
        <h2 class="login__title">로그인/회원가입</h2>
    </section>

    <a href="/user/login" class="join_btn email_btn">
        <svg
                xmlns="http://www.w3.org/2000/svg"
                width="21"
                height="21"
                fill="none"
                viewBox="0 0 21 21"
        >
            <path
                    fill="#1273E4"
                    fill-rule="evenodd"
                    d="M10.99 9.441c.216-.112 2.65-1.483 7.303-4.11A2 2 0 0 0 16.5 4.216h-12a2 2 0 0 0-1.791 1.109l7.3 4.115c.293.163.652.171.981 0Zm7.51 4.776v-7.25c-4.05 2.279-6.29 3.537-6.72 3.776-.902.378-1.668.364-2.47.038-.32-.152-2.59-1.424-6.81-3.814v7.25a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2Z"
                    clip-rule="evenodd"
            ></path>
        </svg>
        이메일로 시작하기
    </a>
</main>


<%@ include file="../common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
