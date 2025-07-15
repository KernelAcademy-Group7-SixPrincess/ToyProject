<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        .error-wrapper {
            position: relative;
            height: 464px;
            background-color: #fff;
            color: #1d8bff;
        }
        .error-content {
            position: relative;
            z-index: 11;
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 113px;
            text-align: center;
        }
        .error-title {
            font-size: 32px;
            line-height: 44px;
            font-weight: 700;
            margin-bottom: 16px;
        }
        .error-message {
            font-size: 18px;
            line-height: 28px;
            margin-bottom: 32px;
        }
        .error-buttons {
            display: inline-flex;
            gap: 12px;
        }
        .error-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 120px;
            height: 48px;
            border-radius: 10px;
            border: 2px solid #1d8bff;
            background-color: transparent;
            font-size: 16px;
            font-weight: 500;
            color: #1d8bff;
            cursor: pointer;
            text-decoration: none;
        }
        .error-btn:hover {
            background-color: rgba(255,255,255,0.2);
        }
    </style>
    <meta charset="UTF-8" />
    <title>저기어때</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="error-wrapper">
    <div class="error-content">
        <div class="error-title">죄송합니다. 일시적인 오류가 발생했습니다.</div>
        <div class="error-message">${errorMessage}</div>
        <div class="error-buttons">
            <a href="${redirectPath}" class="error-btn">이전으로</a>
            <a href="<c:url value='/'/>" class="error-btn">홈으로</a>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
