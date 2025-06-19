package org.spring.example.domain;

public class UserTest {
    private Long user_id;
    private String name;
    private String email;

    // 기본 생성자
    public UserTest() {}

    // getter, setter
    public Long getUser_id() { return user_id; }
    public void setUser_id(Long user_id) { this.user_id = user_id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
