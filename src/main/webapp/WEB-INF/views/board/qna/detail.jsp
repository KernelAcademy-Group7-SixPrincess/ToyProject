<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>고객 문의 - ${post.title}</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />
</head>
<body class="board qna">
<%@ include file="../../common/header.jsp" %>

<main>
  <%-- 질문 본문 --%>
  <article aria-labelledby="qna-title" class="board-detail qna-detail">
    <header>
      <h1 id="qna-title" class="board-title qna-title">${post.title}</h1>
      <p class="board-meta qna-meta">
        <time datetime="${post.isoDate}">${post.formattedDate}</time>
        | 글 번호: ${post.postId}
      </p>
    </header>

    <section class="board-content qna-content">
      <p class="markdown-content">${post.content}</p>
    </section>
  </article>


  <%-- 답변 보여주는 부분(수정 필요함) --%>
  <article aria-labelledby="qna-title" class="board-detail qna-detail">
    <header>
      <h2 id="qna-title" class="board-title qna-title">답변입니다.</h2>
    </header>

    <section class="board-content qna-content">
      <p class="markdown-content">${answer.content}</p>
      <p class="board-meta qna-meta">답변자: ${answer.writerName} | <time>${answer.formattedDate}</time></p>
    </section>
  </article>


  <%-- 글 조작 영역 --%>
  <nav class="board-actions qna-actions" aria-label="글 조작 버튼">
    <a href="/board/qna/${post.postId}/edit" class="button">수정</a>
    <form action="/board/qna/${post.postId}/delete" method="post" onsubmit="return confirm('삭제할까요?')" style="display: inline">
      <input type="hidden" name="id" value="3" />
      <button type="submit" class="button danger">삭제</button>
    </form>
    <a href="/board/qna" class="button">목록으로</a>
</nav>

  <%-- 댓글 영역 --%>
  <section class="answer-form-section" aria-labelledby="answer-title">
    <h2 id="answer-title" class="visually-hidden">답변 작성</h2>
    <form action="/comment/write" method="post" class="answer-form">
      <input type="hidden" name="postId" value="${post.postId}" />

      <label for="answer-content" class="answer-label visually-hidden">답변 내용</label>
      <textarea id="answer-content" name="content" rows="5" required class="answer-textarea"
                placeholder="답변을 입력하세요."></textarea>

      <button type="submit" class="answer-submit-btn">답변 등록</button>
    </form>
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
