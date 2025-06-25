<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>저기어때</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/search.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</head>
<body>

<%@ include file="../common/header.jsp" %>

<main>
  <section id="search-page">
    <div class="filters-container">
      <section id="filter-category" class="filter-section">
        <h3 class="title">숙소유형</h3>
        <div id="filter-category-group" class="gc-radio-group"> <!-- 라디오 옵션 래퍼 -->
          <div class="gc-radio" role="radio" aria-checked="true" tabindex="0">  <!-- 전체 -->
            <button type="button" class="radio-btn"><div></div></button>
            <span class="radio-label">전체</span>
          </div>
          <div class="gc-radio" role="radio" aria-checked="false" tabindex="0">  <!-- 모텔 -->
            <button type="button" class="radio-btn"><div></div></button>
            <span class="radio-label">모텔</span>
          </div>
        </div>
      </section>
    </div>

    <div id="cards-container" class="cards-container">
      <header>전체 개수</header>
      <article id="card-54798" class="card">
        <img src="https://example.com/images/hotel1.jpg" alt="신화관 제주신화월드 호텔 앤 리조트" />
        <div class="card-content">
          <ul class="type-list">
            <li>5성급</li>
            <li>호텔·리조트</li>
          </ul>
          <h3>신화관 제주신화월드 호텔 앤 리조트</h3>
          <p class="details">서귀포시 • 신화테마파크 & 신화워터파크 도보 3분</p>
          <div class="price-section">
            <span class="price">₩159,500</span>
          </div>
        </div>
      </article>

      <article id="card-48099" class="card">
        <img src="https://example.com/images/hotel2.jpg" alt="랜딩관 제주신화월드 호텔 앤 리조트" />
        <div class="card-content">
          <ul class="type-list">
            <li>5성급</li>
            <li>호텔·리조트</li>
          </ul>
          <h3>랜딩관 제주신화월드 호텔 앤 리조트</h3>
          <p class="details">서귀포시 • 신화테마파크 & 신화워터파크 도보 3분</p>
          <div class="price-section">
            <span class="price">₩113,800</span>
          </div>
        </div>
      </article>
    </div>
  </section>
</main>

<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/swiper.js"></script>
</body>
</html>
