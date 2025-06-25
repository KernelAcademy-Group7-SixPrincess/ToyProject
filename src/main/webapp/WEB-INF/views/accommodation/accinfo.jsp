<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.spring.example.accommodation.domain.Acc" %>
<%@ page import="org.spring.example.room.dto.Room" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <style>
        /* 공통 */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f9f9f9;
        }

        /* 상세페이지 컨테이너 */
        .acc-detail-container {
            max-width: 900px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        /* 메인 이미지 */
        .acc-main-image img {
            width: 100%;
            border-radius: 10px;
            object-fit: cover;
            max-height: 450px;
        }

        /* 기본정보 */
        .acc-info-section {
            margin-top: 20px;
        }

        .acc-name {
            font-size: 2em;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .acc-address {
            color: #666;
            margin-bottom: 10px;
        }

        .acc-rating span {
            font-weight: 600;
            margin-right: 12px;
            color: #f56a00;
        }

        .acc-contact p {
            margin: 2px 0;
            font-size: 14px;
        }

        /* 섹션 공통 */
        section {
            margin-top: 25px;
        }

        section h2 {
            border-bottom: 2px solid #f56a00;
            padding-bottom: 5px;
            margin-bottom: 10px;
            font-size: 1.4em;
            color: #007bff;
        }

        section ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        section ul li {
            margin-bottom: 6px;
            line-height: 1.5;
        }

        .acc-extra-info h3, .acc-facility-info h3 {
            font-size: 1.1rem; /* h2보다는 작게 */
            font-weight: 700; /* 굵게 */
            margin-top: 1em;
            margin-bottom: 0.3em;
        }

        .acc-extra-info p, .acc-facility-info p {
            margin-left: 1em; /* 들여쓰기 */
            line-height: 2.0;
        }

        /* 버튼 */
        .seller-info-list {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 20px;
            margin-top: 20px;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
            font-size: 1rem;
            background-color: white;
            color: #333;
        }

        .seller-info-list:hover {
            background-color: #f5f5f5;
        }

        .seller-info-list .arrow {
            color: #aaa;
            font-size: 1.2rem;
        }


        /* 모달 배경 */
        .modal {
            display: none; /* 처음엔 숨김 */
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* 모달 창 내용 */
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 30px;
            border-radius: 10px;
            width: 80%;
            max-width: 500px;
        }

        /* 닫기 버튼 */
        .close-btn {
            color: #aaa;
            float: right;
            font-size: 1.5rem;
            font-weight: bold;
            cursor: pointer;
        }

        .close-btn:hover {
            color: black;
        }

        .room-section {
            margin-top: 40px;
        }

        .room-card {
            display: flex;
            background: #fdfdfd;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-bottom: 15px;
            overflow: hidden;
        }

        .room-image {
            width: 160px;
            height: 120px;
            object-fit: cover;
            border-radius: 10px 0 0 10px;
        }

        .room-details {
            padding: 15px;
            flex: 1;
        }

        .room-name {
            font-size: 1.2em;
            margin-bottom: 6px;
        }

        .room-info {
            color: #666;
            margin-bottom: 4px;
        }


    </style>
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
</header>


<c:choose>
    <c:when test="${empty acc}">
        <p>숙소 정보를 불러올 수 없습니다.</p>
    </c:when>
    <c:otherwise>
        <div class="acc-detail-container">

            <div class="acc-main-image">
                <img src="${acc.mainImageUrl}" alt="${acc.name}"/>
            </div>

            <section class="acc-info-section">
                <h1 class="acc-name">${acc.name}</h1>
                <p class="acc-address">${acc.address}</p>
                <div class="acc-rating">
                    <span>⭐ ${acc.avgrate} / 10.0</span>
                    <span>(${acc.reviewerCnt}명 평가)</span>
                </div>

                <section class="acc-checkin-checkout">
                    <p>체크인: <c:out value="${acc.checkInTime != null ? acc.checkInTime : '정보없음'}"/></p>
                    <p>체크아웃: <c:out value="${acc.checkOutTime != null ? acc.checkOutTime : '정보없음'}"/></p>
                </section>

                <!-- 기타 정보도 마찬가지로 EL로 표현 -->

            </section>

            <!-- 추가 정보 -->
            <c:if test="${hasExtraInfo}">
                <section class="acc-extra-info">
                    <h2>추가 정보</h2>

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

            <!-- 객실 리스트 -->
            <c:if test="${not empty acc.roomList}">
                <section class="room-section">
                    <h2>객실 선택</h2>
                    <c:forEach var="room" items="${acc.roomList}">
                        <div class="room-card">
                            <img src="${room.mainImageUrl}" alt="객실 이미지" class="room-image"/>
                            <div class="room-details">
                                <h3 class="room-name"><c:out value="${room.name}"/></h3>
                                <p>기준 ${room.capacity}인 / 최대 ${room.maxCapacity}인</p>
                                <button class="detail-btn"
                                        data-name="${room.name}"
                                        data-info="${room.info}"
                                        data-addinfo="${room.addInfo}">
                                    상세 정보
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </section>
            </c:if>


            <!-- 객실 상세 모달 -->
            <div id="roomDetailModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn room-close">&times;</span>
                    <h2 id="modalRoomName">객실명</h2>

                    <h3>객실 정보</h3>
                    <p id="modalRoomInfo">없음</p>

                    <br/>

                    <h3>추가 정보</h3>
                    <p id="modalRoomAddInfo">없음</p>
                </div>
            </div>

            <!-- 판매자 정보 버튼 -->
            <div id="openSellerModal" class="seller-info-list" tabindex="0" role="button" aria-pressed="false">
                <span>판매자 정보</span>
                <span class="arrow">&gt;</span>
            </div>

            <!-- 판매자 정보 모달 -->
            <div id="sellerModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn seller-close" role="button" aria-label="닫기">&times;</span>
                    <h2>판매자 정보</h2>
                    <ul>
                        <li><strong>상호명:</strong> <c:out value="${acc.businessName}"/></li>
                        <li><strong>대표자명:</strong> <c:out value="${acc.hostName}"/></li>
                        <li><strong>전화번호:</strong> <c:out value="${acc.tel}"/></li>
                        <li><strong>이메일:</strong> <c:out value="${acc.email}"/></li>
                        <li><strong>사업자번호:</strong> <c:out value="${acc.licenseNum}"/></li>
                    </ul>
                </div>
            </div>

        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const sellerModal = document.getElementById("sellerModal");
                const roomModal = document.getElementById("roomDetailModal");

                const sellerBtn = document.getElementById("openSellerModal");
                const sellerCloseBtn = document.querySelector("#sellerModal .seller-close");
                const roomCloseBtn = document.querySelector("#roomDetailModal .room-close");

                // 판매자 모달 열기
                sellerBtn?.addEventListener('click', () => {
                    sellerModal.style.display = "block";
                    sellerBtn.setAttribute('aria-pressed', 'true');
                });

                // 판매자 모달 닫기
                sellerCloseBtn?.addEventListener('click', () => {
                    sellerModal.style.display = "none";
                    sellerBtn.setAttribute('aria-pressed', 'false');
                });

                // 객실 상세정보 모달 열기
                document.querySelectorAll('.detail-btn').forEach(button => {
                    button.addEventListener('click', () => {
                        const rawInfo = button.dataset.info || '없음';
                        const rawAddInfo = button.dataset.addinfo || '없음';

                        const formattedInfo = rawInfo.replace(/\n/g, '<br>');
                        const formattedAddInfo = rawAddInfo.replace(/\n/g, '<br>');

                        document.getElementById('modalRoomName').innerText = button.dataset.name;
                        document.getElementById('modalRoomInfo').innerHTML = formattedInfo;
                        document.getElementById('modalRoomAddInfo').innerHTML = formattedAddInfo;
                        roomModal.style.display = "block";
                    });
                });

                // 객실 모달 닫기
                roomCloseBtn?.addEventListener('click', () => {
                    roomModal.style.display = "none";
                });

                // 바깥 클릭 시 모달 닫기
                window.addEventListener('click', (event) => {
                    if (event.target === sellerModal) {
                        sellerModal.style.display = "none";
                        sellerBtn.setAttribute('aria-pressed', 'false');
                    }
                    if (event.target === roomModal) {
                        roomModal.style.display = "none";
                    }
                });
            });
        </script>

    </c:otherwise>
</c:choose>
</body>
</html>
