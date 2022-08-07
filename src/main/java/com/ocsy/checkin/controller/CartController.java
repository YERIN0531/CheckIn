package com.ocsy.checkin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Cart;
import com.ocsy.checkin.dto.Hotel_rs;
import com.ocsy.checkin.dto.Member;
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
	public String listCart(HttpSession session, Model model) {
		System.out.println("controller : before to start Service");
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
	
	// 장바구니 리스트에서 수량 수정 - 진행 중
	@RequestMapping(params="method=modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyCart(Cart cart, Model model) {
		model.addAttribute("modifyResult", cartService.updateCart(cart));
		System.out.println("controller : 수량 수정 성공");
		return "forward:cart.do?method=list";
	}
	
	// 상품구매하기 
	@RequestMapping(params="method=buyProduct", method= {RequestMethod.GET, RequestMethod.POST})
	public String buyProduct(Cart cart, Model model, String mid) {
//		model.addAttribute("cartOrder", cartService.cartOrder(cart));
		model.addAttribute("cartOrderDetail", cartService.cartOrderDetail(cart, mid));
		System.out.println("cartOrder 성공" + cart.getOr_num());
		System.out.println("cartOrderDetail 성공");
		model.addAttribute("cartDelete", cartService.cartDelete(cart));
		System.out.println("cartDelete 성공");
		return "cart/orderForm";
		}
	
	
}
