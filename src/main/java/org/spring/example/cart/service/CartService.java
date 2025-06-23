package org.spring.example.cart.service;

import org.spring.example.cart.dto.CartDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CartService {
    void createCartByCartDto(CartDto cartDto);
    List<CartDto> getCartListByUserId(long userId);
    void updateCartByCartDto(CartDto cartDto);
    void deleteCartByCartId(long cratId);

}
