<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>저기어때</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/cart.css" />
</head>

<body class="cart-page">

<%@ include file="../common/header.jsp" %>

<main class="cart-container">
  <h2 class="cart-title" id="cart-title">장바구니</h2>
  <form id="cartForm" aria-labelledby="cart-title">
    <nav class="cart-controls" aria-label="장바구니 선택 및 삭제">
      <label for="selectAll">
        <input type="checkbox" id="selectAll" />
        전체선택
      </label>
      <button type="button" id="deleteSelected" class="delete-selected">선택삭제</button>
    </nav>
    <section class="cart-list" aria-label="장바구니 목록" role="list">
      <!-- 샘플 아이템 1 -->
      <article class="cart-item" role="listitem">
        <input type="checkbox" class="item-check" id="cart-check-1" aria-label="신화관 제주신화월드 호텔앤리조트 선택" />
        <a href="/pages/jeju-accommodations.html" class="item-thumb-wrapper" aria-label="신화관 제주신화월드 호텔앤리조트 상세보기">
          <img
                  class="item-thumb"
                  alt="신화관 제주신화월드 호텔앤리조트"
                  sizes="100vw"
                  srcset="http://image.goodchoice.kr/resize_792x480/affiliate/2025/06/04/684009ead7eab.jpg 340w, http://image.goodchoice.kr/resize_792x480/affiliate/2025/06/04/684009ead7eab.jpg 912w, http://image.goodchoice.kr/resize_792x480/affiliate/2025/06/04/684009ead7eab.jpg 1200w"
                  src="http://image.goodchoice.kr/resize_792x480/affiliate/2025/06/04/684009ead7eab.jpg"
                  decoding="async"
                  data-nimg="fill"
                  class="thumbnail-image"
          />
          <span class="item-thumb-overlay" aria-hidden="true"></span>
        </a>
        <div class="item-content">
          <button type="button" class="item-delete" aria-label="신화관 제주신화월드 호텔앤리조트 삭제">✕</button>
          <header class="item-info">
            <p class="item-category">블랙 · 5성급 · 호텔</p>
            <h3 class="item-name"><a href="/pages/jeju-accommodations.html" tabindex="0">신화관 제주신화월드 호텔앤리조트</a></h3>
            <p class="item-location">
              <span class="item-region">서귀포시</span>
              <span class="item-location-detail">신화테마파크 & 신화워터파크 도보 3분</span>
            </p>
          </header>
          <hr class="item-divider" />
          <dl class="item-reserve-info">
            <dt class="sr-only">객실</dt>
            <dd class="item-room">1 x Twin Standard Room</dd>
            <dt class="sr-only">예약일</dt>
            <dd class="item-detail">2025년 1월 1일 - 2025년 1월 2일</dd>
            <dt class="sr-only">투숙객</dt>
            <dd class="item-detail">투숙객: 성인 2명</dd>
          </dl>
          <div class="item-pricebox">
            <strong class="item-price" aria-label="가격">204,732원</strong>
          </div>
        </div>
      </article>
      <!-- 샘플 아이템 2 -->
      <article class="cart-item" role="listitem">
        <input type="checkbox" class="item-check" id="cart-check-2" aria-label="랜딩관 제주신화월드 호텔앤리조트 선택" />
        <a href="/pages/jeju-accommodations.html" class="item-thumb-wrapper" aria-label="랜딩관 제주신화월드 호텔앤리조트 상세보기">
          <img
                  class="item-thumb"
                  alt="랜딩관 제주신화월드 호텔앤리조트"
                  sizes="100vw"
                  srcset="http://image.goodchoice.kr/resize_792x480/affiliate/2022/04/19/625e6aac20ccd.jpg 340w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/04/19/625e6aac20ccd.jpg 912w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/04/19/625e6aac20ccd.jpg 1200w"
                  src="http://image.goodchoice.kr/resize_792x480/affiliate/2022/04/19/625e6aac20ccd.jpg"
                  decoding="async"
                  data-nimg="fill"
                  class="thumbnail-image"
          />
          <span class="item-thumb-overlay" aria-hidden="true"></span>
        </a>
        <div class="item-content">
          <button type="button" class="item-delete" aria-label="랜딩관 제주신화월드 호텔앤리조트 삭제">✕</button>
          <header class="item-info">
            <p class="item-category">블랙 · 5성급 · 호텔</p>
            <h3 class="item-name"><a href="/pages/jeju-accommodations.html" tabindex="0">랜딩관 제주신화월드 호텔앤리조트</a></h3>
            <p class="item-location">
              <span class="item-region">서귀포시</span>
              <span class="item-location-detail">신화테마파크 & 신화워터파크 도보 3분</span>
            </p>
          </header>
          <hr class="item-divider" />
          <dl class="item-reserve-info">
            <dt class="sr-only">객실</dt>
            <dd class="item-room">1 x Twin Standard Room</dd>
            <dt class="sr-only">예약일</dt>
            <dd class="item-detail">2025년 1월 1일 - 2025년 1월 2일</dd>
            <dt class="sr-only">투숙객</dt>
            <dd class="item-detail">투숙객: 성인 2명</dd>
          </dl>
          <div class="item-pricebox">
            <strong class="item-price" aria-label="가격">148,896원</strong>
          </div>
        </div>
      </article>
      <!-- 샘플 아이템 3 -->
      <article class="cart-item" role="listitem">
        <input type="checkbox" class="item-check" id="cart-check-3" aria-label="제주호텔더엠 선택" />
        <a href="/pages/jeju-accommodations.html" class="item-thumb-wrapper" aria-label="제주호텔더엠 상세보기">
          <img class="item-thumb" alt="제주호텔더엠" sizes="100vw" srcset="http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 340w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 912w, http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg 1200w" src="http://image.goodchoice.kr/resize_792x480/affiliate/2022/07/05/62c388d531a5f.jpg" decoding="async" data-nimg="fill" class="thumbnail-image" />
          <span class="item-thumb-overlay" aria-hidden="true"></span>
        </a>
        <div class="item-content">
          <button type="button" class="item-delete" aria-label="제주호텔더엠 삭제">✕</button>
          <header class="item-info">
            <p class="item-category">비즈니스 · 호텔</p>
            <h3 class="item-name"><a href="/pages/jeju-accommodations.html" tabindex="0">제주호텔더엠</a></h3>
            <p class="item-location">
              <span class="item-region">서귀포시</span>
              <span class="item-location-detail">올래시장 도보 5분</span>
            </p>
          </header>
          <hr class="item-divider" />
          <dl class="item-reserve-info">
            <dt class="sr-only">객실</dt>
            <dd class="item-room">1 x Twin Standard Room</dd>
            <dt class="sr-only">예약일</dt>
            <dd class="item-detail">2025년 1월 1일 - 2025년 1월 2일</dd>
            <dt class="sr-only">투숙객</dt>
            <dd class="item-detail">투숙객: 성인 2명</dd>
          </dl>
          <div class="item-pricebox">
            <strong class="item-price" aria-label="가격">140,000원</strong>
          </div>
        </div>
      </article>
    </section>
    <div class="cart-summary">
      <div class="summary-label">총 결제금액</div>
      <div class="summary-total" id="totalPrice">0원</div>
    </div>
    <button type="submit" class="cart-pay-btn">선택 상품 결제하기</button>
  </form>
</main>

<%@ include file="../common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</body>
</html>