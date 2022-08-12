package com.ocsy.checkin.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Hotel;
import com.ocsy.checkin.dto.Hotel_ZZim;
import com.ocsy.checkin.dto.Hotel_rs;

@Mapper
public interface HotelDao {
	public int insertHotel1(Hotel hotel);
	
	public int insertHotel2(Hotel hotel);
	
	public int insertHotel3(Hotel hotel);
	
	public int deleteHidZZim(String hotelid);   //  찜목록 호텔아이디로 삭제
	
	public int deleteHotel(String hotelid); // 근데 hotelid를 파라미터에 넣어줄때
				// substring 사용해서 0,2 (ex: PTB, STB 등등을 넣어주어야함)
	public int updateHotel(Hotel hotel);
	
	public List<Hotel> getHotelDetail(String hotelid);	
	// 이것도 매개변수 (ex: PTB, STB 등등을 넣어주어야함)
	
	public int updateHotelRoom(Hotel hotel);  // 특정 호텔 특정 방 수정
	
	public List<Hotel> checkHotelReservationList(Hotel hotel);  // 특정 지역, 특정날짜로 예약가능한 호텔 리스트 출력
	
	/*     ↑↑↑↑↑ 호텔 검색,예약 여부 조회,삭제,수정,호텔 추가  ↑↑↑↑↑   */
	
	public List<Hotel_rs> myHotelReservationList(String mid); // 내 예약목록 조회
	
	public int canselHotel(int hrs_num);  // 호텔 예약 취소
	
	public int insertHotelReservation(Hotel_rs hotel_rs);   // 호텔 예약
	
	public List<Hotel_rs> checkHotelReservation(Hotel hotel); // 호텔 선택해서 들어왔을때 날짜변경해서 다시 조회할경우
	
	/*     ↑↑↑↑↑ 내 예약목록 조회, 취소, 호텔 예약, 예약가능여부 조회  ↑↑↑↑↑   */
	
	public int insertHZZim1(Hotel hotel);  // 찜 추가
	
	public int insertHZZim2(Hotel hotel);  
	
	public int insertHZZim3(Hotel hotel);  
	
	public int checkZZim(Hotel hotel);  // 특정 회원의 특정 호텔의 방 찜 여부 조회 3이면 찜한상태 0 이면 안한상태
	
	public List<Hotel> myHZZimList(String mid);  // 나의 찜목록 리스트
	
	public int cancelHZZim(Hotel hotel);  // 찜 취소
	
	
	/********************************/
	public List<Hotel> adminHotelList(Hotel hotel);  // 관리자가 호텔 리스트 조회 
	
	public int totAllHotel();
	
	
	
	
	
}
