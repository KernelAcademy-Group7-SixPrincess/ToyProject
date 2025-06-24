<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.spring.example.accommodation.domain.Acc" %>

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
            font-size: 1.1rem;   /* h2보다는 작게 */
            font-weight: 700;    /* 굵게 */
            margin-top: 1em;
            margin-bottom: 0.3em;
        }

        .acc-extra-info p, .acc-facility-info p {
            margin-left: 1em; /* 들여쓰기 */
            line-height: 2.0;
        }

        /* 버튼 */
        .seller-info-btn {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
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
            background-color: rgba(0,0,0,0.5);
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
    Acc acc = (Acc) request.getAttribute("acc");
    if (acc == null) {
%>
<p>숙소 정보를 불러올 수 없습니다.</p>
<%
} else {
%>

<div class="acc-detail-container">

    <!-- 숙소 메인 이미지 -->
    <div class="acc-main-image">
        <img src="<%= acc.getMainImageUrl() %>" alt="<%= acc.getName() %>" />
    </div>

    <!-- 숙소 기본 정보 -->
    <section class="acc-info-section">
        <h1 class="acc-name"><%= acc.getName() %></h1>
        <p class="acc-address"><%= acc.getAddress() %></p>

        <div class="acc-rating">
            <span>⭐ <%= acc.getAvgrate() %> / 10.0</span>
            <span>(<%= acc.getReviewerCnt() %>명 평가)</span>
        </div>

    <!-- 체크인 / 체크아웃 시간 -->
    <section class="acc-checkin-checkout">
        <p>체크인: <%= acc.getCheckInTime() != null ? acc.getCheckInTime() : "정보없음" %></p>
        <p>체크아웃: <%= acc.getCheckOutTime() != null ? acc.getCheckOutTime() : "정보없음" %></p>
    </section>

    <%!
        public String formatWithBullet(String input) {
            if (input == null || input.trim().isEmpty()) return "없음";

            String[] lines = input.split("\\n");
            StringBuilder sb = new StringBuilder();

            for (String line : lines) {
                line = line.trim();
                if (line.isEmpty()) continue;

                // [로 시작하는 경우: 줄바꿈을 추가하고 ⦁ 안붙임
                if (line.startsWith("[")) {
                    sb.append("<br>").append(line);
                } else if (line.startsWith("&nbsp;&nbsp;(") || line.equalsIgnoreCase("null")) {
                    sb.append(line);
                } else {
                    sb.append("&nbsp;&nbsp;⦁ ").append(line);
                }

                sb.append("<br>");
            }

            return sb.toString();
        }
    %>

    <%
        boolean hasExtraInfo =
                (acc.getAddPeopleInfo() != null && !acc.getAddPeopleInfo().trim().isEmpty()) ||
                        (acc.getBreakfastInfo() != null && !acc.getBreakfastInfo().trim().isEmpty()) ||
                        (acc.getCookInfo() != null && !acc.getCookInfo().trim().isEmpty()) ||
                        (acc.getCancelRefundInfo() != null && !acc.getCancelRefundInfo().trim().isEmpty()) ||
                        (acc.getEtcInfo() != null && !acc.getEtcInfo().trim().isEmpty());

        boolean hasFacilityInfo =
                (acc.getSubwayInfo() != null && !acc.getSubwayInfo().trim().isEmpty()) ||
                        (acc.getRoomFacilityInfo() != null && !acc.getRoomFacilityInfo().trim().isEmpty()) ||
                        (acc.getFrontFacilityInfo() != null && !acc.getFrontFacilityInfo().trim().isEmpty()) ||
                        (acc.getParkingInfo() != null && !acc.getParkingInfo().trim().isEmpty()) ||
                        (acc.getExtraNotice() != null && !acc.getExtraNotice().trim().isEmpty());
    %>


    <% if (hasExtraInfo) { %>
    <section class="acc-extra-info">
        <h2>추가 정보</h2>
        <% if (acc.getAddPeopleInfo() != null && !acc.getAddPeopleInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>인원 추가 정보</h3>
            <p><%= formatWithBullet(acc.getAddPeopleInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getBreakfastInfo() != null && !acc.getBreakfastInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>조식 정보</h3>
            <p><%= formatWithBullet(acc.getBreakfastInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getCookInfo() != null && !acc.getCookInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>취사 가능 여부</h3>
            <p><%= formatWithBullet(acc.getCookInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getCancelRefundInfo() != null && !acc.getCancelRefundInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>취소 및 환불 정보</h3>
            <p><%= formatWithBullet(acc.getCancelRefundInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getEtcInfo() != null && !acc.getEtcInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>기타 정보</h3>
            <p><%= formatWithBullet(acc.getEtcInfo()) %></p>
        </div>
        <% } %>
    </section>
    <% } %>

    <% if (hasFacilityInfo) { %>
    <section class="acc-facility-info">
        <h2>편의 시설</h2>
        <% if (acc.getSubwayInfo() != null && !acc.getSubwayInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>지하철 정보</h3>
            <p><%= formatWithBullet(acc.getSubwayInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getRoomFacilityInfo() != null && !acc.getRoomFacilityInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>객실 시설</h3>
            <p><%= formatWithBullet(acc.getRoomFacilityInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getFrontFacilityInfo() != null && !acc.getFrontFacilityInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>전면 시설</h3>
            <p><%= formatWithBullet(acc.getFrontFacilityInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getParkingInfo() != null && !acc.getParkingInfo().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>주차 정보</h3>
            <p><%= formatWithBullet(acc.getParkingInfo()) %></p>
        </div>
        <% } %>
        <% if (acc.getExtraNotice() != null && !acc.getExtraNotice().trim().isEmpty()) { %>
        <div class="subsection">
            <h3>추가 안내</h3>
            <p><%= formatWithBullet(acc.getExtraNotice()) %></p>
        </div>
        <% } %>
    </section>
    <% } %>

    <!-- 판매자 정보 버튼 -->
    <div class="seller-info-btn-wrapper">
        <button id="openSellerModal" class="seller-info-btn">판매자 정보 보기</button>
    </div>

    <!-- 모달 창 -->
    <div id="sellerModal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <h2>판매자 정보</h2>
            <ul>
                <li><strong>상호명:</strong> <%= acc.getBusinessName() %></li>
                <li><strong>대표자명:</strong> <%= acc.getHostName() %></li>
                <li><strong>전화번호:</strong> <%= acc.getTel()%></li>
                <li><strong>이메일:</strong> <%= acc.getEmail()%></li>
                <li><strong>사업자번호:</strong> <%= acc.getLicenseNum() %></li>
            </ul>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const modal = document.getElementById("sellerModal");
            const btn = document.getElementById("openSellerModal");
            const closeBtn = document.querySelector(".close-btn");

            btn.onclick = function () {
                modal.style.display = "block";
            }

            closeBtn.onclick = function () {
                modal.style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            }
        });
    </script>

</div>

<%
    }
%>



</body>
</html>
