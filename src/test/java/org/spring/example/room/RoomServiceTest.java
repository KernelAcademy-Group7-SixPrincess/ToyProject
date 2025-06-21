package org.spring.example.room;

import lombok.RequiredArgsConstructor;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.room.dto.Room;
import org.spring.example.room.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class RoomServiceTest {

    @Autowired
    private RoomService roomService;

//    @Before

    @Test
    public void findRoomById() {

    }

    @Test
    public void createRoomTest() {
        Room room = Room.builder()
                .accId(1L)
                .typeCodeId("TY")
                .typeCodeCode(101)
                .typeName("일반실")
                .statusCodeId("ST")
                .statusCodeCode(1)
                .statusName("사용 가능")
                .mainImageId(5001L)
                .name("101호")
                .info("깔끔한 방입니다")
                .addInfo("세탁기 있음")
                .size(25)
                .roomCnt(1)
                .floor(1)
                .capacity(2)
                .maxCapacity(3)
                .build();

        roomService.createRoom(room);


    }
}
