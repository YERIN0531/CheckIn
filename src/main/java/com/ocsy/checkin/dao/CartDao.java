package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Air;
import com.ocsy.checkin.dto.Cart;

@Mapper
public interface CartDao {
	
	public int insertCart(Cart cart); // 장바구니에 상품 추가
	public List<Cart> listCart(String mid); // 장바구니에 내가 담은 상품들 출력
	public int deleteCart(int cartnum); // cartnum으로 상품 지우기
	public int deleteCartAll(String mid); // mid를 기준으로 mid에 담긴 상품 모두 지우기
	public int totCntCart(Cart cart); // Cart 안에 같은 이름의 상품이 있는지 확인
	public int updateCart(Cart cart); // 면세품 상세보기에서 수정 진행하는 로직
	public int updateInCart(Cart cart); // 장바구니 리스트에서 수정 진행하는 로직
	
	// ORDERS-ORDER_DETAIL 진행
	public int insertOrder(String mid); // order에 insert
	public int insertOrderDetail(String mid);// order_detail에 insert
	public int cartDelete(String mid); // 장바구니 비워주기
	
	public List<Cart> myOrderDetail(String mid); // 내 주문내역 출력하기
	public int updateStock(Cart cart);
	
}
