<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 - ${post.title}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />
</head>
<body class="board notice">
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<main>
  <article aria-labelledby="notice-title" class="board-detail notice-detail">
    <header>
      <h1 id="notice-title" class="board-title notice-title">${post.title}</h1>
      <p class="board-meta notice-meta">
        <time datetime="${post.isoDate}">${post.formattedDate}</time>
        | 글 번호: ${post.postId}
      </p>
    </header>

    <section class="board-content notice-content">
      <p class="markdown-content">${post.content}</p>
    </section>
  </article>

  <nav class="notice-actions" aria-label="글 조작 버튼">
    <a href="/board/notice" class="button">목록으로</a>
    <a href="/board/notice/${post.postId}/edit" class="button primary admin-only">수정</a>
    <form action="/board/notice/${post.postId}/delete" method="post" onsubmit="return confirm('삭제할까요?')" class="admin-only">
      <input type="hidden" name="id" value="${post.postId}" />
      <button type="submit" class="button danger">삭제</button>
    </form>
  </nav>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/easyMDE.js"></script>
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
