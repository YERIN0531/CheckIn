package com.ocsy.checkin.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Cart;

@Mapper
public interface CartDao {
	
	public int insertCart(Cart cart); // 장바구니에 상품 추가

	
}
