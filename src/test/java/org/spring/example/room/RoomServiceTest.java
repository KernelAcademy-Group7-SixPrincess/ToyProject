package org.spring.example.room;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.room.dto.Room;
import org.spring.example.room.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class RoomServiceTest {

    @Autowired
    private RoomService roomService;

    public Room createTestRoom() {
        return Room.builder()
                .accId(1L)
                .typeCodeId("ROOM_TYPE")
                .typeCodeCode(1)
                .typeCodeName("SINGLE_ROOM")
                .statusCodeId("ROOM_STATUS")
                .statusCodeCode(1)
                .statusCodeName("AVAILABLE")
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
    }

    @Transactional
    @Rollback
    @Test
    public void findRoomById() {
        //Given
        Room room = createTestRoom();
        roomService.createRoom(room);
        long roomId = room.getId();

        //When
        Room resultRoom = roomService.findRoomByRoomId(roomId);

        //Then
        assertThat(resultRoom).isNotNull();
        assertThat(resultRoom.getId()).isEqualTo(roomId);
        assertThat(resultRoom.getAccId()).isEqualTo(room.getAccId());
        assertThat(resultRoom.getTypeCodeId()).isEqualTo(room.getTypeCodeId());
    }

    @Transactional
    @Rollback
    @Test
    public void createRoomTest() {
        // Given
        Room room = createTestRoom();

        // When
        roomService.createRoom(room);
        Room savedRoom = roomService.findRoomByRoomId(room.getId());

        // Then
        assertThat(savedRoom).isNotNull();
        assertThat(savedRoom.getName()).isEqualTo(room.getName());
    }

}
