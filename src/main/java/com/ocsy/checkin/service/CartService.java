package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ocsy.checkin.dto.Cart;

public interface CartService {
	public int insertCart(Cart cart); // 상품추가
	public List<Cart> listCart(HttpSession session); // 장바구니 리스트 출력
	public int deleteCart(int cartnum); // 장바구니에 담긴 상품 하나만 삭제하기

	
}
