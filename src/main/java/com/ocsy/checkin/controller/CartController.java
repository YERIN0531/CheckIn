package com.ocsy.checkin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Cart;
import com.ocsy.checkin.service.CartService;

@Controller
@RequestMapping(value="cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	// 상품 상세보기에서 카트로 상품 추가 (장바구니에 상품이 있을 경우에 update 진행) - O
	@RequestMapping(params="method=insert", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertCart(Cart cart, Model model) {
		model.addAttribute("insertCart", cartService.insertCart(cart));
		System.out.println("cart insert controller");
		return "forward:taxfree.do?method=detail&pnum="+cart.getPnum();
	}
	
	// 장바구니 리스트 출력 - O
	@RequestMapping(params="method=list", method= {RequestMethod.GET, RequestMethod.POST})
	public String listCart(HttpSession session, String mid, Model model) {
		model.addAttribute("cartList", cartService.listCart(session));
		System.out.println("controller : finish and go to listCart.jsp");
		return "cart/listCart";
	}
	
	// 장바구니 항목 1개 삭제 - O
	@RequestMapping(params="method=delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteCart(int cartnum, Model model) {
		model.addAttribute("deleteCart", cartService.deleteCart(cartnum));
		System.out.println(cartnum + "항목 삭제 완료");
		return "forward:cart.do?method=list";
	}
	
	// 장바구니 비우기 - O
	@RequestMapping(params="method=deleteAll", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteAllCart(HttpSession session, Model model) {	
		model.addAttribute("deleteAllCart", cartService.deleteCartAll(session));
		System.out.println("controller : 장바구니 비우기 성공");
		return "forward:cart.do?method=list";
	}
	
	// 장바구니 리스트에서 수량 수정 - O
	@RequestMapping(params="method=modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyCart(Cart cart, Model model) {
		model.addAttribute("modifyResult", cartService.updateCart(cart));
		System.out.println("controller : 수량 수정 성공");
		return "forward:cart.do?method=list";
	}
	
	// 결제정보 출력 JSP - O
	@RequestMapping(params="method=buyInfo",method= {RequestMethod.GET, RequestMethod.POST})
	public String buyInfo(HttpSession session, Model model) {
		model.addAttribute("cartList", cartService.listCart(session));
		return "cart/buyInfo";
	}
	
	// 상품구매하기 - 진행중
	@RequestMapping(params="method=buyProduct", method= {RequestMethod.GET, RequestMethod.POST})
	public String buyProduct(HttpSession session, Model model) {
		cartService.insertCartOrder(session); // ORDERS RETURN
		System.out.println("controller : insertOrders"); // or_num 리스트 리턴	
		cartService.insertOrderDetail(session); // 주문번호 등록, 주문번호 리턴 ORDER_DETAIL INSERT		
		System.out.println("controller : insertOrderDetail 성공");
		//model.addAttribute("myOrderDetailList", cartService.myOrderDetail(session)); // 주문상세내역 출력
		// List<Cart> cart = cartService.myOrderDetail(session);
		List<Cart> cart = cartService.listCart(session); // 카트 받아오기
		cartService.updateStock(cart); // 재고 수정해주기
		cartService.cartDelete(session);// 장바구니 비우기
		System.out.println("controller : 내 주문정보 출력하기");

		return "forward:cart.do?method=orderDetailList"; // 넘겨주기
	}
	
	// 주문 디테일 리스트 출력하기는 따로 분리
	@RequestMapping(params="method=orderDetailList", method={RequestMethod.GET, RequestMethod.POST})
	public String orderDetailList(HttpSession session, Model model) {
		model.addAttribute("orderDetailList", cartService.myOrderDetail(session));
		return "cart/orderForm";
	}
}
