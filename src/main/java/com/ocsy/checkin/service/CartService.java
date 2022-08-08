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
	
	
//	public int cartOrder(Cart cart); // order에 넣기
	public  List<String> insertCartOrder(Cart cart, String mid);// order_detail에 넣기
	public List<String> orderlist(String mid); // or_num 받아오기
	public int insertOrderDetail(Cart cart); // order_detail에 담아주기 
	public int cartDelete(Cart cart); // 주문완료 후 장바구니 비워주기
}
