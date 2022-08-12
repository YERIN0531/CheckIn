package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Hotel {
	private String hotelid;   // 호텔 아이디
	private String hotelcountry;  // 호텔 국가
	private String hotelname;  // 호텔 이름
	private String hoteladdress;  // 호텔 주소
	private String roomtype;  // 호텔 룸 타입
	private int roomprice;
	private int standardprice;  // 호텔 룸 가격
	private int deluxeprice;  // 호텔 룸 가격
	private int sweetprice;  // 호텔 룸 가격
	private String hotelimage;  // 호텔 사진
	private String roomimage; 	
	private String standardimage;   // 호텔 룸 사진
	private String deluxeimage;   // 호텔 룸 사진
	private String sweetimage;   // 호텔 룸 사진
	private Date schcheckindate;
	private Date schcheckoutdate;
	private String schcountry;
	private int hzzim;
	private int headcount;
	private int startRow;
	private int endRow;
	private String mid;
	private int checkZZim;
	
	
}
