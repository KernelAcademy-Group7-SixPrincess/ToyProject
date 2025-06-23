package org.spring.example.mapper;

import org.spring.example.cart.dto.CartDto;

import java.util.List;

public interface CartMapper {
    void createCart(CartDto cartDto);
    List<CartDto> getCartListByUserId(long userId);
    void updateCartByCartDto(CartDto cartDto);
    void deleteCartByCartId(long cratId);
}