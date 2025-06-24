package org.spring.example.cartItem;

import static org.assertj.core.api.Assertions.assertThat;

import lombok.RequiredArgsConstructor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.cartItem.dto.CartItemDto;
import org.spring.example.cartItem.service.CartItemService;
import org.spring.example.room.dto.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class CartItemServiceTest {
    @Autowired
    private CartItemService cartItemService;

    public CartItemDto getTestCartItemDto() {
        return CartItemDto.builder()
                .cartId(40L)
                .room(Room.builder().roomId(1L).build())
                .build();
    }

    @Transactional
    @Rollback
    @Test
    public void createCartItemTest() {
        //Given
        CartItemDto cartItemDto = getTestCartItemDto();
        cartItemService.createCartItem(cartItemDto);

        //When
        CartItemDto cartItemDto2 = cartItemService.getCartItemsByCartId(cartItemDto.getCartId()).get(0);

        //Then
        assertThat(cartItemDto2).isNotNull();
        assertThat(cartItemDto2.getCartItemId()).isEqualTo(cartItemDto.getCartItemId());
        assertThat(cartItemDto2.getRoom().getRoomId()).isEqualTo(1L);
    }

    @Transactional
    @Rollback
    @Test
    public void getCartItemsByCartIdTest() {
        //Given
        List<CartItemDto> cartItemDtoList = new ArrayList<>();
        long cartId = 40L;
        for(int i = 0; i < 10; i++) {
            CartItemDto cartItemDto = getTestCartItemDto();
            cartItemService.createCartItem(cartItemDto);
            cartItemDtoList.add(cartItemDto);
        }

        //When
        List<CartItemDto> cartItemDtoList1 = cartItemService.getCartItemsByCartId(cartId);

        //Then
        assertThat(cartItemDtoList1).isNotNull();
        assertThat(cartItemDtoList1.size()).isEqualTo(10);
        System.out.println(cartItemDtoList1);
    }

    @Transactional
    @Rollback
    @Test
    public void deleteCartItemByCartItemIdTest() {
        //Given
        CartItemDto cartItemDto = getTestCartItemDto();
        cartItemService.createCartItem(cartItemDto);

        //When
        cartItemService.deleteCartItemByCartItemId(cartItemDto.getCartItemId());
        List<CartItemDto> cartItemDtoList = cartItemService.getCartItemsByCartId(cartItemDto.getCartItemId());

        //Then
        assertThat(cartItemDtoList.size()).isEqualTo(0);
    }
}
