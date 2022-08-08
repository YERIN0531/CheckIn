package com.ocsy.checkin.service;

import java.util.ArrayList;
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

	
	
	///////////cart 처리
	
	
//	@Override
//	public int cartOrder(Cart cart) {
//		ArrayList<String> seatDbList = (ArrayList<String>) airDao.seatList(air);
//		Cart carts = (Cart)cartDao.cartOrder(cart);
//		cart.setOr_num(carts.getOr_num());
//		return 
//	}
	
	@Override
	public List<String> orderlist(String mid) {  // select 
		ArrayList<String> orderDblist = (ArrayList<String>) cartDao.orderlist(mid);
		System.out.println(orderDblist);
		return orderDblist;
	}
	
	
	@Override
	public List<String> insertCartOrder(Cart cart, String mid) {   // insert 
		cartDao.cartOrder(cart);
		System.out.println("cartorder 성공 "+ cart.getOr_num());
		  // or_num 리스트 리턴
		return   cartDao.orderlist(cart.getMid());// order_detail에 insert
	}

	@Override
	public int cartDelete(Cart cart) { // 장바구니에 담긴 카트들 삭제
		return cartDao.cartDelete(cart);
	}
	
	// // order_detail 테이블에 insert
	public int insertOrderDetail(Cart cart) { // 오더 디테일 테이블에 넣기 
		return cartDao.cartOrderDetail(cart);
	}
	
	/*
	 * 
	 * @Override public int cartOrderDetail(Cart cart) { return
	 * cartDao.cartOrderDetail(cart); }
	 */



}
