<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>숙소 상세 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/acctest.css" />
</head>
<body class="">
<%@ include file="../common/header.jsp" %>


<main>
    <section class="gallery-section">
        <div class="gallery-container">
            <a href="#" class="gallery-main gallery-img-link">
                <img alt="전경" sizes="100vw" srcset="http://image.goodchoice.kr/resize_1280x1024/affiliate/2022/05/31/6295bf8c8d3f3.jpg 340w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2022/05/31/6295bf8c8d3f3.jpg 912w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2022/05/31/6295bf8c8d3f3.jpg 1200w" src="http://image.goodchoice.kr/resize_1280x1024/affiliate/2022/05/31/6295bf8c8d3f3.jpg" />
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="1">
                <img alt="전경" sizes="100vw" srcset="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391a86702.jpg 340w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391a86702.jpg 912w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391a86702.jpg 1200w" src="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391a86702.jpg" />
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="2">
                <img alt="리조트_마스터 스위트" sizes="100vw" srcset="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391cbea2f.jpg 340w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391cbea2f.jpg 912w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391cbea2f.jpg 1200w" src="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391cbea2f.jpg" />
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="3">
                <img alt="리조트_마스터 스위트" sizes="100vw" srcset="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391b8280c.jpg 340w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391b8280c.jpg 912w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391b8280c.jpg 1200w" src="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391b8280c.jpg" />
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="4">
                <img alt="리조트_마스터 스위트" sizes="100vw" srcset="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391dc3bad.jpg 340w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391dc3bad.jpg 912w, http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391dc3bad.jpg 1200w" src="http://image.goodchoice.kr/resize_1280x1024/affiliate/2025/05/30/6839391dc3bad.jpg" />
            </a>
        </div>
    </section>

    <!-- 갤러리 모달 -->
    <div id="galleryModal" class="modal" style="display: none">
        <div class="modal-backdrop"></div>
        <div class="modal-content">
            <button class="modal-close" aria-label="닫기">&times;</button>
            <img class="modal-img" src="" alt="갤러리 큰 이미지" />
        </div>
    </div>

    <section class="accom-header">
        <div class="accom-header-row">
            <div class="accom-category">Black · 호텔 · 5성급</div>
        </div>
        <div class="accom-title-row">
            <h1 class="accom-title">신화관 제주신화월드 호텔앤리조트</h1>
            <div class="accom-price">204,732원~</div>
        </div>
        <div class="accom-info-cards">
            <div class="accom-info-card accom-review">
                <div class="accom-card-title-row">
                    <span class="accom-card-title accom-review-title">1,753명 평가</span>
                    <span class="accom-card-arrow">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg" class="css-1hjsey4"><path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z" fill="current"></path></svg>
              </span>
                </div>
                <div class="accom-review-desc">🌴 제주 신화월드 신화관 숙박 리뷰 여유와 즐거움이 공존하는 신화월드 호캉스. 제주 여행을 여러 번 다녀봤...</div>
            </div>
            <div class="accom-info-card accom-facilities" id="facilityCard" tabindex="0" role="button" aria-label="모든 부대시설 보기" style="cursor: pointer">
                <div class="accom-card-title-row">
                    <span class="accom-card-title accom-facilities-title">서비스 및 부대시설</span>
                    <span class="accom-card-arrow">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg" class="css-1hjsey4"><path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z" fill="current"></path></svg>
              </span>
                </div>
                <div class="accom-facility-list">
                    <span>🏋️‍♂️ 피트니스</span>
                    <span>🏊‍♂️ 수영장</span>
                    <span>📶 무선인터넷</span>
                    <span>🛁 욕실용품</span>
                    <span>🍽️ 레스토랑</span>
                    <span>🚭 금연</span>
                </div>
            </div>
            <div class="accom-info-card accom-location">
                <div class="accom-card-title-row">
                    <span class="accom-card-title accom-location-title">위치 정보</span>
                    <span class="accom-card-arrow">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg" class="css-1hjsey4"><path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z" fill="current"></path></svg>
              </span>
                </div>
                <div class="accom-location-row">
                    <span>📍</span>
                    제주특별자치도 서귀포시 안덕면 서광리 산 24
                    <a href="#" class="accom-map-link">지도보기</a>
                </div>
            </div>
        </div>
    </section>

    <section class="room-card">
        <div class="room-card__img-wrap">
            <img alt="[숙박 페스타] [호텔] 슈페리어 빌리지 더블" srcset="http://image.goodchoice.kr/affiliate/2025/02/26/67be58902e40b.jpg 1x" src="http://image.goodchoice.kr/affiliate/2025/02/26/67be58902e40b.jpg" />
        </div>
        <div class="room-card__content">
            <header class="room-card__header">
                <h2 class="room-card__title">[호텔] 킹 스위트 빌리지 더블</h2>
                <button class="room-card__detail-btn" aria-label="상세 정보 보기" id="roomDetailBtn">
                    상세 정보
                    <svg width="18" height="18" viewBox="0 0 20 20" fill="#2584f7" xmlns="http://www.w3.org/2000/svg" class="css-1hjsey4"><path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z" fill="current"></path></svg>
                </button>
            </header>
            <div class="room-card__info-row">
                <ul class="room-card__info-list">
                    <li>
                        <span aria-hidden="true">🚫</span>
                        무료취소 불가
                    </li>
                    <li>
                        <span aria-hidden="true">⏰</span>
                        입실 15:00 · 퇴실 12:00
                    </li>
                </ul>
                <div class="room-card__price-box">
                    <span class="room-card__price-label">4% 쿠폰 적용가</span>
                    <span class="room-card__price-old">1,452,000원</span>
                    <span class="room-card__price">373,920원</span>
                    <button class="room-card__reserve-btn">객실 예약</button>
                </div>
            </div>
            <dl class="room-card__room-info">
                <dt>객실정보</dt>
                <dd>기준2인 · 최대3인 (유료)</dd>
            </dl>
        </div>
    </section>

    <!-- 시설 전체 모달 -->
    <div id="facilityModal" class="modal" style="display: none">
        <div class="modal-backdrop"></div>
        <div class="modal-content" style="padding: 32px 24px; min-width: 320px; max-width: 90vw">
            <button class="modal-close" aria-label="닫기" style="position: absolute; top: 16px; right: 18px; font-size: 2.2rem; color: #222; cursor: pointer; background: none; border: none; line-height: 1; padding: 0">&times;</button>
            <h2 style="font-size: 20px; font-weight: 700; margin-bottom: 18px">모든 부대시설</h2>
            <div class="facility-modal-list" style="display: flex; flex-wrap: wrap; gap: 14px 24px; font-size: 15px; color: #444">
                <span>🏋️‍♂️ 피트니스</span>
                <span>🏊‍♂️ 수영장</span>
                <span>📶 무선인터넷</span>
                <span>🛁 욕실용품</span>
                <span>🍽️ 레스토랑</span>
                <span>🚭 금연</span>
                <span>🧖‍♂️ 사우나</span>
                <span>🅿️ 무료주차</span>
                <span>🧺 세탁서비스</span>
            </div>
        </div>
    </div>

    <!-- 객실 상세정보 모달 -->
    <div id="roomDetailModal" class="modal" style="display: none">
        <div class="modal-backdrop"></div>
        <div class="modal-content">
            <h2>[숙박 페스타] [호텔] 슈페리어 빌리지 더블</h2>
            <div style="font-size: 14px; color: #e74c3c; font-weight: 600; margin-bottom: 8px">무료취소 불가</div>
            <hr />
            <div>
                <div class="modal-section-title">객실 정보</div>
                <div>
                    숙박 | 체크인 2025-06-25 - 체크아웃 2025-06-26
                    <br />
                    2인 기준 최대 3인
                    <br />
                    <br />
                    더블침대 1개
                    <br />
                    <br />
                    객실+욕실+발코니 / 14평
                </div>
                <hr />
            </div>
            <div>
                <div class="modal-section-title">숙소 이벤트</div>
                <div>해비치 #숙박페스타# 룸온리 특가 제공!</div>
            </div>
            <div>
                <div class="modal-section-title">추가패키지</div>
                <div>
                    최대 투숙 가능 인원까지 무료 투숙
                    <br />
                    식음 10% 할인
                </div>
            </div>
            <div>
                <div class="modal-section-title">편의시설</div>
                <div>TV, 냉장고, 티테이블, 의자, 전기포트, 헤어드라이기, 욕실용품, 욕조</div>
            </div>
            <div class="refund-section">
                <div class="modal-section-title">취소 및 환불 규정</div>
                <div>
                    <b>무료 취소</b>
                    <br />
                    체크인 기준 3일 전 23:59까지: 100% 환불
                    <br />
                    <br />
                    <b>부분 환불 가능</b>
                    <br />
                    체크인 기준 2일 전 23:59까지: 70% 환불
                    <br />
                    체크인 기준 1일 전 23:59까지: 50% 환불
                    <br />
                    <br />
                    <b class="refund-no">환불 불가</b>
                    <br />
                    체크인 당일 23:59까지 및 노쇼 시: 환불불가
                    <br />
                    <br />
                    <span>예약 후 10분 내 취소될 경우 전액 환불돼요. (체크인 시간 경과 후 제외)</span>
                </div>
            </div>
            <button class="modal-close" aria-label="닫기">&times;</button>
        </div>
    </div>
