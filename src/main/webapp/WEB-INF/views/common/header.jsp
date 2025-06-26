<%@ page import="org.spring.example.user.dto.UserinfoDto" %>
<%@ page import="org.spring.example.user.dto.UserContextDto" %><%--<%@ page import="org.spring.example.user.dto.UserinfoDto" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: hyeonjeong
  Date: 2025. 6. 18.
  Time: 오후 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//   로그인한 사용자 정보 가져오기
  UserContextDto loginUser = (UserContextDto) session.getAttribute("loginUser");

%>
<header class="site-header">
  <nav class="nav" aria-label="메인 메뉴">
    <div class="nav__logo">
      <a href="/" class="nav__logo-link" aria-label="홈으로 이동">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 106 18" class="logo-svg" role="img" aria-hidden="true" focusable="false">
          <title>사이트 로고</title>
          <path
                  d="M94.8 18V6.7c0-.4-.3-.8-.8-.8-.4 0-.8.3-.8.8V18h-5.1V5.9C88.1 2.6 90.8 0 94 0s5.9 2.6 5.9 5.9V18h-5.1zm-9.5-5.1h1.8V18H76.9c-2.3 0-4.1-1.8-4.1-4.1V4.1c0-2.3 1.8-4.1 4.1-4.1h10.2v5.1h-1.8v7.8zm-4.5 0V5.1H79c-.6 0-1 .5-1 1v5.7c0 .6.5 1 1 1l1.8.1zM19.4 3.3v-.7c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-3.3h-3.5c-1.6 2-4.1 3.3-6.9 3.3C4 18 0 14 0 9s4-9 8.9-9c2.8 0 5.3 1.3 6.9 3.3h3.6zM17.8 8c0 .3.1.7.1 1s0 .7-.1 1h1.6V8h-1.6zm-8.9 5.1c2.3 0 4.1-1.8 4.1-4.1s-1.8-4.1-4.1-4.1S4.8 6.7 4.8 9s1.9 4.1 4.1 4.1zM38.3 1.2c.7.7 1.2 1.8 1.2 2.9V18h-5.1V6.2c0-.6-.5-1-1-1h-5.6c-1.4 0-2.5-1.2-2.5-2.6S26.4 0 27.8 0h7.6c1.1 0 2.2.5 2.9 1.2zM43.1 0c1.4 0 2.5 1.2 2.5 2.6V18h-5.1V2.6c0-1.4 1.1-2.6 2.6-2.6zm23.1 6.4V2.6c0-1.4 1.1-2.6 2.5-2.6s2.5 1.2 2.5 2.6V18h-5.1v-6.4h-1.9c-1.1 3.7-4.5 6.4-8.5 6.4-4.9 0-8.9-4-8.9-9s4-9 8.9-9c4 0 7.4 2.7 8.5 6.4h2zm-10.4 6.7c2.3 0 4.1-1.8 4.1-4.1S58 4.9 55.8 4.9 51.7 6.7 51.7 9s1.8 4.1 4.1 4.1zm47.6 4.9c-1.4 0-2.5-1.2-2.5-2.6s1.1-2.6 2.5-2.6 2.5 1.2 2.5 2.6-1.1 2.6-2.5 2.6z"
                  fill=""
          ></path>
        </svg>
      </a>
    </div>

    <div class="nav__actions">
      <% if (loginUser == null) { %>
        <div class="btn-wrap guest">
          <a href="/user/auth" class="site-header__auth-link">로그인/회원가입</a>

          <button class="nav__menu-btn guest" aria-label="메뉴 열기" aria-controls="guest-menu" aria-expanded="false">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
              <path d="M2 4h16v2H2V4zM2 14h16v2H2v-2zM18 9H2v2h16V9z" fill=""></path>
            </svg>
          </button>

          <div class="nav__content-wrap guest" id="guest-menu" hidden>
            <div class="guest-panel">
              <a href="/user/auth" class="auth-link">로그인/회원가입</a>
            </div>
            <ul class="nav__menu-lists">
              <li><a href="/">국내숙소</a></li>
              <li><a href="/board/notice">공지사항</a></li>
              <li><a href="/board/faq">자주묻는질문</a></li>
              <li><a href="/board/qna">고객문의</a></li>
            </ul>
          </div>
        </div>
      <% } else { %>
      <button class="nav__menu-btn user" aria-label="메뉴 열기" aria-controls="user-menu" aria-expanded="false">
      <div class="nav__actions user" id="userMenuToggle">
        <div class="user__name-wrap">
          <img alt="프로필 이미지"
               src="https://image.goodchoice.kr/profile/ico/ico_21.png"
               width="26" height="26" />
          <h2 class="nickname"><%= loginUser.getNickname() %></h2>
        </div>
        <svg width="20" height="20" viewBox="0 0 20 20" fill="rgb(51, 51, 51)" xmlns="http://www.w3.org/2000/svg">
          <path d="M2 4h16v2H2V4zM2 14h16v2H2v-2zM18 9H2v2h16V9z"></path>
        </svg>
      </div>
        <div class="nav__content-wrap user" id="userDropdownMenu" hidden>
          <ul class="nav__menu-lists">
            <li><a href="/">국내숙소</a></li>
            <li><a href="/board/notice">공지사항</a></li>
            <li><a href="/board/faq">자주묻는질문</a></li>
            <li><a href="/board/qna">고객문의</a></li>
            <li><a href="/user/logout">로그아웃</a></li>
          </ul>
        </div>
      </button>
      <% } %>
    </div>


  </nav>
</header>