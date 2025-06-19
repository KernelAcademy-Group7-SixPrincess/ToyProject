//package org.spring.example.common;
//
//import lombok.Builder;
//import lombok.Getter;
//import lombok.RequiredArgsConstructor;
//
//
///**
// * API 통합 응답 DTO 클래스입니다.
// * <p>
// *     모든 API 응답은 이 클래스를 통해 일관된 형태로 반환됩니다. <br>
// *     - success(boolean) : 요청 성공(true)/실패(false) <br>
// *     - code(int) : 상태코드 <br>
// *     - message(String) : 에러 발생시 에러 메세지 <br>
// *     - data(Object) : 응답에 들어갈 데이터 <br>
// *     - path(String) : 요청 URL <br>
// *     - redirectUrl(String) : 리다이렉트 시 URL
// * </p>
// * 불변 객체이며, {@link Builder} 패턴으로 생성합니다.
// * @author SeungminShin97
// * @since 2025.06.18
// */
//@Getter
//@Builder
//@RequiredArgsConstructor
//public class APIResponse {
//    /**
//     * 요청 성공(true)/실패(false)
//     */
//    private final boolean success;
//    /**
//     * 상태코드
//     */
//    private final int code;
//    /**
//     * 에러 발생시 에러 메세지
//     */
//    private final String message;
//    /**
//     * 응답에 들어갈 데이터
//     */
//    private final Object data;
//
//    /**
//     * 요청 URL
//     */
//    private final String path;
//    /**
//     * 리다이렉트 시 URL
//     */
//    private final String redirectUrl;
//}