</main>

<%@ include file="../common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>
    // 갤러리 모달
    (function () {
        const galleryModal = document.getElementById("galleryModal");
        if (galleryModal) {
            document.querySelectorAll(".gallery-img-link").forEach((link) => {
                link.addEventListener("click", function (e) {
                    e.preventDefault();
                    const img = this.querySelector("img");
                    const modalImg = galleryModal.querySelector(".modal-img");
                    modalImg.src = img.src;
                    galleryModal.style.display = "flex";
                });
            });
            const closeBtn = galleryModal.querySelector(".modal-close");
            const backdrop = galleryModal.querySelector(".modal-backdrop");
            if (closeBtn)
                closeBtn.onclick = () => {
                    galleryModal.style.display = "none";
                };
            if (backdrop)
                backdrop.onclick = () => {
                    galleryModal.style.display = "none";
                };
        }
    })();

    // 시설 전체 모달
    (function () {
        const facilityModal = document.getElementById("facilityModal");
        const facilityCard = document.getElementById("facilityCard");
        if (facilityModal && facilityCard) {
            facilityCard.onclick = function () {
                facilityModal.style.display = "flex";
            };
            facilityCard.onkeydown = function (e) {
                if (e.key === "Enter" || e.key === " ") {
                    facilityModal.style.display = "flex";
                }
            };
            const closeBtn = facilityModal.querySelector(".modal-close");
            const backdrop = facilityModal.querySelector(".modal-backdrop");
            if (closeBtn)
                closeBtn.onclick = () => {
                    facilityModal.style.display = "none";
                };
            if (backdrop)
                backdrop.onclick = () => {
                    facilityModal.style.display = "none";
                };
        }
    })();

    // 객실 상세정보 모달
    (function () {
        const roomDetailModal = document.getElementById("roomDetailModal");
        const roomDetailBtn = document.getElementById("roomDetailBtn");
        if (roomDetailModal && roomDetailBtn) {
            roomDetailBtn.onclick = function () {
                roomDetailModal.style.display = "flex";
            };
            const closeBtn = roomDetailModal.querySelector(".modal-close");
            const backdrop = roomDetailModal.querySelector(".modal-backdrop");
            if (closeBtn)
                closeBtn.onclick = () => {
                    roomDetailModal.style.display = "none";
                };
            if (backdrop)
                backdrop.onclick = () => {
                    roomDetailModal.style.display = "none";
                };
        }
    })();
</script>
</body>
</html>
