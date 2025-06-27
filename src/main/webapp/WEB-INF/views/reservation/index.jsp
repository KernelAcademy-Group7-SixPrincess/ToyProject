<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>예약 확인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/accinfo.css" />
  <style>
    .btn {
      cursor: pointer;
      border-radius: 4px;
      font-size: 1rem;
    }
    .btn-back {
      padding: 10px 30px;
      background-color: #ccc;
      border: none;
      color: #333;
    }
    .btn-confirm {
      padding: 10px 30px;
      background-color: #2584f7;
      border: none;
      color: white;
    }
  </style>
</head>
<body class="reservation">
<%@ include file="../common/header.jsp" %>

<main class="reservation-main" style="max-width: 700px; margin: 50px auto; padding: 20px; box-sizing: border-box;">
  <section class="room-info" style="text-align: center;">
    <!-- 방 사진 -->
    <img src="${room.mainImageUrl}" alt="${room.name} 이미지" style="width: 100%; max-width: 400px; border-radius: 8px; margin-bottom: 20px;" />

    <!-- 방 이름 -->
    <h2>${room.name}</h2>

    <!-- 가격 -->
    <p style="font-size: 1.2rem; font-weight: bold; margin: 10px 0;">
      가격: ${room.price}원
    </p>

    <!-- 인원 정보 -->
    <p>
      기준 인원: ${room.capacity}인 &nbsp;&nbsp; 최대 인원: ${room.maxCapacity}인
    </p>

    <!-- 숙소 체크인, 체크아웃 시간 -->
    <p>
      체크인 시간: ${acc.checkInTime} &nbsp;&nbsp; 체크아웃 시간: ${acc.checkOutTime}
    </p>
  </section>

  <section class="reservation-buttons" style="display: flex; justify-content: space-between; margin-top: 40px;">
    <!-- 뒤로가기 버튼: 장바구니로 이동 -->
    <form action="${pageContext.request.contextPath}/cart.index.jsp" method="get">
      <button type="submit" class="btn btn-back">뒤로가기</button>
    </form>

    <!-- 예약 완료 버튼: 예약 확정 -->
    <form action="${pageContext.request.contextPath}/reservation/confirm" method="post">
      <!-- 필요한 예약 정보 input 숨김으로 넘겨야 함 -->
      <input type="hidden" name="roomId" value="${room.roomId}" />
      <input type="hidden" name="period" value="${reservation.period}" />
      <input type="hidden" name="peopleCnt" value="${reservation.peopleCnt}" />
      <input type="hidden" name="note" value="${reservation.note}" />

      <!-- checkIn, checkOut은 Acc에서 가져온 checkInTime, checkOutTime을 넘겨줌 -->
      <input type="hidden" name="checkIn" value="${acc.checkInTime}" />
      <input type="hidden" name="checkOut" value="${acc.checkOutTime}" />

      <button type="submit" class="btn btn-confirm">예약 완료</button>
    </form>
  </section>
</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
