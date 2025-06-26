<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .acc-card {
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            cursor: pointer;
            margin-bottom: 20px;
            background-color: #fff;
            transition: box-shadow 0.2s;
        }

        .acc-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .acc-thumb {
            width: 200px;
            height: 150px;
            object-fit: cover;
        }

        .acc-info {
            padding: 15px;
            flex: 1;
        }

        .acc-title {
            font-size: 18px;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .acc-location,
        .acc-score,
        .acc-price {
            font-size: 14px;
            margin: 5px 0;
        }

        .acc-price del {
            color: gray;
            margin-right: 5px;
        }

        .acc-price strong {
            color: #e60023;
        }

        .acc-checkin {
            font-size: 13px;
            color: #888;
            margin-bottom: 4px;
        }

        .acc-note {
            padding: 6px 10px;
            font-size: 13px;
            color: #666;
            background-color: #f9f9f9;
            border-top: 1px solid #eee;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }
    </style>
</head>

<body class="acc">
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
                    <li><a href="/board">고객센터</a></li>
                </ul>
            </div>

            <div class="nav__content-wrap user" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/board">고객센터</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<%
    String region = request.getParameter("region");
%>

<% if ("jeju".equals(region)) { %>
<div class="acc-card" onclick="location.href='/acc/jeju/1'">
    <img src="https://image.goodchoice.kr/resize_492x328/affiliate/2022/07/05/62c388d531a5f.jpg" alt="숙소 이미지" class="acc-thumb">
    <div class="acc-info">
        <h3 class="acc-title">제주호텔더엠</h3>
        <p class="acc-location">서귀포시, 올래시장 도보 5분</p>
        <p class="acc-score">⭐ 8.5 / 1,350명 평가</p>
        <p class="acc-price"><del>350,000원</del> → <strong>60,000원</strong></p>
    </div>
</div>

<div class="acc-card" onclick="location.href='/acc/jeju/2'">
    <img src="https://image.goodchoice.kr/resize_792x480/affiliate/2025/06/04/684009ead7eab.jpg" alt="숙소 이미지" class="acc-thumb">
    <div class="acc-info">
        <h3 class="acc-title">신화관 제주신화월드 호텔앤리조트</h3>
        <p class="acc-location">서귀포시, 신화테마파크&신화워터파크 도보 3분</p>
        <p class="acc-score">⭐ 9.4 / 1,750명 평가</p>
        <p class="acc-price"><del>169,000원</del> → <strong>158,860원</strong></p>
    </div>
</div>
<% }
else if ("seoul".equals(region)) { %>
<div class="acc-card" onclick="location.href='/acc/seoul/1'">
    <img src="https://image.goodchoice.kr/resize_792x480/adimg_new/895/215496/e9e6c915d863b2f30d51805c2e81cc81.jpg" alt="숙소 이미지" class="acc-thumb">
    <div class="acc-info">
        <h3 class="acc-title">길동 MARI-마리</h3>
        <p class="acc-location">길동역 도보 3분</p>
        <p class="acc-score">⭐ 9.3 / 4,040명 평가</p>
        <p class="acc-price"><strong>40,000원</strong></p>
    </div>
</div>

<!-- 숙소 카드 복수개 만들고 싶으면 위 div 복붙 -->
<div class="acc-card" onclick="location.href='/acc/seoul/2'">
    <img src="https://image.goodchoice.kr/resize_792x480/adimg_new/49461/8046/17a48e6759fbbd5e0db7f5195d52db07.jpg" alt="숙소 이미지" class="acc-thumb">
    <div class="acc-info">
        <h3 class="acc-title">건데 호텔 더디자이너스 프리미어 성수&건대</h3>
        <p class="acc-location">어린이대공원(세종대)역 도보 10분</p>
        <p class="acc-score">⭐ 9.3 / 5,294명 평가</p>
        <p class="acc-checkin">숙박 20:00 체크인</p>
        <p class="acc-price">쿠폰 적용시 <strong>75,500원</strong></p>
    </div>

    <div class="acc-note">
        20층 일레븐라운지 오픈!
    </div>
</div>
<% } %>

</body>
</html>
