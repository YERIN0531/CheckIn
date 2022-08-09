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
		int totCnt = cartDao.totCntCart(cart);
		int result = 0;
		if(totCnt == 0) {
			result = cartDao.insertCart(cart);
			System.out.println(result == 1 ? "장바구니 추가 성공" : "장바구니 추가 실패..");
		} else {
			result = cartDao.updateCart(cart);
			System.out.println(result == 1 ? "장바구니 업데이트 성공" : "장바구니 업데이트 실패..");
		}
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

	@Override
	public int deleteCartAll(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		System.out.println("deleteCartAll Service mid : " + mid);
		return cartDao.deleteCartAll(mid);
	}

	@Override
	public int updateCart(Cart cart) {
		System.out.println("cart 수정 : " + cart);
		int result = cartDao.updateInCart(cart);
		System.out.println(result == 1 ? "상품 수량 수정 성공" : "상품 수량 수정 실패..");
		return result;
	}

	
	
	/////////// 장바구니 주문 처리 ///////////
	// orders 테이블에 insert
	@Override
	public int insertCartOrder(HttpSession session) { 
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		System.out.println("listCart Service mid : " + mid);
		int result = cartDao.insertOrder(mid);
		System.out.println("service (insertOder) 결과 : " + result);
		return result; // orders insert
	}

	// order_detail 테이블에 insert
	public int insertOrderDetail(HttpSession session) { 
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		System.out.println("service (insertOderDetail) 결과 : " + mid);
		int result = cartDao.insertOrderDetail(mid);
		System.out.println(result);
		return result;
	}
	
	// 주문 내역 출력 - 진행중
	@Override
	public List<Cart> myOrderDetail(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		System.out.println("listCart Service mid : " + mid);
		return cartDao.myOrderDetail(mid);
	}
	
	// 장바구니 비워주기
	@Override
	public int cartDelete(HttpSession session) { // 장바구니에 담긴 카트들 삭제
		Member member = (Member)session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		int result = cartDao.cartDelete(mid);
		System.out.println(result >= 1 ? "장바구니 비우기 성공" : "장바구니 비우기 실패");
		return result;
	}

	@Override
	public int updateStock(List<Cart> cart) {
		int result = 0;
		int i = 1;
		for(Cart c : cart) {
			System.out.println(c);
			result += cartDao.updateStock(c);
			System.out.println(i + " 번쨰 수량 업데이트 성공");
			i++;
		}
		return result;
	}

	
	
	


}
