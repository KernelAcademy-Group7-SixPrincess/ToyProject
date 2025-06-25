<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>이메일로 시작하기 - 저기어때</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/login.css" />
</head>
<body class="auth">
<%@ include file="../common/header.jsp" %>


<main class="container">
  <header class="auth-logo">
    <h1 class="visually-hidden">이메일로 시작하기</h1>
  </header>

  <section aria-labelledby="signup-heading" class="signup__title-wrap">
    <h2 class="email_title heading_title">이메일로 시작하기</h2>
  </section>

  <form action="/user/login" method="post" aria-labelledby="form-title">
    <div class="form-group">
      <label for="email" class="label">
        이메일
        <span aria-hidden="true" class="required"></span>
      </label>
      <input type="email" id="email" name="email" placeholder="abc@fastcampus.co.kr" required aria-required="true" />
      <span class="error_msg" role="alert" id="emailError">올바른 형식의 이메일 주소를 입력해주세요.</span>
    </div>

    <div class="form-group">
      <label for="password" class="label">
        비밀번호
        <span aria-hidden="true" class="required"></span>
      </label>
      <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." required aria-required="true" />
      <span class="error_msg" id="passwordError">8자 이상 입력해주세요.</span>
    </div>
<%--로그인 실패시 팝업창--%>
    <c:if test="${not empty loginError}">
      <script>
        alert("${loginError}");
      </script>
    </c:if>

    <button type="submit" class="login_btn submit_btn" disabled>로그인</button>
  </form>

  <div class="go-to-register">
    <p>계정이 없으신가요?</p>
    <a href="/user/signup">이메일로 회원가입</a>
  </div>
</main>

<%@ include file="../common/footer.jsp" %>


<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="module" src="${pageContext.request.contextPath}/resources/js/auth-validation/validationUtils.js"></script>
<script type="module" src="${pageContext.request.contextPath}/resources/js/auth-validation/loginValidation.js"></script>

<script>
  const emailInput = document.getElementById("email");
  const passwordInput = document.getElementById("password");
  const loginBtn = document.querySelector(".login_btn");

  function validateInputs() {
    const email = emailInput.value.trim();
    const password = passwordInput.value.trim();
    const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    const isPasswordValid = password.length >= 8;

    loginBtn.disabled = !(isEmailValid && isPasswordValid);
  }

  emailInput.addEventListener("input", validateInputs);
  passwordInput.addEventListener("input", validateInputs);
</script>


</body>
</html>
