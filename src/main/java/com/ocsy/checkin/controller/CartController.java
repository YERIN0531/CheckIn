package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Cart;
import com.ocsy.checkin.service.CartService;

@Controller
@RequestMapping(value="cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	// 상품 상세보기에서 카트로 상품 추가 - 진행중 
	@RequestMapping(params="method=insert", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertCart(Cart cart, Model model) {
		model.addAttribute("insertCart", cartService.insertCart(cart));
		System.out.println("cart insert controller");
		return "forward:taxfree.do?method=detail&pnum="+cart.getPnum();
	}
	
}
