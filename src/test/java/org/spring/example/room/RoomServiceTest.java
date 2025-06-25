package org.spring.example.room;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.search.dto.SearchDto;
import org.spring.example.room.dto.Room;
import org.spring.example.room.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
public class RoomServiceTest {

    @Autowired
    private RoomService roomService;

    /**
     * Test용 객실 생성
     * @return Test 객실 객체
     */
    public Room createTestRoom() {
        return Room.builder()
                .accId(1L)
                .typeCodeId("ROOM_TYPE")
                .typeCodeCode(1)
                .typeCodeName("SINGLE_ROOM")
                .statusCodeId("ROOM_STATUS")
                .statusCodeCode(1)
                .statusCodeName("AVAILABLE")
                .mainImageId("28e6b4fc-f434-422c-8e57-03c428d53237")
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
    @Test(expected = DataIntegrityViolationException.class)
    public void shouldThrowExceptionIfFieldIsNull() {
        //Given
        Room room = createTestRoom();
        room.setName(null);

        //When
        roomService.createRoom(room);

        //Then

    }

    @Transactional
    @Rollback
    @Test
    public void findAllRoomsTest() {
        //Given
        Room room = null;
        List<Room> predicateRoomList = new ArrayList<>();
        for(int i = 0; i < 10; i++) {
            room = createTestRoom();
            roomService.createRoom(room);
            predicateRoomList.add(room);
        }

        //When
        List<Room> roomList = roomService.findAllRooms();

        //Then
        assertThat(roomList).isNotNull();
        assertThat(roomList.size()).isEqualTo(10);

        assertThat(predicateRoomList).usingRecursiveComparison()
                .ignoringFields("createdAt", "updatedAt").isEqualTo(roomList);
    }

    /**
     * 객실 조회 Test <br>
     * 객실 생성 후 DB 에서 조회 확인 <br>
     * 객실 ID로 조회
     */
    @Transactional
    @Rollback
    @Test
    public void findRoomByIdTest() {
        //Given
        Room room = createTestRoom();
        roomService.createRoom(room);
        long roomId = room.getRoomId();

        //When
        Room resultRoom = roomService.findRoomByRoomId(roomId);

        //Then
        assertThat(resultRoom).isNotNull();
        assertThat(resultRoom.getRoomId()).isEqualTo(roomId);
        assertThat(resultRoom.getAccId()).isEqualTo(room.getAccId());
        assertThat(resultRoom.getTypeCodeId()).isEqualTo(room.getTypeCodeId());
    }

    /**
     * 객실 생성 Test <br>
     * 객실을 생성 후 findRoomByRoomId로 조회 확인
     */
    @Transactional
    @Rollback
    @Test
    public void createRoomTest() {
        // Given
        Room room = createTestRoom();

        // When
        roomService.createRoom(room);
        Room savedRoom = roomService.findRoomByRoomId(room.getRoomId());

        // Then
        assertThat(savedRoom).isNotNull();
        assertThat(savedRoom.getName()).isEqualTo(room.getName());
    }

    /**
     * 객실 리스트 조회 Test <br>
     * 10개의 테스트 객체 생성 후 조회 
     */
    @Transactional
    @Rollback
    @Test
    public void findAllRoomsByAccIdTest() {
        //Given
        Room room = null;
        List<Room> predicateRoomList = new ArrayList<>();
        for(int i = 0; i < 10; i++) {
            room = createTestRoom();
            roomService.createRoom(room);
            predicateRoomList.add(room);
        }
        long accId = room.getAccId();
        
        //When
        List<Room> roomList = roomService.findRoomsByAccId(accId);

        //Then
        assertThat(roomList).isNotNull();
        assertThat(roomList.size()).isEqualTo(10);

        assertThat(predicateRoomList).usingRecursiveComparison()
                .ignoringFields("createdAt", "updatedAt").isEqualTo(roomList);
    }

    @Transactional
    @Rollback
    @Test
    public void findRoomsByAccIdAndStatusTest() {
        //Given
        Room room = null;
        List<Room> predicateRoomList = new ArrayList<>();
        // 1 5개, 2 5개 설정
        for(int i = 0; i < 10; i++) {
            room = createTestRoom();
            room.setStatusCodeCode((i / 5) + 1);
            roomService.createRoom(room);
            predicateRoomList.add(room);
        }

        long accId = room.getAccId();
        String statusCodeId= room.getStatusCodeId();
        int statusCodeCode = 1;

        // statusCodeCode가 1인 것만 필터
        List<Room> expectedList = predicateRoomList.stream()
                .filter(r -> r.getStatusCodeCode() == 1)
                .collect(Collectors.toList());
        SearchDto searchDto = SearchDto.builder().accId(accId).statusCodeId(statusCodeId)
                .statusCodeCode(statusCodeCode).build();


        //When
        List<Room> roomList = roomService.findRoomsByAccIdAndStatus(searchDto);

        //Then
        assertThat(roomList).isNotNull();
        assertThat(roomList.size()).isEqualTo(5);
        assertThat(roomList).usingRecursiveComparison().ignoringFields("createdAt", "updatedAt")
                .isEqualTo(expectedList);

    }

    /**
     * 객실 갱신 Test
     */
    @Transactional
    @Rollback
    @Test
    public void updateRoomByRoomTest() {
        //Given
        Room room = createTestRoom();
        roomService.createRoom(room);

        //When
        room.setAccId(2L);
        roomService.updateRoomByRoom(room);
        Room updatedRoom = roomService.findRoomByRoomId(room.getRoomId());

        //Then
        assertThat(updatedRoom).isNotNull();
        assertThat(updatedRoom.getAccId()).isEqualTo(2L);
    }

    /**
     * 객실 삭제 Test
     */
    @Transactional
    @Rollback
    @Test
    public void deleteRoomByRoomIdTest() {
        //Given
        Room room = createTestRoom();
        roomService.createRoom(room);

        //When
        roomService.deleteRoomByRoomId(room.getRoomId());
        Room deletedRoom = roomService.findRoomByRoomId(room.getRoomId());

        //Then
        assertThat(deletedRoom).isNull();
    }

}
