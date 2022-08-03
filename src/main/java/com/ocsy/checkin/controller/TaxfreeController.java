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
import com.ocsy.checkin.util.Paging;

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
	@RequestMapping(params="method=insert", method= RequestMethod.POST)
	public String insertProduct(MultipartHttpServletRequest mRequest, @ModelAttribute("tDto") Taxfree taxfree, Model model) {
		model.addAttribute("insertResult", taxfreeService.insertProduct(mRequest, taxfree));
		/* return "redirect:taxfree.do?method=list"; */
		return "forward:taxfree.do?method=list";
	}
	
	// 상품 리스트 출력 - O
	@RequestMapping(params="method=list", method={RequestMethod.GET, RequestMethod.POST})
	public String listProduct(String pageNum, Model model, Taxfree taxfree) {
		model.addAttribute("productList", taxfreeService.listProduct(pageNum, taxfree));
		model.addAttribute("paging", new Paging(taxfreeService.countProduct(taxfree), pageNum, 9, 5));
		return "taxfree/listProduct";
	}
	
	// 상품 상세보기 - O
	@RequestMapping(params="method=detail", method=RequestMethod.GET)
	public String detailProduct(int pnum, Model model) {
		model.addAttribute("taxfreeDto", taxfreeService.detailProduct(pnum));
		return "taxfree/detailProduct";
	}
	
	// 상품 업데이트 뷰단 - O
	@RequestMapping(params="method=updateForm", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyProductView(int pnum, Model model) {
		model.addAttribute("taxfreeDto", taxfreeService.detailProduct(pnum));
		return "taxfree/modifyProduct"; // modifyProduct.jsp 로 넘어가는 로직
	}
	// 상품 업데이트 - O
	@RequestMapping(params="method=update", method={RequestMethod.GET, RequestMethod.POST})
	public String updateProduct(MultipartHttpServletRequest mRequest, @ModelAttribute("tDto") Taxfree taxfree, Model model) {
		model.addAttribute("modifyResult", taxfreeService.modifyProduct(mRequest, taxfree));
		/* return "redirect:taxfree.do?method=list"; */
		System.out.println("수정완료");
		return "forward:taxfree.do?method=list";
	}
	
}
