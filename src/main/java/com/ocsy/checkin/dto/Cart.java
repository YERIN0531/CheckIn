package com.ocsy.checkin.dto;

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
}
