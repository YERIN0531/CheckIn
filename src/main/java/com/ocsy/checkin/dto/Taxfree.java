package com.ocsy.checkin.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Taxfree {
	
	private int    pnum;    // 상품번호 - product_seq
	private String pname;   // 상품 이미지
	private int    pprice;  // 상품 가격
	private String pimage1; // 상품 메인 이미지
	private String pimage2; // 상품 상세 이미지1
	private String pimage3; // 상품 상세 이미지2
	private String pstock;  // 상품 재고
	private String ploc;    // 상품 위치
	
}
