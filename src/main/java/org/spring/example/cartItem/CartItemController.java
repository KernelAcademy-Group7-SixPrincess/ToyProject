package org.spring.example.cartItem;

import lombok.RequiredArgsConstructor;
import org.spring.example.cartItem.dto.CartItemDto;
import org.spring.example.cartItem.service.CartItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartItemController {
    private final CartItemService cartItemService;

    @PostMapping("{cartId}/items")
    public void createCartItem(CartItemDto cartItemDto) {
        cartItemService.createCartItem(cartItemDto);
    }

    @GetMapping("/{cartId}/items")
    public List<CartItemDto> getCartItemsByCartId(@PathVariable long cartId) {
        return cartItemService.getCartItemsByCartId(cartId);
    }

    @DeleteMapping("/items/{cartItemId}")
    public void deleteCartItemByCartItemId(@PathVariable long cartItemId) {
        cartItemService.deleteCartItemByCartItemId(cartItemId);
    }

}
