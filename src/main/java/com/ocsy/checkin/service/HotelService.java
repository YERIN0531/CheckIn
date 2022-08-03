package com.ocsy.checkin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Hotel;
import com.ocsy.checkin.dto.Hotel_ZZim;
import com.ocsy.checkin.dto.Hotel_rs;

public interface HotelService {
	public int insertHotel(MultipartHttpServletRequest mRequest,Hotel hotel);   // 호텔 등록 (방3개 포함)
	
	public int deleteHidZZim(String hotelid); // 호텔아이디로 찜 삭제 
	
	public int deleteHotel(String hotelid);  // 호텔 삭제
	
	public int updateHotel(MultipartHttpServletRequest mRequest,Hotel hotel); // 호텔 수정 
	
	public List<Hotel> getHotelDetail(String hotelid);  // 특정 호텔의 dto 가져오기 근데 3개라 리스트
	
	public int updateHotelRoom(MultipartHttpServletRequest mRequest,Hotel hotel);  // 특정 호텔의 방 수정 
	
	public List<Hotel> checkHotelReservationList(Hotel hotel); // 특정 지역, 특정 날짜로 예약가능한 호텔 리스트 검색(출력)
	
	public List<Hotel_rs> myHotelReservationList(String mid);  // 내 호텔 예약목록 조회
	
	public int canselHotel(int hrs_num);  // 호텔 예약 취소
	
	public int insertHotelReservation(Hotel_rs hotel_rs);  // 호텔 예약하기
	
	public List<Hotel_rs> checkHotelReservation(Hotel hotel);  // 특정 호텔 선택해서 들어왔을때 날짜변경해서 다시 조회할경우 
	
	public int insertHZZim(Hotel_ZZim hzzim); // 호텔 찜 추가
	
	public int checkZZim(Hotel_ZZim hzzim); // 찜 여부 조회
	
	public List<Hotel> myHZZimList(String mid);  // 나의 호텔 찜목록 리스트 
	
	public int cancelHZZim(Hotel_ZZim hzzim);  // 찜취소
	
	public List<Hotel> adminHotelList(String pageNum,Hotel hotel);
	
	public int totAllHotel();
	
	
}
