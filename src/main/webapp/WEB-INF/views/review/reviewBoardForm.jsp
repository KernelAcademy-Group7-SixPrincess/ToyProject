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
    <link rel="stylesheet" href="<c:url value='/resources/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
    <style>
        /* 기존 CSS 스타일 유지 */
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
        .review-list-container {
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
            min-height: 100px;
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
        <h1>리뷰
            <span class="badge rating-summary">
                <c:choose>
                    <%-- accAvgrate는 이제 컨트롤러에서 직접 모델에 추가되므로, 바로 참조 --%>
                    <c:when test="${not empty accAvgrate}">${accAvgrate}</c:when>
                    <c:otherwise>N/A</c:otherwise>
                </c:choose>
            </span>
            <small>
                <c:choose>
                    <%-- accReviewerCnt도 컨트롤러에서 직접 모델에 추가되므로, 바로 참조 --%>
                    <c:when test="${not empty accReviewerCnt}">${accReviewerCnt}</c:when>
                    <c:otherwise>0</c:otherwise>
                </c:choose>명 평가
            </small>
        </h1>
        <%-- <a href="<c:url value='/review/board/create'/>" class="btn btn-primary">새 리뷰 작성</a> --%>
        <%-- "새 리뷰 작성" 버튼이 제거되었습니다. --%>
    </div>

    <div class="review-filters">
        <span class="review-count">총
            <c:choose>
                <%-- 단일 리뷰 조회 모드 (reviewBoardDto가 있을 때) --%>
                <c:when test="${not empty reviewBoardDto and not empty reviewBoardDto.reviewId}">1</c:when>
                <%-- reviews 리스트의 길이로 총 리뷰 수 표시 --%>
                <c:when test="${not empty reviews}">${fn:length(reviews)}</c:when>
                <c:otherwise>0</c:otherwise>
            </c:choose>개 리뷰
        </span>
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

    <c:if test="${not empty msg}">
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> ${msg}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> ${error}</div>
    </c:if>

    <div class="review-list-container">

        <%-- 단일 리뷰 조회 (읽기/수정) 모드 --%>
        <%-- reviewBoardDto가 있으면 단일 리뷰를 표시 --%>
        <c:if test="${not empty reviewBoardDto}">
            <h2>리뷰 상세/수정</h2>
            <div class="review-card" data-review-id="${reviewBoardDto.reviewId}">
                <div class="review-user-info">
                    <div class="user-avatar">
                        <c:if test="${not empty reviewBoardDto.userId}">${fn:substring(reviewBoardDto.userId.toString(), 0, 1)}</c:if>
                        <c:if test="${empty reviewBoardDto.userId}">익명</c:if>
                    </div>
                    <div>
                        <div class="user-name">
                            <c:choose>
                                <c:when test="${not empty reviewBoardDto.userId}">${reviewBoardDto.userId}</c:when>
                                <c:otherwise>익명사용자</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="user-level">
                            리뷰 <span>${reviewBoardDto.reviewId}</span> ·
                            좋아요 <span>${reviewBoardDto.likeCnt}</span> ·
                            답변 <span>${reviewBoardDto.replyCnt}</span>
                        </div>
                    </div>
                </div>
                <div class="review-rating-stars">
                    <c:forEach begin="1" end="5" varStatus="loop">
                        <i class="fas fa-star <c:if test="${reviewBoardDto.rate >= loop.index}">filled</c:if>"></i>
                    </c:forEach>
                </div>
                <div class="review-date">
                    <fmt:formatDate value="${reviewBoardDto.createdAt}" pattern="yyyy.MM.dd"/> 방문 리뷰
                </div>
                <div class="review-images" id="review-images-${reviewBoardDto.reviewId}">
                </div>
                <div class="review-comment-container">
                    <p class="review-comment">${reviewBoardDto.comment}</p>
                </div>
                <c:forEach var="reply" items="${reviewBoardDto.replies}">
                    <div class="admin-reply">
                        <div class="reply-header">
                            제휴점 답변
                            <fmt:formatDate value="${reply.createdAt}" pattern="yy.MM.dd" />
                        </div>
                        <p>${reply.comment}</p>
                    </div>
                </c:forEach>
                <div class="review-actions">
                    <a href="<c:url value='/review/board/read?reviewId=${reviewBoardDto.reviewId}&mode=modify'/>" class="btn btn-primary">수정</a>
                    <form action="<c:url value='/review/board/remove'/>" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${reviewBoardDto.reviewId}"/>
                        <button type="submit" class="btn btn-danger">삭제</button>
                    </form>
                </div>
            </div>
        </c:if>

        <%-- 리뷰 목록 표시: reviews 리스트가 넘어왔을 때 (단일 리뷰 조회 모드가 아닐 때) --%>
        <%-- reviewBoardDto가 없고, reviews 리스트가 있을 때만 이 블록 실행 --%>
        <c:if test="${empty reviewBoardDto and not empty reviews}">
            <c:set var="currentReviewList" value="${reviews}" /> <%-- 항상 reviews를 사용 --%>

            <c:if test="${empty currentReviewList}">
                <p class="no-review">아직 작성된 리뷰가 없습니다.</p>
            </c:if>

            <c:forEach var="r" items="${currentReviewList}">
                <div class="review-card" data-review-id="${r.reviewId}">
                    <div class="review-user-info">
                        <div class="user-avatar">
                            <c:if test="${not empty r.userId}">${fn:substring(r.userId.toString(), 0, 1)}</c:if>
                            <c:if test="${empty r.userId}">익명</c:if>
                        </div>
                        <div>
                            <div class="user-name">
                                <c:choose>
                                    <c:when test="${not empty r.userId}">${r.userId}</c:when>
                                    <c:otherwise>익명사용자</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="user-level">
                                리뷰 <span>${r.reviewId}</span> ·
                                사진 **3장** ·
                                좋아요 <span>${r.likeCnt}</span> ·
                                답변 <span>${r.replyCnt}</span>
                            </div>
                        </div>
                    </div>
                    <div class="review-rating-stars">
                        <c:forEach begin="1" end="5" varStatus="loop">
                            <i class="fas fa-star <c:if test="${r.rate >= loop.index}">filled</c:if>"></i>
                        </c:forEach>
                    </div>
                    <div class="review-date">
                        <fmt:formatDate value="${r.createdAt}" pattern="yyyy.MM.dd"/> 방문 리뷰
                    </div>
                    <div class="review-images" id="review-images-${r.reviewId}">
                    </div>
                    <div class="review-comment-container">
                        <c:set var="commentText" value="${r.comment}" />
                        <c:set var="maxLength" value="150" />
                        <c:if test="${fn:length(commentText) > maxLength}">
                            <p class="review-comment truncated-text">
                                    ${fn:substring(commentText, 0, maxLength)}...
                                <span class="read-more-btn" data-target="full-comment-${r.reviewId}">더보기</span>
                            </p>
                            <p class="review-comment full-text hidden" id="full-comment-${r.reviewId}">
                                    ${commentText}
                                <span class="read-more-btn" data-target="truncated-comment-${r.reviewId}">접기</span>
                            </p>
                        </c:if>
                        <c:if test="${fn:length(commentText) <= maxLength}">
                            <p class="review-comment">${commentText}</p>
                        </c:if>
                    </div>
                    <c:forEach var="reply" items="${r.replies}">
                        <div class="admin-reply">
                            <div class="reply-header">
                                제휴점 답변
                                <fmt:formatDate value="${reply.createdAt}" pattern="yy.MM.dd" />
                            </div>
                            <p>${reply.comment}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </c:if>
        <%-- reviews 리스트가 비어있고, reviewBoardDto도 없을 경우 ("아직 작성된 리뷰가 없습니다." 메시지) --%>
        <c:if test="${empty reviewBoardDto and empty reviews}">
            <p class="no-review">아직 작성된 리뷰가 없습니다.</p>
        </c:if>


        <%-- 페이지네이션 영역 --%>
        <c:if test="${ph.totalCnt!=null && ph.totalCnt!=0}">
            <c:if test="${ph.showPrev}">
                <a class="page" href="<c:url value="/review/board/form${ph.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/review/board/form${ph.getQueryString(i)}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="page" href="<c:url value="/review/board/form${ph.getQueryString(ph.endPage+1)}"/>">&gt;</a>
            </c:if>
        </c:if>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />

<script src="<c:url value='/resources/js/main.js'/>"></script>
<script src="<c:url value='/resources/js/reviewHeader.js'/>"></script>
<script src="<c:url value='/resources/js/reviewMain.js'/>"></script>

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
            const imageUrl = `<c:url value='/api/review/${reviewId}/images'/>`;

            fetch(imageUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(imageUrls => {
                    const imageContainer = document.getElementById(targetElementId);
                    if (imageContainer) {
                        imageContainer.innerHTML = '';
                        if (imageUrls && imageUrls.length > 0) {
                            imageUrls.forEach(url => {
                                const img = document.createElement('img');
                                img.src = `<c:url value='${url}'/>`;
                                img.alt = '리뷰 이미지';
                                img.addEventListener('click', function() {
                                    console.log('Image clicked:', this.src);
                                });
                                imageContainer.appendChild(img);
                            });
                        } else {
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

        document.querySelectorAll('.review-card').forEach(card => {
            const reviewId = card.dataset.reviewId;
            if (reviewId) {
                loadReviewImages(reviewId, `review-images-${reviewId}`);
            }
        });
    });
</script>
</body>
</html>