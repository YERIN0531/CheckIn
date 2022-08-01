package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Taxfree;
import com.ocsy.checkin.service.TaxfreeService;

@Controller
@RequestMapping(value="taxfree")
public class TaxfreeController {
	
	@Autowired
	private TaxfreeService taxfreeService;
	
	// 상품 등록 페이지 이동 - O
	@RequestMapping(params="method=insertForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertProductView() {
		return "taxfree/insertProduct"; // insertProduct 로 넘어가는 로직
	}
	// 상품 등록 처리 - O
	@RequestMapping(params="method=insert", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertProduct(MultipartHttpServletRequest mRequest, @ModelAttribute("tDto") Taxfree taxfree, Model model) {
		model.addAttribute("insertResult", taxfreeService.insertProduct(mRequest, taxfree));
		return "taxfree/insertProduct";
	}
	
	// 상품 리스트 출력
	/*@RequestMapping(params="method=list", method=RequestMethod.GET)
	public listProduct(String pageNum, Model model, Taxfree taxfree) {
		model.addAttribute("productList", );
		model.addAttribute("paging", new Paging(total, pageNum))
		return "taxfree/listProduct";
	}*/
	
	
	/*@RequestMapping(params="method=list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model, Book book) {
		model.addAttribute("bookList", bookService.bookList(pageNum, book));
		model.addAttribute("paging", new Paging(bookService.totCntBook(book), pageNum, 3, 3));
		return "book/list";		
	}*/
	
	
}
