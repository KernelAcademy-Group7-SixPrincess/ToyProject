<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background: #fff; font-family: 'Noto Sans KR', sans-serif; }
    .form-container { max-width: 500px; margin: 50px auto; padding: 30px; border: 1px solid #ddd; border-radius: 10px; }
    .form-title { font-size: 20px; font-weight: bold; margin-bottom: 20px; }
  </style>
</head>
<body>
<div class="form-container">
  <div class="form-title">필수 정보 입력</div>
  <form action="/user/signok" method="post">

    <!-- 이름 -->
    <div class="mb-3">
      <label class="form-label">이름 *</label>
      <input type="text" name="name" class="form-control" placeholder="홍길동" required />
    </div>


    <!-- 이메일 -->
    <div class="mb-3">
      <label class="form-label">이메일 *</label>
      <input type="email" name="email" class="form-control" placeholder="abc@example.com" required />
    </div>

    <!-- 비밀번호 -->
    <div class="mb-3">
      <label class="form-label">비밀번호 *</label>
      <input type="password" name="password" class="form-control" minlength="8" required />
    </div>

    <!-- 비밀번호 확인 -->
    <div class="mb-3">
      <label class="form-label">비밀번호 확인 *</label>
      <input type="password" name="confirmPassword" class="form-control" required />
    </div>

    <!-- 휴대폰 번호 -->
    <div class="mb-3">
      <label class="form-label">휴대폰 번호 *</label>
      <input type="tel" name="phone" class="form-control" placeholder="010-1234-5678" pattern="^01[0-9]-\d{3,4}-\d{4}$" required />
      <small class="text-muted">예: 010-1234-5678 형식으로 입력</small>
    </div>

<%--    <!-- 생년월일 -->--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">생년월일 *</label>--%>
<%--      <div class="d-flex gap-2">--%>
<%--        <select name="birthYear" class="form-select" required>--%>
<%--          <option value="">년도</option>--%>
<%--          <% for (int i = 2024; i >= 1940; i--) { %>--%>
<%--          <option value="<%=i%>"><%=i%></option>--%>
<%--          <% } %>--%>
<%--        </select>--%>
<%--        <select name="birthMonth" class="form-select" required>--%>
<%--          <option value="">월</option>--%>
<%--          <% for (int i = 1; i <= 12; i++) { %>--%>
<%--          <option value="<%=i%>"><%=i%></option>--%>
<%--          <% } %>--%>
<%--        </select>--%>
<%--        <select name="birthDay" class="form-select" required>--%>
<%--          <option value="">일</option>--%>
<%--          <% for (int i = 1; i <= 31; i++) { %>--%>
<%--          <option value="<%=i%>"><%=i%></option>--%>
<%--          <% } %>--%>
<%--        </select>--%>
<%--      </div>--%>
<%--    </div>--%>

    <!-- 생년월일 -->
    <div class="mb-3">
      <label class="form-label">생년월일 *</label>
      <input type="date" name="birth" class="form-control" required />
    </div>

    <!-- 성별 -->
    <div class="mb-3">
      <label class="form-label">성별 *</label><br/>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" value="F" required>
        <label class="form-check-label">여자</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" value="M">
        <label class="form-check-label">남자</label>
      </div>
    </div>

    <!-- 직업 -->
    <div class="mb-3">
      <label class="form-label">직업 *</label>
      <select name="job" class="form-select" required>
        <option value="">선택</option>
        <option value="student">학생</option>
        <option value="developer">개발자</option>
        <option value="designer">디자이너</option>
        <option value="teacher">교사</option>
        <option value="etc">기타</option>
      </select>
    </div>

    <!-- 닉네임 -->
    <div class="mb-3">
      <label class="form-label">닉네임 *</label>
      <input type="text" name="nickname" class="form-control" required />
    </div>

    <!-- 제출 -->
    <div class="d-grid">
      <button type="submit" class="btn btn-primary">가입하기</button>
    </div>
  </form>
</div>
</body>
</html>
