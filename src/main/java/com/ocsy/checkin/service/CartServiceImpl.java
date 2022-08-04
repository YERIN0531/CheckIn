package com.ocsy.checkin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.CartDao;
import com.ocsy.checkin.dto.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;	
	
	@Override
	public int insertCart(Cart cart) {
		int result = cartDao.insertCart(cart);
		System.out.println(result == 1 ? "장바구니 추가 성공" : "장바구니 추가 실패..");
		return result;
	}

}
