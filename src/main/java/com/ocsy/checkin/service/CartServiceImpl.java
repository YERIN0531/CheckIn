package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.CartDao;
import com.ocsy.checkin.dto.Cart;
import com.ocsy.checkin.dto.Member;

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

	@Override
	public List<Cart> listCart(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		System.out.println("listCart Service mid : " + mid);
		return cartDao.listCart(mid);
	}

	@Override
	public int deleteCart(int cartnum) {
		int result = cartDao.deleteCart(cartnum);
		System.out.println(result == 1? cartnum + "번 장바구니 삭제 성공" : cartnum +"번 장바구니 삭제 실패..");
		return result;
	}

}
