package org.spring.example.cart.service;

import lombok.RequiredArgsConstructor;
import org.spring.example.cart.dto.CartDto;
import org.spring.example.mapper.CartMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements  CartService {
    private final CartMapper cartMapper;

    @Override
    public void createCartByCartDto(CartDto cartDto) {
        cartMapper.createCart(cartDto);
    }

    @Override
    public List<CartDto> getCartListByUserId(long userId) {
        return cartMapper.getCartListByUserId(userId);
    }

    @Override
    public void updateCartByCartDto(CartDto cartDto) {
        cartMapper.updateCartByCartDto(cartDto);
    }

    @Override
    public void deleteCartByCartId(long cartId) {
        cartMapper.deleteCartByCartId(cartId);
    }
}
