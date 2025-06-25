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
  <section class="qna-question-box" aria-labelledby="qna-title">
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
  </section>

  <section class="qna-comment-list">
    <c:forEach var="answer" items="${commentList}">
      <article class="qna-comment-card" data-comment-id="${answer.commentId}">
        <div class="qna-comment-meta">
          <span class="qna-comment-writer">${answer.writerName}</span>
          <span class="qna-comment-date">${answer.formattedDate}</span>
        </div>
        <div class="qna-comment-content">
          <p class="markdown-content comment-content">${answer.content}</p>
          <textarea class="edit-textarea hide">${answer.content}</textarea>
        </div>
        <div class="qna-comment-actions">
          <button class="edit-btn">수정</button>
          <button class="save-btn hide">저장</button>
          <button class="delete-btn">삭제</button>
        </div>
      </article>
    </c:forEach>
  </section>

  <section class="qna-answer-form-box" aria-labelledby="answer-title">
    <h2 id="answer-title" class="qna-answer-form-title">답변 작성</h2>
    <form action="/comment/write" method="post" class="qna-answer-form">
      <input type="hidden" name="postId" value="${post.postId}" />
      <label for="answer-content" class="visually-hidden">답변 내용</label>
      <textarea id="answer-content" name="content" rows="4" required class="qna-answer-textarea" placeholder="답변을 입력하세요."></textarea>
      <button type="submit" class="qna-answer-submit-btn">등록</button>
    </form>
  </section>

  <nav class="notice-actions" aria-label="글 조작 버튼">
    <a href="/board/qna" class="button">목록으로</a>
    <a href="/board/qna/${post.postId}/edit" class="button primary admin-only">수정</a>
    <form action="/board/qna/${post.postId}/delete" method="post" onsubmit="return confirm('삭제할까요?')" class="admin-only">
      <input type="hidden" name="id" value="${post.postId}" />
      <button type="submit" class="button danger">삭제</button>
    </form>
  </nav>
</main>


<%@ include file="../../common/footer.jsp" %>


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
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const commentElements = document.querySelectorAll(".comment");

    commentElements.forEach(function (el) {
      const editBtn = el.querySelector(".edit-btn");
      const saveBtn = el.querySelector(".save-btn");
      const deleteBtn = el.querySelector(".delete-btn");
      const contentEl = el.querySelector(".comment-content");
      const textarea = el.querySelector(".edit-textarea");
      const commentId = el.dataset.commentId;

      console.log(editBtn, saveBtn, deleteBtn, contentEl, textarea, commentId);

      editBtn.addEventListener("click", function () {
        contentEl.classList.add("hide");
        textarea.classList.remove("hide");
        editBtn.classList.add("hide");
        saveBtn.style.display = "inline";

        console.log("수정버튼 눌렀슴니다")
      });

      saveBtn.addEventListener("click", function () {
        const updatedContent = textarea.value;

        fetch("/comment/update", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: `commentId=${commentId}&content=${encodeURIComponent(updatedContent)}`
        })
                .then(res => res.ok ? res.text() : Promise.reject())
                .then(() => {
                  contentEl.textContent = updatedContent;
                  contentEl.style.display = "block";
                  textarea.style.display = "none";
                  editBtn.style.display = "inline";
                  saveBtn.style.display = "none";
                })
                .catch(() => alert("수정에 실패했습니다."));
      });


      deleteBtn.addEventListener("click", function () {
        if (!confirm("정말 삭제할까요?")) return;

        fetch("/comment/delete", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: `commentId=${commentId}`
        })
                .then(res => res.ok ? res.text() : Promise.reject())
                .then(() => {
                  el.remove(); // 화면에서 제거
                })
                .catch(() => alert("삭제에 실패했습니다."));
      });
    });
  });
</script>
</body>
</html>
