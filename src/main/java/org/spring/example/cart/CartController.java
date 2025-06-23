package org.spring.example.cart;

import lombok.RequiredArgsConstructor;
import org.spring.example.cart.dto.CartDto;
import org.spring.example.cart.service.CartService;
import org.spring.example.room.dto.Room;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users/{userId}")
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;

    //TODO: 사용자 로그인 확인 추가

    @PostMapping("/carts")
    public void createCart(@PathVariable long userId, @RequestParam String name) {
        CartDto cartDto = CartDto.builder().userId(userId).name(name).build();
        cartService.createCartByCartDto(cartDto);
    }

    @GetMapping("/carts")
    public List<CartDto> getCartList(@PathVariable long userId) {
        return cartService.getCartListByUserId(userId);
    }

    @PutMapping("/carts/{cartId}")
    public void updateCart(@PathVariable long userId, @PathVariable long cartId, @RequestParam String name) {
        CartDto cartDto = CartDto.builder().cartId(cartId).userId(userId).name(name).build();
        cartService.updateCartByCartDto(cartDto);
    }

    @DeleteMapping("/carts/{cartId}")
    public void deleteCart(@PathVariable long userId, @PathVariable long cartId) {
        cartService.deleteCartByCartId(cartId);
    }
}
