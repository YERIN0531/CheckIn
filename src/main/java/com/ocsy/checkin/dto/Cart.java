package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int cartnum; // 장바구니번호
	   private String pnum; // 상품번호(fk)
	   private String mid; // 회원 아이디(fk)
	   private int cost; // 총 가격
	   private int qty; // 수량
	   
	   // taxfree테이블에서 join 해서 가져올 데이터들 변수 추가
	   private String pname; // 상품이름
	   private String pimage1; // 상품이미지
	   private int pprice;  // 상품 하나의 정가
	   
	   

	   //orders table
	   private int or_num;
	   private Date ordate;
	   
	   //order detail
	   private int ord_num;
	
}
