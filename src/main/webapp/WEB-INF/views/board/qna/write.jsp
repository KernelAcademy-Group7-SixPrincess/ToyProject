<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>고객문의 - 문의 남기기</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/board.css" />

  <!-- EasyMDE 마크다운 에디터 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.css">
<body class="board qna">
<%@ include file="../../common/header.jsp" %>

<main>
  <section aria-labelledby="write-title">
    <h1 id="write-title" class="write-title qna-title">고객 문의 - 문의 남기기</h1>

    <form action="/board/qna/submit" method="post" class="write-form">
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required />
      </div>

      <div class="form-group">
        <label for="content">내용</label>
        <textarea id="content" name="content" rows="10"></textarea>
      </div>


      <div class="form-actions">
        <button type="submit" class="submit-btn">작성 완료</button>
        <a href="/board/qna" class="cancel-link" role="button">취소</a>
      </div>
    </form>
  </section>
</main>

<%@ include file="../../common/footer.jsp" %>



<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.js"></script>
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
