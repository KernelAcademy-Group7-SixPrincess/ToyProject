package org.spring.example.cart.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
public class CartDto {
    private long id;
    private long userId;
    private String name;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}