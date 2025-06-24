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
<%@ include file="../../common/header.jsp" %>


<main>
    <section aria-labelledby="faq-title">
        <h1 id="faq-title" class="faq-title board-title">자주 묻는 질문</h1>

        <form action="/board/faq" method="get">
            <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword != null ? keyword : ''}" />
            <button type="submit">검색</button>
        </form>

<%--        <c:if test="${isAdmin}">--%>
            <a href="/board/faq/write" class="write-btn" role="button">
                <span aria-hidden="true">✏️</span>
                <span>글쓰기</span>
            </a>
<%--        </c:if>--%>



        <ul class="accordion" role="region" aria-labelledby="faq-title">
            <c:forEach items="${normalPosts}" var="faq" varStatus="status">
                <li class="accordion-item">
                    <button type="button" class="accordion-trigger" aria-expanded="false" aria-controls="faq${status.index + 1}" id="accordion-header-${status.index + 1}">
                        <span>Q</span>
                        ${faq.title}
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="accordion-icon rotate"><path d="M5.406 12.98L4 11.573l4.594-4.986a1.978 1.978 0 012.812 0c.518.52 2.05 2.19 4.594 5.007l-1.392 1.401L10 7.975 5.406 12.98z" fill=""></path></svg>
                    </button>
                    <div id="faq${status.index + 1}" role="region" class="accordion-panel" aria-labelledby="accordion-header-${status.index + 1}">
                        <p class="markdown-content">${faq.content}</p>
                        <nav class="notice-actions" aria-label="글 조작 버튼">
                            <a href="/board/faq/${faq.postId}/edit" class="button">수정</a>
                            <form action="/board/faq/${faq.postId}/delete" method="post" onsubmit="return confirm('삭제할까요?')" style="display: inline">
                                <input type="hidden" name="id" value="3" />
                                <button type="submit" class="button danger">삭제</button>
                            </form>
                        </nav>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>
</main>

<%@ include file="../../common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        // 모든 faq 본문 <p> 태그들을 찾아서
        const faqAnswers = document.querySelectorAll(".accordion-panel > p");

        faqAnswers.forEach(p => {
            const rawText = p.innerText; // 마크다운 원문 (개행도 포함)
            const html = marked.parse(rawText); // 마크다운 → HTML 변환
            p.innerHTML = html; // 변환한 HTML로 대체
        });
    });
</script>
</body>
</html>
