package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.QnaBoard;
import com.ocsy.checkin.service.QnaService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value = "qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	//1. 글목록 
	@RequestMapping(params="method=qnaList", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaList(String pageNum , Model model ) {
		model.addAttribute("qnaList" , qnaService.listQna(pageNum));
		model.addAttribute("paging", new Paging(qnaService.countQna(), pageNum, 5, 5));
		return "qna/qnaList";
	}
	@RequestMapping(params="method=secreatQna", method= {RequestMethod.GET,  RequestMethod.POST})
	public String secreatQna(int qnum,  Model model) {
		model.addAttribute("secreat", qnaService.screatView(qnum));
		return "qna/secreat";
	}
	@RequestMapping(params="method=secreat", method=RequestMethod.POST)
	public String secreat(int qpassword, int qnum , Model model) {
		model.addAttribute("qnaDto", qnaService.detailQna(qnum, qpassword));
		return "forward:qna.do?method=detailQna";
	}
	@RequestMapping(params="method=detailQna", method={RequestMethod.GET,  RequestMethod.POST})
	public String detailQna(int qpassword, int qnum , Model model, QnaBoard qna) {
		model.addAttribute("qnaDto", qnaService.detailQna(qnum, qpassword));
		return "qna/detailQna";
	}
}
