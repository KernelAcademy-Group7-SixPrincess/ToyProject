<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>저기어때</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/search.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- flatpickr CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/calendar.css" />

  <!-- flatpickr JS -->
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <!-- 한글 locale 지원 -->
  <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>

</head>
<body>
<script>
  const contextPath = '${pageContext.request.contextPath}';
  const codeDtoList = "${codeDtoList}"
  // EL 치환된 실제 문자열
  const modelCheckIn  = "${searchDto.checkIn}";
  const modelCheckOut = "${searchDto.checkOut}";
  const currentCode = "${searchDto.code}";  // 현재 선택된 숙소 유형 코드 가져오기
</script>
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

    <div class="search-section" >
      <div class="search-inner" id="searchToggleBtn">
        <form role="search" class="search-form">

          <!-- 검색창 -->
          <div class="search-box-group">
            <div class="search-input-wrap">
              <label role="presentation" aria-label="Search Label" class="search-label">
                <div class="search-label-content">
                  <div class="search-icon-wrap">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                         xmlns="http://www.w3.org/2000/svg" class="search-icon">
                      <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M8.85 16.1a6.707 6.707 0 004.394-1.642l-.027.034 3.4 3.508L18 16.574l-3.47-3.58A7.163 7.163 0 0015.7 9.05C15.7 5.156 12.633 2 8.85 2 5.067 2 2 5.156 2 9.05c0 3.894 3.067 7.05 6.85 7.05zm0-1.99c2.695 0 4.88-2.263 4.88-5.055S11.545 4 8.85 4 3.97 6.263 3.97 9.055s2.185 5.055 4.88 5.055z"
                            fill="current"></path>
                    </svg>
                  </div>
                  <div class="search-input-field">
                    <input
                            name="search_term"
                            type="text"
                            placeholder="여행지나 숙소를 검색해보세요."
                            maxlength="50"
                            autocomplete="off"
                            autocapitalize="none"
                            autocorrect="off"
                            spellcheck="false"
                            class="input-keyword"
                            value="${searchDto.keyword}"
                    />
                  </div>
                </div>
              </label>
            </div>
          </div>

          <!-- 날짜 선택 버튼 -->
          <div class="date-picker-wrap">
            <input type="text" id="date-range" class="input-keyword" placeholder="날짜를 선택하세요" readonly>
          </div>

          <!-- 인원 선택 버튼 -->
          <div class="guest-count-wrap">
            <div class="guest-btn-wrap" tabindex="0" role="button">
              <div class="guest-display">
                <button type="button" class="guest-btn minus">–</button>
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                     xmlns="http://www.w3.org/2000/svg" class="guest-icon">
                  <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M10 9a3 3 0 10.002-6.001A3 3 0 0010 9zm-6.997 6.025C2.996 11.512 7.483 10 10 10c2.558 0 7.007 1.563 6.995 4.993 0 .058.002.104.003.146l.002.109c.004 1.06-.853 1.746-1.762 1.749-.602.004-5.232.002-5.232.002s-3.87.009-5.206-.001c-1.335-.01-1.796-1.13-1.8-1.692l.002-.188v-.093z"
                        fill="currentColor"></path>
                </svg>
                <span class="guest-label">인원</span>
                <span class="guest-count-text">${searchDto.guests}</span>
                <button type="button" class="guest-btn plus">+</button>
              </div>
            </div>
          </div>

          <!-- 검색 버튼 -->
          <div class="submit-btn-wrap">
            <button class="submit-btn" type="button">
              <span>검색</span>
            </button>
          </div>

        </form>
      </div>
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
  </nav>
</header>

