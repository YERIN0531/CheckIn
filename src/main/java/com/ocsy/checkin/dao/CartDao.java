package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Cart;

@Mapper
public interface CartDao {
	
	public int insertCart(Cart cart); // 장바구니에 상품 추가
	public List<Cart> listCart(String mid); // 장바구니에 내가 담은 상품들 출력
	public int deleteCart(int cartnum); // cartnum으로 상품 지우기
	public int deletaCartAll(String mid); // mid를 기준으로 mid에 담긴 상품 모두 지우기
	
}
