<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>자주묻는질문</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />
</head>
<body class="board faq">
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
            <a href="/login/auth" class="site-header__auth-link">로그인/회원가입</a>

            <button class="nav__menu-btn" aria-label="메뉴 열기" aria-controls="menu" aria-expanded="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
                    <path d="M2 4h16v2H2V4zM2 14h16v2H2v-2zM18 9H2v2h16V9z" fill=""></path>
                </svg>
            </button>

            <div class="nav__content-wrap guest" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/login/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/">고객센터</a></li>
                </ul>
            </div>

            <div class="nav__content-wrap user" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/login/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/">고객센터</a></li>
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
              <a href="/login/auth.html" class="auth-link">로그인/회원가입</a>
            </div>
            <ul class="nav__menu-lists">
              <li><a href="/">국내숙소</a></li>
              <li><a href="/">고객센터</a></li>
            </ul>
          </div>

          <div class="nav__content-wrap user" id="menu">
            <div class="guest-panel">
              <a href="/login/auth.html" class="auth-link">로그인/회원가입</a>
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

<main>
    <section aria-labelledby="faq-title">
        <h1 id="faq-title" class="faq-title">자주 묻는 질문</h1>

        <ul class="accordion" role="region" aria-labelledby="faq-title">
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq1" id="accordion-header-1">
                    <span>Q</span>
                    예약을 취소하고 싶어요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq1" role="region" class="accordion-panel" aria-labelledby="accordion-header-1">
                    <p>예약취소는 앱/웹 > 내정보 > 예약/구매내역에서 직접 가능합니다. 예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불 처리됩니다. 일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니 이 경우에는 고객행복센터로 요청해 주시길 바랍니다.</p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq2" id="accordion-header-2">
                    <span>Q</span>
                    천재지변/감염병으로 인한 예약취소는 어떻게 하나요?
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq2" role="region" class="accordion-panel" aria-labelledby="accordion-header-2">
                    <p>
                        천재지변(기상악화), 법정 감염병 등 불가항력적인 사유로 제휴점 이용이 불가할 경우 고객행복센터로 예약내역 및 증빙서류(결항확인서, e-티켓, 진단확인서 등)를 보내주시면 확인 후 예약취소 가능 여부를 확인해 드립니다. 다만, 당사는 판매 중개 플랫폼의 입장으로 제휴점에 대하여 취소/환불을 강제할 수 없어 각 제휴점의 규정에 근거하여 상황에 따라 수수료가 발생하거나 취소가 어려울 수 있는 점 양해 부탁드립니다.
                        <strong>[접수방법]</strong>
                        - 이메일 : help@yeogi.com (예약자명, 예약번호, 숙소명, 체크인 날짜 필수) - 카카오톡 : 카카오톡 내 플러스 친구 > 여기어때 고객행복센터 추가
                    </p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq3" id="accordion-header-3">
                    <span>Q</span>
                    예약대기 건 예약취소하고 싶어요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq3" role="region" class="accordion-panel" aria-labelledby="accordion-header-3">
                    <p>예약 대기중에는 여기어때 고객행복센터에 예약취소 요청해주시길 바랍니다. 단, 예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.</p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq4" id="accordion-header-4">
                    <span>Q</span>
                    체크인날짜/객실타입을 변경하고 싶어요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq4" role="region" class="accordion-panel" aria-labelledby="accordion-header-4">
                    <p>예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다. 예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용 부탁드립니다. 만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다.</p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq5" id="accordion-header-5">
                    <span>Q</span>
                    현금영수증 발급받고 싶어요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq5" role="region" class="accordion-panel" aria-labelledby="accordion-header-5">
                    <p>
                        현금영수증은 현금성 결제수단으로 결제 시 발급이 가능합니다. 결제 단계에서 현금영수증을 신청하면 자동으로 발행되지만, 신청을 누락했거나 발행받지 못한 경우라면 영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다. [네이버페이] - 결제 단계에서 현금영수증 신청하면 자동으로 발행 (19년 12월 26일 시행) - 자진발급 : 네이버페이 > 결제내역 > 주문건 > 주문상세정보 > 영수증 발급내역 > 현금영수증 확인 - 단, 19년 12월 26일 10시 이전 결제 건은 여기어때 고객행복센터로 요청 [간편계좌이체
                        / TOSS / PAYCO] - 결제 단계에서 현금영수증 신청하면 자동으로 발행 - 단, 간편계좌이체의 경우 신청 누락 시 여기어때 고객행복센터로 요청 [카카오페이] - 카카오페이머니 결제 시 자동으로 발행 - 자진발급 : 카카오톡 > pay > 우측톱니바퀴(나의 카카오페이) > 이용내역 > 결제 > 개별 상세내역 > 현금영수증 확인
                    </p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq6" id="accordion-header-6">
                    <span>Q</span>
                    상품을 결제했는데 이용 횟수가 올라가지 않아요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq6" role="region" class="accordion-panel" aria-labelledby="accordion-header-6">
                    <p>실 결제금액 5만원 이상의 상품을 구매하고 이용 완료까지 하셔야 이용 횟수가 올라가요. 더불어, 이용 횟수 반영까지 최대 3일 정도 소요될 수 있어요.</p>
                </div>
            </li>
            <li class="accordion-item">
                <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq7" id="accordion-header-7">
                    <span>Q</span>
                    영수증/거래내역서 발급받고 싶어요.
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                </button>

                <div id="faq7" role="region" class="accordion-panel" aria-labelledby="accordion-header-7">
                    <p>
                        예약 정보와 결제 정보가 기재되어 있는 영수증 또는 거래내역서는 아래의 경로를 통하여 발급받으실 수 있습니다.
                        <strong>■ 영수증</strong>
                        - 여기어때 App > 내 정보 > 예약 내역 > 예약 상세 화면 내 결제 증빙 보기 선택 > 영수증 보기 ※ 네이버페이 결제 시 결제사 페이지에서 확인 가능
                        <strong>■ 거래내역서</strong>
                        - 여기어때 App > 내 정보 > 예약 내역 > 예약 상세 화면 내 결제 증빙 보기 선택 > 거래내역서 받기 > 수령할 메일 주소 입력 후 발송 ※ 소득 증빙 자료로 사용 불가하며(단순 거래 확인 용도이며 법적 효력 없음) ※ 예약 완료(이용 확정), 이용 완료, 예약 취소 건에 대해서 발송 가능(예약 실패, 예약 대기 발송 불가)
                    </p>
                </div>
            </li>
        </ul>
    </section>
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
                        <a href="https://business.yeogi.com" target="_blank">기업 출장/복지 서비스 문의</a>
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
            (주)여기어때컴퍼니
            <br />
            주소: 서울특별시 강남구 봉은사로 479, 11층 | 대표이사: 정명훈 | 사업자등록번호: 742-86-00224
            <br />
            이메일: help@yeogi.com | 통신판매번호: 2017-서울강남-01779
        </address>
        <p>
            <a href="/policy/terms#TERMS" target="_blank">이용약관</a>
            <a href="/policy/terms#PRIVACY_POLICY" target="_blank">개인정보처리방침</a>

            <a href="/policy/terms#CONSUMER_DISPUTE_RESOLUTION_STANDARD" target="_blank">소비자 분쟁해결 기준</a>
        </p>
    </section>
</footer>

<script>
    const buttons = document.querySelectorAll(".accordion-trigger");

    buttons.forEach((btn) => {
        btn.addEventListener("click", () => {
            const panel = document.getElementById(btn.getAttribute("aria-controls"));
            const isExpanded = btn.getAttribute("aria-expanded") === "true";

            if (isExpanded) {
                // 닫기
                btn.setAttribute("aria-expanded", "false");
                panel.style.height = panel.scrollHeight + "px";
                requestAnimationFrame(() => {
                    panel.style.height = "0";
                });
            } else {
                // 열기
                btn.setAttribute("aria-expanded", "true");
                panel.style.height = panel.scrollHeight + "px";

                panel.addEventListener(
                    "transitionend",
                    function handler() {
                        panel.style.height = "auto";
                        panel.removeEventListener("transitionend", handler);
                    }
                );
            }
        });
    });
</script>
</body>
</html>
