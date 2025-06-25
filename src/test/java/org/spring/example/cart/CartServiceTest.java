package org.spring.example.cart;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.cart.dto.CartDto;
import org.spring.example.cart.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class CartServiceTest {

    @Autowired
    private CartService cartService;

    public CartDto createTestCartDto() {
        return CartDto.builder()
                .userId(1L)
                .name("asdf").build();
    }

    @Transactional
    @Rollback
    @Test
    public void createCartTest() {
        //Given
        CartDto cartDto = createTestCartDto();
        cartService.createCartByCartDto(cartDto);
        long userId = cartDto.getUserId();

        //When
        CartDto cartDto1 = cartService.getCartListByUserId(userId).get(0);

        //Then
        assertThat(cartDto1).isNotNull();
        assertThat(cartDto1).usingRecursiveComparison()
                .ignoringFields("createdAt","updatedAt").isEqualTo(cartDto);
    }

    @Transactional
    @Rollback
    @Test
    public void  getCartByUserIdTest() {
        //Given
        CartDto cartDto = null;
        List<CartDto> cartDtos = new ArrayList<>();
        for(int i = 0; i < 10; i++) {
            cartDto = createTestCartDto();
            cartService.createCartByCartDto(cartDto);
            cartDtos.add(cartDto);
        }
        long userId = cartDto.getUserId();

        //When
        List<CartDto> cartDtoList = cartService.getCartListByUserId(userId);

        //Then
        assertThat(cartDtoList).isNotNull();
        assertThat(cartDtoList.size()).isEqualTo(10);
        assertThat(cartDtoList).usingRecursiveComparison()
                .ignoringFields("createdAt","updatedAt").isEqualTo(cartDtos);
    }

    @Transactional
    @Rollback
    @Test
    public void updateCartTest() {
        //Given
        CartDto cartDto = createTestCartDto();
        cartService.createCartByCartDto(cartDto);
        long userId = cartDto.getUserId();

        //When
        cartDto.setName("qwer");
        cartService.updateCartByCartDto(cartDto);
        CartDto cartDto1 = cartService.getCartListByUserId(userId).get(0);

        //Then
        assertThat(cartDto1).isNotNull();
        assertThat(cartDto1.getName()).isEqualTo(cartDto.getName());
    }

    @Transactional
    @Rollback
    @Test
    public void deleteCartTest() {
        //Given
        CartDto cartDto = createTestCartDto();
        cartService.createCartByCartDto(cartDto);

        //When
        cartService.deleteCartByCartId(cartDto.getCartId());
        List<CartDto> cartDtoList = cartService.getCartListByUserId(cartDto.getUserId());

        //Then
        assertThat(cartDtoList.size()).isEqualTo(0);
    }
}
