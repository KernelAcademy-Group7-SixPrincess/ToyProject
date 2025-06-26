package org.spring.example.review;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;

    public class ReviewUserDto {
        private BigInteger id; // BIGINT
        private String code_type_id; // VARCHAR(30) - 고객 직업 분류 ID
        private Integer code; // INT - 고객 직업 코드 값
        private String password; // VARCHAR(100) - 해시된 비밀번호
        private String name; // VARCHAR(50) - 실명
        private String gender; // CHAR(1) - 성별
        private String email; // VARCHAR(100) - 로그인 ID로 사용
        private LocalDate birth; // DATE
        private String phone; // VARCHAR(20)
        private String nickname; // VARCHAR(30) - 화면표시용 이름
        private LocalDateTime signup_at; // TIMESTAMP
        private String status; // VARCHAR(10) - ACTIVE, INACTIVE, BLOCKED 등
        private Integer point_balance; // INT - 포인트 보유량
        private LocalDateTime deleted_at; // TIMESTAMP
        private LocalDateTime created_at; // TIMESTAMP
        private LocalDateTime updated_at; // TIMESTAMP


        public ReviewUserDto() {
        }


        public ReviewUserDto(BigInteger id, String code_type_id, Integer code, String password, String name, String gender, String email, LocalDate birth, String phone, String nickname, LocalDateTime signup_at, String status, Integer point_balance, LocalDateTime deleted_at, LocalDateTime created_at, LocalDateTime updated_at) {
            this.id = id;
            this.code_type_id = code_type_id;
            this.code = code;
            this.password = password;
            this.name = name;
            this.gender = gender;
            this.email = email;
            this.birth = birth;
            this.phone = phone;
            this.nickname = nickname;
            this.signup_at = signup_at;
            this.status = status;
            this.point_balance = point_balance;
            this.deleted_at = deleted_at;
            this.created_at = created_at;
            this.updated_at = updated_at;
        }

        // --- Getter와 Setter 메서드 ---

        // --- Getter와 Setter 메서드 (모두 포함해야 함) ---
        public BigInteger getId() { return id; }
        public void setId(BigInteger id) { this.id = id; }
        public String getCodeTypeId() { return code_type_id; }
        public void setCodeTypeId(String codeTypeId) { this.code_type_id = code_type_id; }
        public Integer getCode() { return code; }
        public void setCode(Integer code) { this.code = code; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getGender() { return gender; }
        public void setGender(String gender) { this.gender = gender; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public LocalDate getBirth() { return birth; }
        public void setBirth(LocalDate birth) { this.birth = birth; }
        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }
        public String getNickname() { return nickname; }
        public void setNickname(String nickname) { this.nickname = nickname; }
        public LocalDateTime getSignupAt() { return signup_at; }
        public void setSignupAt(LocalDateTime signupAt) { this.signup_at = signup_at; }
        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
        public Integer getPointBalance() { return point_balance; }
        public void setPointBalance(Integer pointBalance) { this.point_balance = point_balance; }
        public LocalDateTime getDeletedAt() { return deleted_at; }
        public void setDeletedAt(LocalDateTime deletedAt) { this.deleted_at = deleted_at; }
        public LocalDateTime getCreatedAt() { return created_at; }
        public void setCreatedAt(LocalDateTime createdAt) { this.created_at = created_at; }
        public LocalDateTime getUpdatedAt() { return updated_at; }
        public void setUpdatedAt(LocalDateTime updatedAt) { this.updated_at = updated_at; }

        @Override
        public String toString() {
            return "UserDto{" +
                    "id=" + id +
                    ", email='" + email + '\'' +
                    ", name='" + name + '\'' +
                    '}';
        }
    }
