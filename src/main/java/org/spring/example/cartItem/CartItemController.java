package org.spring.example.cartItem;

import lombok.RequiredArgsConstructor;
import org.spring.example.room.dto.Room;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/users/{userId}/carts/{cartId}/items")
public class CartItemController {

    @PostMapping
    public void createCartItems(@PathVariable long userId, @PathVariable long cartId, @RequestParam long accId) {

    }

    @GetMapping
    public List<Room> getCartItems(@PathVariable long userId, @PathVariable String cartId) {
        return null;
    }

    @DeleteMapping("/{itemId}")
    public void updateCartItem(@PathVariable long userId, @PathVariable long cartId, @PathVariable long itemId) {

    }

}
