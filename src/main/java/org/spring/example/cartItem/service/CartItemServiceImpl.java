package org.spring.example.cartItem.service;

import lombok.RequiredArgsConstructor;
import org.spring.example.cartItem.dto.CartItemDto;
import org.spring.example.mapper.CartItemMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartItemServiceImpl implements  CartItemService {
    private final CartItemMapper cartItemMapper;

    @Override
    public void createCartItem(CartItemDto cartItemDto) {
        cartItemMapper.createCartItem(cartItemDto);
    }

    @Override
    public List<CartItemDto> getCartItemsByCartId(long cartId) {
        return cartItemMapper.getCartItemsByCartId(cartId);
    }

    @Override
    public void deleteCartItemByCartItemId(long cartItemId) {
        cartItemMapper.deleteCartByCartItemId(cartItemId);
    }
}
