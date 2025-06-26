<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 6. 24.
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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


<main class="signup-success">
  <section class="success-wrap" style="text-align: center; padding: 80px 20px;">
    <h1 style="font-size: 28px; color: #333;">🎉 회원가입이 완료되었습니다!</h1>
    <p style="margin-top: 20px; font-size: 18px; color: #666;">
      이제 로그인하여 다양한 서비스를 이용하실 수 있습니다.
    </p>

    <div style="margin-top: 40px;">
      <a href="/user/login"
         style="display: inline-block; padding: 12px 24px; background-color: #007bff; color: white;
                border-radius: 8px; font-size: 16px; text-decoration: none;">
        로그인하러 가기
      </a>
    </div>
  </section>
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
