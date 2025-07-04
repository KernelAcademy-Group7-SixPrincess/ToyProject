# 🛒 ToyProject1: 쇼핑몰 구축을 위한 DB 모델링

## 📌 프로젝트 개요
- **프로젝트 명**: 쇼핑몰 구축을 위한 DB모델링
- **목표**: 쇼핑몰 사이트에 필요한 데이터베이스를 설계하고 구축한다.
- **벤치마킹 사이트**: 여기어때 (판매자/소비자/관리자 구조 기반)

---

## 📌 프로젝트 진행 내용

### 1. 벤치마킹 & 요구사항 분석
- 판매자, 소비자, 관리자 역할 분석
- 화면정의서, 기능 흐름 파악

### 2. 화면 정의서 (Figma)
- 전체 서비스 흐름을 기준으로 화면별 정의 구성  
- **[👉 화면정의서 바로가기 (Figma)](https://www.figma.com/design/rIQFoS2PTiJjSOlhlLK3Ra/7%EC%A1%B0-%ED%99%94%EB%A9%B4-%EC%A0%95%EC%9D%98%EC%84%9C--%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EC%A0%95%EC%9D%98%EC%84%9C?node-id=0-1&t=ne30uba0EHWveAzK-1)**  

### 3. 논리 모델링 (ERD)
- **ERD Tool**: ERDCloud 사용  
- **작성 기준**: 고객, 상품, 주문, 결제, 정산, 카테고리, 코드 테이블 포함  
- **주요 관계 설명**:  
  - 고객 ↔ 주문 ↔ 결제  
  - 판매자 ↔ 상품 ↔ 카테고리  
  - 관리자 ↔ 판매자 승인 흐름

> ERD 전체 이미지 캡처:

![ERD 논리 모델링 캡처](./images/yeogi_Benchmarking.png)



### 4. 발표 자료 (Google Docs)
- **[👉 PPT 바로가기 (Figma)](https://docs.google.com/presentation/d/1qmwcCL1dfyikTTQWJc1J7Y3-UYxVyWhAIQWyliEs4sg/edit?usp=sharing)**  
