<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li><a href="/board/notice">공지사항</a></li>
                    <li><a href="/board/faq">자주묻는질문</a></li>
                    <li><a href="/board/qna">고객문의</a></li>
                </ul>
            </div>

            <div class="nav__content-wrap user" id="menu" hidden>
                <div class="guest-panel">
                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>
                </div>
                <ul class="nav__menu-lists">
                    <li><a href="/">국내숙소</a></li>
                    <li><a href="/board/notice">공지사항</a></li>
                    <li><a href="/board/faq">자주묻는질문</a></li>
                    <li><a href="/board/qna">고객문의</a></li>
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

<main>
    <section aria-labelledby="faq-title">
        <h1 id="faq-title" class="faq-title board-title">자주 묻는 질문</h1>

        <form action="/board/faq" method="get">
            <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword != null ? keyword : ''}" />
            <button type="submit">검색</button>
        </form>

<%--        <c:if test="${isAdmin}">--%>
            <a href="/board/faq/write" class="write-btn" role="button">
                <span aria-hidden="true">✏️</span>
                <span>글쓰기</span>
            </a>
<%--        </c:if>--%>



        <ul class="accordion" role="region" aria-labelledby="faq-title">
            <c:forEach items="${normalPosts}" var="faq" varStatus="status">
                <li class="accordion-item">
                    <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq${status.index + 1}" id="accordion-header-${status.index + 1}">
                        <span>Q</span>
                        ${faq.title}
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                    </button>
                    <div id="faq${status.index + 1}" role="region" class="accordion-panel" aria-labelledby="accordion-header-${status.index + 1}">
                        <p class="markdown-content">${faq.content}</p>
                        <nav class="notice-actions" aria-label="글 조작 버튼">
                            <a href="/board/faq/${faq.postId}/edit" class="button">수정</a>
                            <form action="/board/faq/${faq.postId}/delete" method="post" onsubmit="return confirm('삭제할까요?')" style="display: inline">
                                <input type="hidden" name="id" value="3" />
                                <button type="submit" class="button danger">삭제</button>
                            </form>
                        </nav>
                    </div>
                </li>
            </c:forEach>
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

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        // 모든 faq 본문 <p> 태그들을 찾아서
        const faqAnswers = document.querySelectorAll(".accordion-panel > p");

        faqAnswers.forEach(p => {
            const rawText = p.innerText; // 마크다운 원문 (개행도 포함)
            const html = marked.parse(rawText); // 마크다운 → HTML 변환
            p.innerHTML = html; // 변환한 HTML로 대체
        });
    });
</script>
</body>
</html>
