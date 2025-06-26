<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>자주묻는질문</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />
</head>
<body class="board faq">
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<main>
    <section aria-labelledby="faq-title">
        <h1 id="faq-title" class="faq-title board-title">자주 묻는 질문</h1>

        <div class="faq-header-row">
            <form action="/board/faq" method="get" class="faq-search-form">
                <input type="text" name="keyword" placeholder="검색어를 입력하세요" />
                <button type="submit" class="faq-search-btn">검색</button>
            </form>
        </div>

        <ul class="accordion" role="region" aria-labelledby="faq-title">
            <c:forEach items="${normalPosts}" var="faq" varStatus="status">
                <li class="accordion-item">
                    <div class="faq-item-row">
                        <button type="button" class="accordion-trigger" aria-expanded="false"
                                aria-controls="faq${status.index + 1}" id="accordion-header-${status.index + 1}">
                            <span>Q</span>
                                ${faq.title}
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                 xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate">
                                <path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path>
                            </svg>
                        </button>

                        <div class="faq-actions admin-only">
                            <button class="faq-more-btn" aria-label="더보기">⋯</button>
                            <ul class="faq-dropdown-menu">
                                <li>
                                    <a href="/board/faq/${faq.postId}/edit" class="button">
                                        <span class="icon-edit"></span>
                                        수정
                                    </a>
                                </li>
                                <li>
                                    <form action="/board/faq/${faq.postId}/delete" method="post"
                                          onsubmit="return confirm('삭제할까요?')" style="display: inline">
                                        <input type="hidden" name="id" value="${faq.postId}" />
                                        <button type="submit" class="faq-delete-link">
                                            <span class="icon-delete"></span>
                                            삭제
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="faq${status.index + 1}" role="region" class="accordion-panel"
                         aria-labelledby="accordion-header-${status.index + 1}">
                        <p class="markdown-content">${faq.content}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <div class="faq-write-row">
            <a href="/board/faq/write" class="write-btn admin-only">글쓰기</a>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/easyMDE.js"></script>
<script>
    document.querySelectorAll(".faq-more-btn").forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.stopPropagation();
            const parent = this.parentElement;
            const isOpen = parent.classList.contains("open");
            // 모든 드롭다운 닫기
            document.querySelectorAll(".faq-actions.open").forEach((el) => el.classList.remove("open"));
            // 원래 열려있던 거면 닫기, 아니면 열기
            if (!isOpen) parent.classList.add("open");
        });
    });
    // 바깥 클릭 시 닫기
    document.addEventListener("click", function () {
        document.querySelectorAll(".faq-actions.open").forEach((el) => el.classList.remove("open"));
    });
    // 드롭다운 메뉴의 a 클릭 시 닫기
    document.querySelectorAll(".faq-dropdown-menu a").forEach((link) => {
        link.addEventListener("click", function () {
            document.querySelectorAll(".faq-actions.open").forEach((el) => el.classList.remove("open"));
        });
    });
</script>
</body>
</html>
