package org.spring.example.cartItem.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;
import org.spring.example.room.dto.Room;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Alias("CartItemDto")
public class CartItemDto {
    private long cartItemId;
    private long cartId;
    private Room room;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
