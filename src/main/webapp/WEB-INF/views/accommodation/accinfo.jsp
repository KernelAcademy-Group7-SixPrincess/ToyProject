<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/accinfo.css"/>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>--%>
</head>
<body class="accommodations">
<%@ include file="../common/header.jsp" %>

<main>
    <section class="gallery-section">
        <div class="gallery-container">
            <a href="#" class="gallery-main gallery-img-link">
                <img alt="${acc.name}" sizes="100vw"
                     srcset="${acc.mainImageUrl} 340w, ${acc.mainImageUrl} 912w, ${acc.mainImageUrl} 1200w"
                     src="${acc.mainImageUrl}"/>
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="1">
                <img alt="${acc.name}" sizes="100vw"
                     srcset="${acc.mainImageUrl} 340w, ${acc.mainImageUrl} 912w, ${acc.mainImageUrl} 1200w"
                     src="${acc.mainImageUrl}"/>
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="2">
                <img alt="${acc.name}" sizes="100vw"
                     srcset="${acc.mainImageUrl} 340w, ${acc.mainImageUrl} 912w, ${acc.mainImageUrl} 1200w"
                     src="${acc.mainImageUrl}"/>
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="3">
                <img alt="${acc.name}" sizes="100vw"
                     srcset="${acc.mainImageUrl} 340w, ${acc.mainImageUrl} 912w, ${acc.mainImageUrl} 1200w"
                     src="${acc.mainImageUrl}"/>
            </a>
            <a href="#" class="gallery-thumb gallery-img-link" data-idx="4">
                <img alt="${acc.name}" sizes="100vw"
                     srcset="${acc.mainImageUrl} 340w, ${acc.mainImageUrl} 912w, ${acc.mainImageUrl} 1200w"
                     src="${acc.mainImageUrl}"/>
            </a>
        </div>
    </section>

    <!-- 갤러리 모달 -->
    <div id="galleryModal" class="modal" style="display: none">
        <div class="modal-backdrop"></div>
        <div class="modal-content">
            <button class="modal-close" aria-label="닫기">&times;</button>
            <img class="modal-img" src="" alt="갤러리 큰 이미지"/>
        </div>
    </div>

    <section class="accom-header">
        <div class="accom-header-row">
            <div class="accom-category">Black · 호텔 · 5성급</div>
        </div>
        <div class="accom-title-row">
            <h1 class="accom-title">${acc.name}</h1>
            <div class="accom-price">204,732원~</div>
        </div>
        <div class="accom-info-cards">
            <div class="accom-info-card accom-review">
                <div class="accom-card-title-row">
                    <span class="accom-card-title accom-review-title">⭐ ${acc.avgrate}</span>
                    <span class="accom-card-title accom-review-title">${acc.reviewerCnt}명 평가</span>
                    <span class="accom-card-arrow">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg"
                     class="css-1hjsey4"><path
                        d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                        fill="current"></path></svg>
              </span>
                </div>
                <div class="accom-review-desc">${acc.accIntro}</div>
            </div>
            <div class="accom-info-card accom-facilities" id="facilityCard" tabindex="0" role="button"
                 aria-label="모든 부대시설 보기" style="cursor: pointer">
                <div class="accom-card-title-row">
                    <span class="accom-card-title accom-facilities-title">서비스 및 부대시설</span>
                    <span class="accom-card-arrow">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg"
                     class="css-1hjsey4"><path
                        d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                        fill="current"></path></svg>
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
                <svg width="18" height="18" viewBox="0 0 20 20" fill="" xmlns="http://www.w3.org/2000/svg"
                     class="css-1hjsey4"><path
                        d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                        fill="current"></path></svg>
              </span>
                </div>
                <div class="accom-location-row">
                    <span>📍</span>
                    ${acc.address}
                    <a href="#" class="accom-map-link">지도보기</a>
                </div>
            </div>
        </div>
    </section>

    <c:if test="${not empty acc.roomList}">
        <section class="room-section">
            <h2 class="acc-title">객실 선택</h2>

            <c:forEach var="room" items="${acc.roomList}">
                <section class="room-card">
                    <div class="room-card__img-wrap">
                        <img alt="${room.name}"
                             srcset="${room.mainImageUrl} 1x"
                             src="${room.mainImageUrl}"/>
                    </div>
                    <div class="room-card__content">
                        <header class="room-card__header">
                            <h2 class="room-card__title">${room.name}</h2>
                            <button class="room-card__detail-btn" aria-label="상세 정보 보기"
                                    data-name="${room.name}"
                                    data-info="${room.info}"
                                    data-addinfo="${room.addInfo}">
                                상세 정보
                                <svg width="18" height="18" viewBox="0 0 20 20" fill="#2584f7"
                                     xmlns="http://www.w3.org/2000/svg" class="css-1hjsey4">
                                    <path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                                          fill="current"></path>
                                </svg>
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
                                    입실 ${acc.checkInTime} · 퇴실 ${acc.checkOutTime}
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
                            <dd>기준 ${room.capacity}인 · 최대 ${room.maxCapacity}인</dd>
                        </dl>
                    </div>
                </section>
            </c:forEach>
        </section>
    </c:if>

    <!-- 시설 전체 모달 -->
    <div id="facilityModal" class="modal" style="display: none">
        <div class="modal-backdrop"></div>
        <div class="modal-content" style="padding: 32px 24px; min-width: 320px; max-width: 90vw">
            <button class="modal-close" aria-label="닫기"
                    style="position: absolute; top: 16px; right: 18px; font-size: 2.2rem; color: #222; cursor: pointer; background: none; border: none; line-height: 1; padding: 0">
                &times;
            </button>
            <h2 style="font-size: 20px; font-weight: 700; margin-bottom: 18px">모든 부대시설</h2>
            <div class="facility-modal-list"
                 style="display: flex; flex-wrap: wrap; gap: 14px 24px; font-size: 15px; color: #444">
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

    <!-- 추가 정보 -->
    <c:if test="${hasExtraInfo}">
        <section class="acc-extra-info">
            <h2 class="acc-title">추가 정보</h2>

            <c:if test="${not empty acc.addPeopleInfoFormatted}">
                <div class="subsection">
                    <h3>인원 추가 정보</h3>
                    <p><c:out value="${acc.addPeopleInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.breakfastInfoFormatted}">
                <div class="subsection">
                    <h3>조식 정보</h3>
                    <p><c:out value="${acc.breakfastInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.cookInfoFormatted}">
                <div class="subsection">
                    <h3>취사 가능 여부</h3>
                    <p><c:out value="${acc.cookInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.cancelRefundInfoFormatted}">
                <div class="subsection">
                    <h3>취소 및 환불 정보</h3>
                    <p><c:out value="${acc.cancelRefundInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.etcInfoFormatted}">
                <div class="subsection">
                    <h3>기타 정보</h3>
                    <p><c:out value="${acc.etcInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>
        </section>
    </c:if>

    <!-- 편의 시설 -->
    <c:if test="${hasFacilityInfo}">
        <section class="acc-facility-info">
            <h2>편의 시설</h2>

            <c:if test="${not empty acc.subwayInfoFormatted}">
                <div class="subsection">
                    <h3>지하철 정보</h3>
                    <p><c:out value="${acc.subwayInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.roomFacilityInfoFormatted}">
                <div class="subsection">
                    <h3>객실 시설</h3>
                    <p><c:out value="${acc.roomFacilityInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.frontFacilityInfoFormatted}">
                <div class="subsection">
                    <h3>프론트 및 그외 시설</h3>
                    <p><c:out value="${acc.frontFacilityInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.parkingInfoFormatted}">
                <div class="subsection">
                    <h3>주차 정보</h3>
                    <p><c:out value="${acc.parkingInfoFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>

            <c:if test="${not empty acc.extraNoticeFormatted}">
                <div class="subsection">
                    <h3>추가 안내</h3>
                    <p><c:out value="${acc.extraNoticeFormatted}" escapeXml="false"/></p>
                </div>
            </c:if>
        </section>
    </c:if>

    <!-- 객실 상세 모달 -->
    <div id="roomDetailModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close-btn room-close">&times;</span>
            <h2 id="modalRoomName">${room.name}</h2>

            <h3>객실 정보</h3>
            <p id="modalRoomInfo">없음</p>

            <br/>

            <h3>추가 정보</h3>
            <p id="modalRoomAddInfo">없음</p>
        </div>
    </div>

    <!-- 판매자 정보 버튼 -->
    <div id="openSellerModal" class="seller-info-list" tabindex="0" role="button" aria-pressed="false">
        <span class="acc-title">판매자 정보</span>
        <span class="arrow">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="#c2c2c2" xmlns="http://www.w3.org/2000/svg"
                 class="fill-contentQuaternary"><path
                    d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                    fill=""></path></svg>
        </span>
    </div>

    <!-- 판매자 정보 모달 -->
    <div id="sellerModal" class="modal" style="display: none;">
        <div class="modal-backdrop"></div>
        <div class="modal-content">
            <button class="close-btn seller-close" aria-label="닫기">&times;</button>
            <h2>판매자 정보</h2>

            <table class="seller-info-table">
                <tbody>
                <tr>
                    <th>상호명:</th>
                    <td><c:out value="${acc.businessName}"/></td>
                </tr>
                <tr>
                    <th>대표자명:</th>
                    <td><c:out value="${acc.hostName}"/></td>
                </tr>
                <tr>
                    <th>전화번호:</th>
                    <td><c:out value="${acc.tel}"/></td>
                </tr>
                <tr>
                    <th>이메일:</th>
                    <td><c:out value="${acc.email}"/></td>
                </tr>
                <tr>
                    <th>사업자번호:</th>
                    <td><c:out value="${acc.licenseNum}"/></td>
                </tr>
                </tbody>
            </table>

            <div class="seller-info-notice">
                <span class="highlight">판매자 정보는 판매자의 명시적 동의 없이 영리 목적의 마케팅·광고 등에 활용할 수 없습니다.</span>
                <br/>
                이를 어길 시 정보통신망법 등 관련 법령에 의거하여 과태료 부과 및 민형사상 책임을 지게 될 수 있습니다.
            </div>
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
        const roomDetailBtn = document.querySelectorAll(".room-card__detail-btn");
        const closeBtn = roomDetailModal.querySelector(".close-btn");
        const backdrop = roomDetailModal.querySelector(".modal-backdrop");

        roomDetailBtn.forEach(btn => {
            btn.addEventListener("click", () => {
                // 버튼의 data 속성에서 정보 읽기
                const name = btn.getAttribute("data-name");
                const info = btn.getAttribute("data-info");
                const addInfo = btn.getAttribute("data-addinfo");

                // 모달 내용 업데이트
                roomDetailModal.querySelector("#modalRoomName").textContent = name || "정보 없음";
                roomDetailModal.querySelector("#modalRoomInfo").textContent = info || "없음";
                roomDetailModal.querySelector("#modalRoomAddInfo").textContent = addInfo || "없음";

                // 모달 표시
                roomDetailModal.style.display = "flex";
            });
        });

        // 닫기 버튼 클릭 시 모달 닫기
        if (closeBtn) {
            closeBtn.addEventListener("click", () => {
                roomDetailModal.style.display = "none";
            });
        }

        // 모달 영역 외 클릭 시 닫기 (선택사항 - 모달 구조에 backdrop이 있어야 함)
        window.addEventListener("click", (e) => {
            if (e.target === roomDetailModal) {
                roomDetailModal.style.display = "none";
            }
        });
    })();

    // 판매자 정보 모달
    (function () {
        const sellerModal = document.getElementById("sellerModal");
        const openSellerModal = document.getElementById("openSellerModal");
        const closeBtn = sellerModal ? sellerModal.querySelector(".seller-close") : null;
        const backdrop = sellerModal ? sellerModal.querySelector(".modal-backdrop") : null;

        if (sellerModal && openSellerModal) {
            openSellerModal.onclick = function () {
                sellerModal.style.display = "flex";
            };
            openSellerModal.onkeydown = function (e) {
                if (e.key === "Enter" || e.key === " ") {
                    sellerModal.style.display = "flex";
                }
            };
        }
        if (sellerModal && closeBtn) {
            closeBtn.onclick = function () {
                sellerModal.style.display = "none";
            };
        }

        if (sellerModal && backdrop) {
            backdrop.onclick = function () {
                sellerModal.style.display = "none";
            };
        }
    })();
</script>
</body>
</html>
