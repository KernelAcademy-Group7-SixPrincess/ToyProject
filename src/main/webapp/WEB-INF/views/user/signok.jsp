<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 6. 20.
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 완료</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">회원가입 정보 확인</h2>

    <ul class="list-group">
        <li class="list-group-item"><strong>이메일:</strong> ${user.email}</li>
        <li class="list-group-item"><strong>비밀번호:</strong> ${user.password}</li>
        <li class="list-group-item"><strong>휴대폰 번호:</strong> ${user.phone}</li>
        <li class="list-group-item"><strong>생년월일:</strong> ${user.birth}</li>
        <li class="list-group-item"><strong>성별:</strong> ${user.gender}</li>
        <li class="list-group-item"><strong>직업:</strong> ${user.job}</li>
        <li class="list-group-item"><strong>닉네임:</strong> ${user.nickname}</li>
    </ul>

    <div class="mt-4">
        <a href="user/login" class="btn btn-primary">로그인 페이지로 이동</a>
    </div>
</div>
</body>
</html>

