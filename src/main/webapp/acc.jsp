<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>저기어때</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
</head>

<body class="acc">
<header class="site-header">
    <nav class="nav" aria-label="메인 메뉴">
        <div class="nav__logo">
            <a href="/" class="nav__logo-link" aria-label="홈으로 이동">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 106 18" class="logo-svg" role="img"
                     aria-hidden="true" focusable="false">
                    <title>사이트 로고</title>
                    <path
                            d="M94.8 18V6.7c0-.4-.3-.8-.8-.8-.4 0-.8.3-.8.8V18h-5.1V5.9C88.1 2.6 90.8 0 94 0s5.9 2.6 5.9 5.9V18h-5.1zm-9.5-5.1h1.8V18H76.9c-2.3 0-4.1-1.8-4.1-4.1V4.1c0-2.3 1.8-4.1 4.1-4.1h10.2v5.1h-1.8v7.8zm-4.5 0V5.1H79c-.6 0-1 .5-1 1v5.7c0 .6.5 1 1 1l1.8.1zM19.4 3.3v-.7c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-3.3h-3.5c-1.6 2-4.1 3.3-6.9 3.3C4 18 0 14 0 9s4-9 8.9-9c2.8 0 5.3 1.3 6.9 3.3h3.6zM17.8 8c0 .3.1.7.1 1s0 .7-.1 1h1.6V8h-1.6zm-8.9 5.1c2.3 0 4.1-1.8 4.1-4.1s-1.8-4.1-4.1-4.1S4.8 6.7 4.8 9s1.9 4.1 4.1 4.1zM38.3 1.2c.7.7 1.2 1.8 1.2 2.9V18h-5.1V6.2c0-.6-.5-1-1-1h-5.6c-1.4 0-2.5-1.2-2.5-2.6S26.4 0 27.8 0h7.6c1.1 0 2.2.5 2.9 1.2zM43.1 0c1.4 0 2.5 1.2 2.5 2.6V18h-5.1V2.6c0-1.4 1.1-2.6 2.6-2.6zm23.1 6.4V2.6c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-6.4h-1.9c-1.1 3.7-4.5 6.4-8.5 6.4-4.9 0-8.9-4-8.9-9s4-9 8.9-9c4 0 7.4 2.7 8.5 6.4h2zm-10.4 6.7c2.3 0 4.1-1.8 4.1-4.1S58 4.9 55.8 4.9 51.7 6.7 51.7 9s1.8 4.1 4.1 4.1zm47.6 4.9c-1.4 0-2.5-1.2-2.5-2.6s1.1-2.6 2.5-2.6 2.5 1.2 2.5 2.6-1.1 2.6-2.5 2.6z"
                            fill=""
                    ></path>
                </svg>
            </a>
        </div>

        <div class="nav__search">
            <form class="search-form" action="/search" method="get">
                <input type="text" name="location" placeholder="제주도"/>
                <span class="search-divider">|</span>
                <input type="text" name="dates" value="06.21 토 - 06.22 일 (1박)" readonly/>
                <span class="search-divider">|</span>
                <input type="text" name="personal" value="인원 2" readonly/>
            </form>
        </div>

        <div class="nav__actions guest">
            <a href="/user/auth" class="site-header__auth-link">로그인/회원가입</a>

            <button class="nav__menu-btn" aria-label="메뉴 열기" aria-controls="menu" aria-expanded="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)"
                     xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
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
    <main class="acc-list-page">
        <section class="acc-list-page-section">
            <div class="acc-list">
                <a target="_blank" class="gc-thumbnail-type-seller-card css-vbesvf"
                   href="/domestic-accommodations/66005?checkIn=2025-06-21&amp;checkOut=2025-06-22&amp;personal=2">
                    <div class="css-gvoll6">
                        <div class="css-1oce7am">
                            <div class="css-1l3t175"><img alt="제주호텔더엠" sizes="100vw"
                                                          srcset="http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 340w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 912w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 1200w"
                                                          src="http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg"
                                                          decoding="async" data-nimg="fill"
                                                          class="thumbnail-image desktop:hover:bg-backgroundOverlayDarkInactive"
                                                          style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
                            </div>
                            <div class="css-1ng5wvu"></div>
                        </div>
                        <div class="css-1g90zg3">
                            <div class="css-b0qdn7">
                                <div class="css-1km0bek">
                                    <div>
                                        <div class="css-1j7tt62">
                                            <div class="css-8fn780">
                                                <ul class="css-bl7zf6">
                                                    <li>비즈니스</li>
                                                    <li>호텔</li>
                                                </ul>
                                                <h3 class="gc-thumbnail-type-seller-card-title css-bm6g3w">제주호텔더엠</h3>
                                            </div>
                                            <button type="button" aria-label="이 상품 저장하기" class="css-1phvvwd">
                                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg" class="css-6nxlm6">
                                                    <path d="M14.1 2c2.71-.01 4.893 2.347 4.9 4.708l-.013.095.013.181c-.1 5.031-7.235 10.135-7.945 10.692-.67.448-1.434.416-2.099 0l-.704-.538C6.241 15.575 1.066 11.244 1 6.984l.003-.188L1 6.708C1.083 3.997 3.404 2 5.95 2c1.634.003 2.985.878 4.051 2.257C11.067 2.875 12.433 2 14.1 2z"
                                                          fill="current"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="css-19li9i9"><span class="css-1rzfout">서귀포시</span><span
                                                class="css-ki0lqh">올래시장 도보 5분, 서귀포터미널 차량 12분</span></div>
                                        <div class="css-1ar2n2o">
                                            <div class="css-19f645y">
                                                <svg width="12" height="12" viewBox="0 0 20 20" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg" class="css-q6whag">
                                                    <path d="M14.229 12.1l.853 3.91c.06.502-.069.896-.386 1.18-.434.39-.958.352-1.294.21-.209-.114-1.343-.813-3.404-2.095-2.061 1.282-3.196 1.981-3.404 2.096-.336.14-.86.18-1.295-.211-.317-.284-.445-.678-.386-1.18l.853-3.91-.004-.003.001-.003c-1.817-1.651-2.806-2.56-2.965-2.724-.247-.267-.403-.786-.215-1.309.188-.523.671-.746.954-.78.19-.021 1.472-.146 3.848-.373H7.38c.965-2.358 1.49-3.621 1.576-3.791.128-.255.54-.617 1.042-.617s.864.332 1.018.573c.1.198.634 1.477 1.6 3.835 2.375.227 3.658.352 3.847.374.283.033.766.256.954.78.188.522.032 1.04-.215 1.308-.16.165-1.15 1.074-2.969 2.727l-.004.003z"
                                                          fill="current"></path>
                                                </svg>
                                                <span class="css-9ml4lz">8.5</span></div>
                                            <span class="css-oj6onp">1,350명 평가</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="css-sg6wi7">
                                <div>
                                    <div class="css-ukl1fa">
                                        <div class="css-1dzt3ch">
                                            <div class="css-xgwoxj">350,000원</div>
                                            <div class="css-yeouz0"><span class="css-1qdxuc0">60,000</span><span
                                                    class="css-1590nqn">원</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </section>
    </main>
</header>