<main>
  <section id="search-page">
    <div class="filters-container">
      <section id="filter-category" class="filter-section">
        <h3 class="title">숙소유형</h3>
        <div id="filter-category-group" class="gc-radio-group">
          <c:forEach var="c" items="${codeDtoList}" varStatus="st">
            <div class="gc-radio" role="radio" aria-checked="${c.code == searchDto.code}"
                 tabindex="0"
                 data-type-id="ACCOMMODATION_TYPE" data-value="${c.code}"
                 onclick="applyTypeFilter(${c.code})"
                 style="cursor:pointer;">
              <button type="button" class="radio-btn" aria-pressed="${c.code == searchDto.code}"></button>
              <span class="radio-label">${c.codeName}</span>
            </div>
          </c:forEach>

          <!-- 전체 보기 옵션 추가 (code 파라미터 제거용) -->
          <div class="gc-radio" role="radio"
               aria-checked="${empty searchDto.code}"
               tabindex="0"
               onclick="clearTypeFilter()"
               style="cursor:pointer; margin-top:10px;">
            <button type="button" class="radio-btn"
                    aria-pressed="${empty searchDto.code}"></button>
            <span class="radio-label">전체</span>
          </div>
        </div>
<%--        <div id="filter-category-group" class="gc-radio-group"> <!-- 라디오 옵션 래퍼 -->--%>
<%--          <div class="gc-radio" role="radio" aria-checked="true" tabindex="0">  <!-- 전체 -->--%>
<%--            <button type="button" class="radio-btn"><div></div></button>--%>
<%--            <span class="radio-label">전체</span>--%>
<%--          </div>--%>
<%--          <div class="gc-radio" role="radio" aria-checked="false" tabindex="0">  <!-- 모텔 -->--%>
<%--            <button type="button" class="radio-btn"></button>--%>
<%--            <span class="radio-label">모텔</span>--%>
<%--          </div>--%>
<%--        </div>--%>
      </section>
    </div>

    <div id="cards-container" class="cards-container">
      <header><h3 class="title">전체 개수 : ${fn:length(accList)}개</h3></header>
      <c:forEach var="acc" items="${accList}">
        <article id="card-${acc.accId}" class="card" onclick="location.href='/acc/${region}/${acc.accId}'" style="cursor:pointer;">
          <img src="${acc.mainImageUrl}" alt="${acc.name}" />
          <div class="card-content">
            <ul class="type-list">
              <li>${acc.gradeCodeName}</li>
              <li>${acc.typeCodeName}</li>
            </ul>
            <h3>${acc.name}</h3>
            <p class="details">${acc.address}</p>
<%--            <div class="price-section">--%>
<%--              <span class="price">₩${acc.priceString}</span>--%>
<%--            </div>--%>
          </div>
        </article>
      </c:forEach>
    </div>
  </section>
</main>

<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/swiper.js"></script>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const today    = new Date();
    const tomorrow = new Date(today.getTime() + 864e5);
    const defaultDates = (modelCheckIn && modelCheckOut)
            ? [ new Date(modelCheckIn), new Date(modelCheckOut) ]
            : [ today, tomorrow ];

    flatpickr("#date-range", {
      locale: flatpickr.l10ns.ko,
      mode: "range",
      dateFormat: "Y-m-d",      // 내부 value 포맷 (e.g. 2025-06-26 ~ 2025-06-27)
      altInput: true,           // 화면용 input 켬
      altFormat: "m.d(D)",      // 화면 표시 포맷 – 구분자 제외
      dateRangeSeparator: " ~ ",// 화면에서 start⋯end 사이에 이 문자열 삽입
      minDate: "today",
      defaultDate: defaultDates,
      allowInput: false
    });
  });

  function applyTypeFilter(code) {
    console.log("applyTypeFilter 호출, code:", code);
    const baseUrl = window.location.origin + window.location.pathname;
    const params = new URLSearchParams(window.location.search);
    params.set('code', code);
    const newUrl = baseUrl + '?' + params.toString();
    console.log("이동할 URL:", newUrl);
    window.location.href = newUrl;
  }

  function clearTypeFilter() {
    console.log("clearTypeFilter 호출");
    const baseUrl = window.location.origin + window.location.pathname;
    const params = new URLSearchParams(window.location.search);
    params.delete('code');
    const newUrl = baseUrl + '?' + params.toString();
    console.log("이동할 URL:", newUrl);
    window.location.href = newUrl;
  }

</script>

</body>
</html>
