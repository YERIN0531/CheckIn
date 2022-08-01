package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Hotel_rs {
	private int hrs_num;   // 예약번호 (시퀀스)
	private String hotelid;   // 호텔 아이디
	private String mid;  // 회원 아이디
	private Date checkin;  // 예약완료 체크인 날짜 
	private Date checkout;  // 예약 완료 체크아웃 날짜
	private int headcount;  // 예약 인원수
	
}
