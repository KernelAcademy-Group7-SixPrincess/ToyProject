package org.spring.example.mapper;

import org.spring.example.cartItem.dto.CartItemDto;

import java.util.List;

public interface CartItemMapper {
    void createCartItem(CartItemDto cartItemDto);
    List<CartItemDto> getCartItemsByCartId(long cartId);
    void deleteCartByCartItemId(long cratItemId);
}
