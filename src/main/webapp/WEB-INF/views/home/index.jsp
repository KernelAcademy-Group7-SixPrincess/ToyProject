<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>저기어때</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base/setting.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/main.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

    <!-- flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/calendar.css" />

    <!-- flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- 한글 locale 지원 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%--            <div class="nav__content-wrap guest" id="menu" hidden>--%>
<%--                <div class="guest-panel">--%>
<%--                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>--%>
<%--                </div>--%>
<%--                <ul class="nav__menu-lists">--%>
<%--                    <li><a href="/">국내숙소</a></li>--%>
<%--                    <li><a href="/board">고객센터</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>

<%--            <div class="nav__content-wrap user" id="menu" hidden>--%>
<%--                <div class="guest-panel">--%>
<%--                    <a href="/user/auth" class="auth-link">로그인/회원가입</a>--%>
<%--                </div>--%>
<%--                <ul class="nav__menu-lists">--%>
<%--                    <li><a href="/">국내숙소</a></li>--%>
<%--                    <li><a href="/board">고객센터</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</header>--%>
<%--<%@ include file="../common/header.jsp" %>--%>
<main>
    <section class="kv" aria-label="여행 숙소 검색 섹션">
        <div class="kv-wrap">
            <h1 class="kv-title">
                여수 풀빌라부터 발리 리조트까지,
                <br />
                여행할때 여기어때
            </h1>

            <section class="form-wrap" aria-labelledby="search-title">
                <h2 id="search-title" class="search-title">국내 숙소</h2>
                <div role="search" class="search-form" aria-label="여행 숙소 검색" >
                    <label for="search-input" class="visually-hidden">여행 숙소 검색</label>
                    <div class="search-input-wrapper input-style">
                        <svg width="20" height="20" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M8.85 16.1a6.707 6.707 0 004.394-1.642l-.027.034 3.4 3.508L18 16.574l-3.47-3.58A7.163 7.163 0 0015.7 9.05C15.7 5.156 12.633 2 8.85 2 5.067 2 2 5.156 2 9.05c0 3.894 3.067 7.05 6.85 7.05zm0-1.99c2.695 0 4.88-2.263 4.88-5.055S11.545 4 8.85 4 3.97 6.263 3.97 9.055s2.185 5.055 4.88 5.055z" fill="" />
                        </svg>
                        <input id="search-input" name="keyword" type="search" placeholder="여행지나 숙소를 검색해보세요." maxlength="50" autocomplete="off" autocapitalize="none" autocorrect="off" spellcheck="false" aria-autocomplete="list" />
                    </div>

                    <div class="input-style" aria-label="숙박 기간 선택">
                        <div class="date-picker-wrap">
                            <input type="text" id="date-range" name="checkDateInfo" class="input-keyword" placeholder="날짜를 선택하세요" readonly>
                        </div>
                    </div>

                        <div class="input-style" type="button" aria-label="인원 선택">
                            <input type="hidden" name="guests" id="guests-count-input" value="2" />
                            <svg width="20" height="20" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M10 9a3 3 0 10.002-6.001A3 3 0 0010 9zm-6.997 6.025C2.996 11.512 7.483 10 10 10c2.558 0 7.007 1.563 6.995 4.993 0 .058.002.104.003.146l.002.109c.004 1.06-.853 1.746-1.762 1.749-.602.004-5.232.002-5.232.002s-3.87.009-5.206-.001c-1.335-.01-1.796-1.13-1.8-1.692l.002-.188v-.093z" fill="" />
                            </svg>
                            <span class="guest-label">인원</span>
                            <span class="guest-count-text">2</span>
                            <button type="button" class="guest-btn minus">–</button>
                            <button type="button" class="guest-btn plus">+</button>
                        </div>

                    <button type="submit" class="search-btn" onclick="doSearch()">검색</button>
                </div>
            </section>
        </div>
        <img alt="상단 메인 이미지" src="https://static.yeogi.com/_next/static/media/03_Kv_PC_Light_B.fcfed8ce.webp" decoding="async" class="main-image" />
    </section>

    <!-- 여행지! -->
    <section class="recommend" aria-label="인기 여행지 추천 섹션">
        <h1 class="title">국내 추천 여행지</h1>
        <div class="swiper-container">
            <div class="swiper">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=jeju">
                            <img
                                    alt="제주도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_jeju_03_20231103163922.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_jeju_03_20231103163922.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_jeju_03_20231103163922.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_jeju_03_20231103163922.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>제주</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=seoul">
                            <img
                                    alt="서울 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Seoul_03_20231103163936.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Seoul_03_20231103163936.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Seoul_03_20231103163936.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Seoul_03_20231103163936.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>서울</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=busan">
                            <img
                                    alt="부산 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Busan_03_20231103163951.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Busan_03_20231103163951.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Busan_03_20231103163951.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Busan_03_20231103163951.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>부산</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=gangwon">
                            <img
                                    alt="강원도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gangneung_03_20231103164004.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gangneung_03_20231103164004.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gangneung_03_20231103164004.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gangneung_03_20231103164004.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>강원</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=incheon">
                            <img
                                    alt="인천 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Incheon_03_20231103164014.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Incheon_03_20231103164014.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Incheon_03_20231103164014.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Incheon_03_20231103164014.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>인천</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=gyeongbuk">
                            <img
                                    alt="경상북도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gyeongju_03_20231103164027.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gyeongju_03_20231103164027.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gyeongju_03_20231103164027.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Gyeongju_03_20231103164027.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>경북</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=gyeongnam">
                            <img
                                    alt="경상남도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Haeundae_03_20231103164044.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Haeundae_03_20231103164044.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Haeundae_03_20231103164044.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Haeundae_03_20231103164044.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>경남</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=gyeonggi">
                            <img
                                    alt="경기도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Gapyeong_03_20231103164056.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Gapyeong_03_20231103164056.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Gapyeong_03_20231103164056.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region__Gapyeong_03_20231103164056.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>경기</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=jeonnam">
                            <img
                                    alt="전라남도 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Yeo_su_03_20231103164109.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Yeo_su_03_20231103164109.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Yeo_su_03_20231103164109.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Yeo_su_03_20231103164109.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>전남</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/acclist?region=daejeong">
                            <img
                                    alt="대전 여행"
                                    sizes="100vw"
                                    srcset="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Sokcho_02_20231117140152.png 340w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Sokcho_02_20231117140152.png 912w, https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Sokcho_02_20231117140152.png 1200w"
                                    src="https://image.goodchoice.kr/resize_360x360/exhibition/cms/Region_Sokcho_02_20231117140152.png"
                                    decoding="async"
                                    data-nimg="fill"
                                    class="gc-curation-card-image absolute top-Spacing0 left-Spacing0 desktop:hover:bg-backgroundOverlayDarkInactive"
                                    loading="lazy"
                            />
                            <span>대전</span>

                        </a>
                    </li>
                </ul>
            </div>
            <div class="swiper-button swiper-button-prev">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-ljfiaz">
                    <path d="M12.98 14.594L11.573 16l-4.986-4.594a1.978 1.978 0 010-2.812c.52-.518 2.19-2.049 5.007-4.594l1.401 1.392L7.975 10l5.005 4.594z" fill=""></path>
                </svg>
            </div>
            <div class="swiper-button swiper-button-next">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-ljfiaz">
                    <path d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z" fill=""></path>
                </svg>
            </div>
        </div>
    </section>
</main>

<%@ include file="../common/footer.jsp" %>

    <section class="footer-bottom">
        <address>
            (주)여기어때컴퍼니
            <br />
            주소: 서울특별시 강남구 봉은사로 479, 11층 | 대표이사: 정명훈 | 사업자등록번호: 742-86-00224
            <br />
            이메일: help@yeogi.com | 통신판매번호: 2017-서울강남-01779
        </address>
        <p>
            <a href="/policy/terms#TERMS" target="_blank">이용약관</a>
            <a href="/policy/terms#PRIVACY_POLICY" target="_blank">개인정보처리방침</a>

            <a href="/policy/terms#CONSUMER_DISPUTE_RESOLUTION_STANDARD" target="_blank">소비자 분쟁해결 기준</a>
        </p>
    </section>
</footer>

<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/swiper.js"></script>
<script>

    let fp;

    document.addEventListener("DOMContentLoaded", function() {
        fp = flatpickr("#date-range", {
            locale: flatpickr.l10ns.ko,
            mode: "range",
            dateFormat: "m.d(D)",
            minDate: "today",
            allowInput: false
        });
    });
</script>
</body>
</html>