package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ocsy.checkin.dto.Cart;

public interface CartService {
	public int insertCart(Cart cart); // 상품추가 - 상품 상세보기 페이지에서
	public List<Cart> listCart(HttpSession session); // 장바구니 리스트 출력 - mid
	public int deleteCart(int cartnum); // 장바구니에 담긴 상품 하나만 삭제하기
	public int deleteCartAll(HttpSession session); // 장바구니에 담긴 상품 전체 삭제 - mid
	public int updateCart(Cart cart); // 장바구니 리스트에서 수정 진행
	
	
	public int insertCartOrder(HttpSession session);// order_detail에 넣기
	public int insertOrderDetail(HttpSession session); // order_detail에 담아주기 
	public List<Cart> myOrderDetail(HttpSession session); // 주문한 order detail 출력  
	
	
	public int updateStock(List<Cart> cart); // 재고수정
	public int cartDelete(HttpSession session); // 주문완료 후 장바구니 비워주기

}
