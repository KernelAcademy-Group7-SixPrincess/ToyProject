<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />
</head>
<body class="board notice">
<%@ include file="../../common/header.jsp" %>

<main>
    <section aria-labelledby="notice-title">
        <h1 id="notice-title" class="notice-title board-title">공지사항</h1>

        <ul class="board-list notice-list pinned" role="list" aria-label="고정된 공지사항 목록">
            <li class="board-item notice-item notice-header">
                <span>NO</span>
                <span>제목</span>
                <span>작성일</span>
            </li>
            <c:forEach var="post" items="${pinnedPosts}">
                <li class="board-item notice-item">
                    <span class="no">${post.postId}</span>
                    <span class="title">
                        <a href="/board/notice/${post.postId}">
                            <strong>[공지]</strong>
                            ${post.title}
                        </a>
                    </span>
                    <time datetime="${post.isoDate}">${post.formattedDate}</time>
                </li>
            </c:forEach>
        </ul>

        <ul class="board-list notice-list" role="list" aria-label="공지사항 목록">
            <c:forEach var="post" items="${normalPosts}">
                <li class="board-item notice-item">
                    <span class="no">${post.postId}</span>
                    <span class="title">
                        <a href="/board/notice/${post.postId}">
                                ${post.title}
                        </a>
                    </span>
                    <span class="date">${post.formattedDate}</span>
                </li>
            </c:forEach>

        </ul>

        <div class="faq-write-row">
            <a href="/board/notice/write" class="write-btn" role="button">글쓰기</a>
        </div>

        <nav aria-label="페이지 이동">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li><a href="?page=${currentPage - 1}">&laquo; 이전</a></li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="${i == currentPage ? 'active' : ''}">
                        <a href="?page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li><a href="?page=${currentPage + 1}">다음 &raquo;</a></li>
                </c:if>
            </ul>
        </nav>
    </section>
</main>

<%@ include file="../../common/footer.jsp" %>



<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>
    const buttons = document.querySelectorAll(".accordion-trigger");

    buttons.forEach((btn) => {
        btn.addEventListener("click", () => {
            const panel = document.getElementById(btn.getAttribute("aria-controls"));
            const isExpanded = btn.getAttribute("aria-expanded") === "true";

            if (isExpanded) {
                // 닫기
                btn.setAttribute("aria-expanded", "false");
                panel.style.height = panel.scrollHeight + "px";
                requestAnimationFrame(() => {
                    panel.style.height = "0";
                });
            } else {
                // 열기
                btn.setAttribute("aria-expanded", "true");
                panel.style.height = panel.scrollHeight + "px";

                panel.addEventListener(
                    "transitionend",
                    function handler() {
                        panel.style.height = "auto";
                        panel.removeEventListener("transitionend", handler);
                    }
                );
            }
        });
    });
</script>
</body>
</html>
