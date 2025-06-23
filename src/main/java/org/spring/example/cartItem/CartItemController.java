package org.spring.example.cartItem;

import lombok.RequiredArgsConstructor;
import org.spring.example.cartItem.dto.CartItemDto;
import org.spring.example.cartItem.service.CartItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/users/{userId}/carts/{cartId}/items")
public class CartItemController {
    private final CartItemService cartItemService;

    @PostMapping
    public void createCartItem(@PathVariable long userId, @PathVariable long cartId, CartItemDto cartItemDto) {
        cartItemService.createCartItem(cartItemDto);
    }

    @GetMapping
    public List<CartItemDto> getCartItemsByCartId(@PathVariable long userId, @PathVariable String cartId) {
        return cartItemService.getCartItemsByCartId(Long.parseLong(cartId));
    }

    @DeleteMapping("/{cartItemId}")
    public void deleteCartItemByCartItemId(@PathVariable long userId, @PathVariable long cartId, @PathVariable long cartItemId) {
        cartItemService.deleteCartItemByCartItemId(cartItemId);
    }

}
