package org.spring.example.cartItem.service;

import org.spring.example.cartItem.dto.CartItemDto;

import java.util.List;

public interface CartItemService {
    void createCartItem(CartItemDto cartItemDto);
    List<CartItemDto> getCartItemsByCartId(long cartId);
    void deleteCartItemByCartItemId(long cartItemId);
}
