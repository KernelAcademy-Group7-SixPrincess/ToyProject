package org.spring.example.room.mapper;

import org.spring.example.room.dto.Room;

import java.util.List;


public interface RoomMapper {
    /**
     * 객실 생성 메서드
     * @param room 객실 정보 데이터
     */
    void createRoom(Room room);

    /**
     * 객실 조회 메서드
     * @param id 객실의 키값(long)으로 해당 객실 정보를 반환
     * @return 해당 객실 정보(RoomDto)
     */
    Room findRoomById(Long id);

    /**
     * 해당 숙소의 전체 객실 조회 메서드
     * @param accId 조회할 숙소의 ID값
     * @return 해당 숙소의 객실 전체 정보
     */
    List<Room> findRoomsByAccId(Long accId);

    /**
     * 해당 객실 정보 갱신 메서드 <br>
     * null 값은 업데이트 하지 않고 기존 값 유지 <br>
     * @param room 갱신 할 객체 정보
     */
    void updateRoomByRoom(Room room);

    /**
     * 해당 객실 정보 삭제 메서드 <br>
     * 물리 삭제
     * @param roomId 삭제할 객실 ID
     */
    void deleteRoomByRoomId(long roomId);


}
