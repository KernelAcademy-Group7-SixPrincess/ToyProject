<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="<c:url value='/resources/css/layout.css'/>"> <%-- 리뷰 관련 CSS --%>
    <link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <%-- FontAwesome CDN 추가 (아이콘용) --%>


    <style>
        /*
            이 <style> 블록의 CSS는 reviewBoardForm.jsp에만 적용되는 스타일입니다.
            가능하면 'review.css' 또는 'layout.css'와 같은 외부 CSS 파일로 분리하여 관리하는 것이 좋습니다.
            이전 답변에서 제공했던 스타일을 여기에 다시 넣어둡니다.
        */
        body { font-family: 'Noto Sans KR', sans-serif; margin: 0; padding: 0; background-color: #f5f5f5; }
        a { text-decoration: none; color: inherit; }
        ul { list-style: none; margin: 0; padding: 0; }
        button { cursor: pointer; }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 15px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            border-radius: 8px;
        }

        /* Sub-navigation (탭 메뉴) */
        .sub-nav {
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }
        .sub-nav ul {
            display: flex;
            padding: 0;
            margin: 0;
        }
        .sub-nav li {
            padding: 15px 20px;
            font-weight: bold;
            color: #777;
            border-bottom: 3px solid transparent;
            cursor: pointer;
        }
        .sub-nav li.active {
            color: #333;
            border-bottom-color: #007bff;
        }
        .sub-nav li:hover {
            color: #007bff;
        }

        /* Review Section Header */
        .review-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .review-section-header h1 {
            margin: 0;
            font-size: 24px;
            display: flex;
            align-items: baseline;
        }
        .review-section-header .rating-summary {
            background-color: #28a745;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 16px;
            margin-left: 10px;
        }
        .review-section-header small {
            font-size: 0.7em;
            color: #888;
            margin-left: 5px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Review Filters */
        .review-filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .review-filters .review-count {
            font-weight: bold;
            color: #333;
        }
        .review-filters .sort-options select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            color: #555;
            background-color: #fff;
        }

        /* Review Card */
        .review-list {
            padding-bottom: 40px;
        }
        .review-card {
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.03);
            display: flex;
            flex-direction: column;
        }

        .review-card .review-user-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .review-card .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            color: #666;
            margin-right: 10px;
            flex-shrink: 0;
        }
        .review-card .user-name {
            font-weight: bold;
            color: #333;
            font-size: 15px;
        }
        .review-card .user-level {
            font-size: 0.85em;
            color: #777;
        }

        .review-card .review-rating-stars {
            color: #ffc107;
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        .review-card .review-rating-stars i {
            margin-right: 2px;
        }

        .review-card .review-date {
            font-size: 0.85em;
            color: #999;
            margin-bottom: 15px;
        }

        .review-card .review-images {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            flex-wrap: wrap;
            /* Placeholder for images before AJAX loads them */
            min-height: 100px; /* 이미지가 로드되기 전에도 공간을 확보 */
        }
        .review-card .review-images img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        .review-card .review-comment-container {
            margin-bottom: 15px;
        }
        .review-card .review-comment {
            line-height: 1.6;
            color: #333;
            font-size: 15px;
        }
        .review-card .review-comment .read-more-btn {
            color: #007bff;
            cursor: pointer;
            text-decoration: underline;
            margin-left: 5px;
            font-size: 0.9em;
        }
        .truncated-text.hidden, .full-text.hidden {
            display: none;
        }

        .review-card .admin-reply {
            border-top: 1px dashed #eee;
            padding-top: 15px;
            margin-top: 15px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            font-size: 0.9em;
            color: #666;
        }
        .admin-reply .reply-header {
            font-weight: bold;
            color: #007bff;
            margin-bottom: 5px;
        }

        /* Alerts for messages */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .alert i {
            margin-right: 8px;
        }
        .no-review {
            text-align: center;
            padding: 50px;
            color: #777;
            font-size: 1.1em;
        }
    </style>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<div class="container">
    <nav class="sub-nav">
        <ul>
            <li><a href="#">개요</a></li>
            <li><a href="#">객실</a></li>
            <li><a href="#">서비스 및 부대시설</a></li>
            <li><a href="#">위치</a></li>
            <li class="active"><a href="#">리뷰</a></li>
        </ul>
    </nav>

    <div class="review-section-header">
        <h1>리뷰 <span class="badge rating-summary">4.9</span> <small>3,193명 평가</small></h1>
        <a href="<c:url value='/review/board/form'/>" class="btn btn-primary">새 리뷰 작성</a>
    </div>

    <div class="review-filters">
        <span class="review-count">총 3,193개 리뷰</span>
        <div class="sort-options">
            <label for="sortOrder" class="sr-only">정렬 기준</label>
            <select id="sortOrder">
                <option value="recent">최신순</option>
                <option value="highRating">평점 높은순</option>
                <option value="lowRating">평점 낮은순</option>
                <option value="recommended">추천순</option>
            </select>
        </div>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> ${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> ${error}</div>
    </c:if>

    <div class="review-list">
        <c:if test="${empty review}">
            <p class="no-review">아직 작성된 리뷰가 없습니다.</p>
        </c:if>

        <%-- 실제 리뷰 데이터를 반복해서 표시 --%>
        <c:forEach var="review" items="${review}">
            <div class="review-card" data-review-id="${review.reviewId}">
                <div class="review-user-info">
                    <div class="user-avatar">
                            <%-- userId의 첫 글자만 표시 --%>
                        <c:if test="${not empty review.userId}">${fn:substring(review.userId, 0, 1)}</c:if>
                        <c:if test="${empty review.userId}">익명</c:if>
                    </div>
                    <div>
                        <div class="user-name">
                                <%-- userId 전체 표시 --%>
                            <c:choose>
                                <c:when test="${not empty review.userId}">${review.userId}</c:when>
                                <c:otherwise>익명사용자</c:otherwise>
                            </c:choose>
                        </div>
                            <%-- DTO에 없는 reviewCount, photoCount는 하드코딩으로 대체 --%>
                        <div class="user-level">
                            리뷰 **10개** · 사진 **3장** · 좋아요 ${review.likeCnt}
                        </div>
                    </div>
                </div>

                <div class="review-rating-stars">
                    <c:forEach begin="1" end="5" varStatus="loop">
                        <i class="fas fa-star <c:if test="${review.rate >= loop.index}">filled</c:if>"></i>
                    </c:forEach>
                </div>
                <div class="review-date">
                    <fmt:formatDate value="${review.createdAt}" pattern="yyyy.MM.dd"/> 방문 리뷰
                </div>

                <div class="review-images" id="review-images-${review.reviewId}">
                        <%-- 이미지는 AJAX로 로드할 것이므로, 초기에는 비워둡니다. --%>
                </div>

                <div class="review-comment-container">
                    <c:set var="commentText" value="${review.comment}" />
                    <c:set var="maxLength" value="150" />
                    <c:if test="${fn:length(commentText) > maxLength}">
                        <p class="review-comment truncated-text">
                                ${fn:substring(commentText, 0, maxLength)}...
                            <span class="read-more-btn" data-target="full-comment-${review.reviewId}">더보기</span>
                        </p>
                        <p class="review-comment full-text hidden" id="full-comment-${review.reviewId}">
                                ${commentText}
                            <span class="read-more-btn" data-target="truncated-comment-${review.reviewId}">접기</span>
                        </p>
                    </c:if>
                    <c:if test="${fn:length(commentText) <= maxLength}">
                        <p class="review-comment">${commentText}</p>
                    </c:if>
                </div>

                    <%-- DTO에 없는 replyComment, repliedAt 필드를 하드코딩으로 대체 --%>
                    <%-- 제휴점 답변은 항상 있다고 가정하고 표시. 실제 데이터가 없으면 빈 값으로 나옴. --%>
                <c:forEach var="reply" items="${review.replies}">
                    <div class="admin-reply">
                        <div class="reply-header">
                            제휴점 답변
                            <fmt:formatDate value="${reply.createdAt}" pattern="yy.MM.dd" />
                        </div>
                        <p>${reply.comments}</p>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
        <c:forEach var="review" items="${reviews}">
            <div>
                <p>리뷰 ID: ${review.reviewId}</p>
                <p>숙소 ID: ${review.accId}</p>
                <p>평점: ${review.rate}</p>
                <p>내용: ${review.comment}</p>
            </div>
        </c:forEach>

    <%-- 페이지네이션 영역 --%>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
                <a class="page" href="<c:url value="/board/list${ph.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.getQueryString(i)}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="page" href="<c:url value="/board/list${ph.getQueryString(ph.endPage+1)}"/>">&gt;</a>
            </c:if>
        </c:if>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />

<%-- JavaScript 파일들을 <body> 닫는 태그 직전에 명시하는 것이 좋습니다. --%>
<script src="<c:url value='/resources/js/main.js'/>"></script>
<script src="<c:url value='/resources/js/reviewHeader.js'/>"></script>
<script src="<c:url value='/resources/js/reviewMain.js'/>"></script> <%-- 리뷰 페이지 전용 JS --%>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // "더보기/접기" 기능
        document.querySelectorAll('.read-more-btn').forEach(button => {
            button.addEventListener('click', function() {
                const parentContainer = this.closest('.review-comment-container');
                const truncated = parentContainer.querySelector('.truncated-text');
                const full = parentContainer.querySelector('.full-text');

                if (full.classList.contains('hidden')) {
                    truncated.classList.add('hidden');
                    full.classList.remove('hidden');
                } else {
                    full.classList.add('hidden');
                    truncated.classList.remove('hidden');
                }
            });
        });

        // 탭 메뉴 활성화 (클릭 시 active 클래스 토글)
        document.querySelectorAll('.sub-nav li').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sub-nav li').forEach(li => li.classList.remove('active'));
                this.classList.add('active');
                // 실제 탭 전환 로직 (AJAX 로딩 등)은 여기에 추가
            });
        });

        // 정렬 옵션 변경 시 (실제 데이터 로딩 로직과 연결)
        document.getElementById('sortOrder')?.addEventListener('change', function() {
            console.log('정렬 기준 변경:', this.value);
            // 서버에 새로운 정렬 기준으로 데이터 요청하는 로직 추가
            // 예: loadReview({ sort: this.value });
        });


        // ======== AJAX로 이미지 로딩 로직 (추가) ========
        function loadReviewImages(reviewId, targetElementId) {
            // 실제 API 엔드포인트 URL로 변경해야 합니다.
            // 예: '/api/review/{reviewId}/images'
            const imageUrl = `<c:url value='/api/review/${reviewId}/images'/>`;

            fetch(imageUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json(); // 이미지 URL 리스트를 JSON 형태로 반환한다고 가정
                })
                .then(imageUrls => {
                    const imageContainer = document.getElementById(targetElementId);
                    if (imageContainer) {
                        imageContainer.innerHTML = ''; // 기존 내용 지우기 (로딩 스피너 등)
                        if (imageUrls && imageUrls.length > 0) {
                            imageUrls.forEach(url => {
                                const img = document.createElement('img');
                                img.src = `<c:url value='${url}'/>`; // URL에 컨텍스트 경로 추가
                                img.alt = '리뷰 이미지';
                                img.addEventListener('click', function() {
                                    // 이미지 확대/모달 로직
                                    console.log('Image clicked:', this.src);
                                });
                                imageContainer.appendChild(img);
                            });
                        } else {
                            // 이미지가 없을 경우 표시할 내용
                            imageContainer.innerHTML = '<p style="color:#999; font-size:0.9em;">첨부된 이미지가 없습니다.</p>';
                        }
                    }
                })
                .catch(error => {
                    console.error('리뷰 이미지 로딩 실패:', error);
                    const imageContainer = document.getElementById(targetElementId);
                    if (imageContainer) {
                        imageContainer.innerHTML = '<p style="color:red; font-size:0.9em;">이미지를 불러오는데 실패했습니다.</p>';
                    }
                });
        }

        // 모든 리뷰 카드에 대해 이미지 로딩 함수 호출
        document.querySelectorAll('.review-card').forEach(card => {
            const reviewId = card.dataset.reviewId;
            if (reviewId) {
                loadReviewImages(reviewId, `review-images-${reviewId}`);
            }
        });
        // ====================================================
    });
</script>
<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
</body>
</html>