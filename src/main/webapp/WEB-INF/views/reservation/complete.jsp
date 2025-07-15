<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>예약 완료</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <style>
        .complete-container {
            max-width: 800px;
            margin: 80px auto;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 12px;
            text-align: center;
        }
        .complete-title {
            font-size: 2rem;
            margin-bottom: 30px;
            color: #2584f7;
        }
        .reservation-info {
            text-align: left;
            margin-top: 30px;
        }
        .reservation-card {
            padding: 20px;
            margin-bottom: 20px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .reservation-card h3 {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        .action-buttons {
            margin-top: 40px;
        }
        .action-buttons button {
            margin: 0 10px;
            padding: 12px 24px;
            font-size: 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-cancel {
            background-color: #f05454;
            color: white;
        }
        .btn-detail {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<main class="complete-container">
    <h1 class="complete-title">🎉 예약 성공!</h1>
    <p>다음 숙소 예약이 완료되었습니다.</p>

    <section class="reservation-info">
        <c:forEach var="res" items="${reservations}">
            <div class="reservation-card">
                <h3>${res.roomName}</h3>
                <p><strong>숙소:</strong> ${res.accName}</p>
                <p><strong>체크인:</strong> ${res.checkIn}</p>
                <p><strong>체크아웃:</strong> ${res.checkOut}</p>
                <p><strong>인원:</strong> ${res.peopleCnt}명</p>
            </div>
        </c:forEach>
    </section>

    <div class="action-buttons">
        <form action="${pageContext.request.contextPath}/reservation/list" method="get" style="display: inline;">
            <button type="submit" class="btn-detail">예약 정보 확인</button>
        </form>
        <form action="${pageContext.request.contextPath}/reservation/cancel" method="post" style="display: inline;">
            <input type="hidden" name="reservationIds" value="<c:forEach var='res' items='${reservations}' varStatus='status'>${res.id}<c:if test='${!status.last}'>,</c:if></c:forEach>" />
            <button type="submit" class="btn-cancel">예약 취소</button>
        </form>
    </div>
</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
