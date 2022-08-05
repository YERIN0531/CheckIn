package com.ocsy.checkin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	//2. 글 비번 확인 view
	@RequestMapping(params="method=secreatQna", method= {RequestMethod.GET,  RequestMethod.POST})
	public String secreatQna(int qnum,  Model model, String pageNum) {
		model.addAttribute("c", qnaService.screatView(qnum));
		return "qna/secreat";
	}
     //2. 비번 확인 후 상세보기로 
	@RequestMapping(params="method=secreat", method={RequestMethod.GET,  RequestMethod.POST})
	public String secreat(QnaBoard qna, Model model  ) {
		model.addAttribute("qnaDto", qnaService.detailSecreat(qna));
		return "forward:qna.do?method=detailQna";
	}
	//3. 글 상세보기
	@RequestMapping(params="method=detailQna", method={RequestMethod.GET,  RequestMethod.POST})
	public String detailQna( Model model, QnaBoard qna ) {
		model.addAttribute("qnaDto", qnaService.detailQna(qna));
		return "qna/detailQna";
	}
	//4. 수정하기 view
	@RequestMapping(params="method=qnaModifyForm", method= {RequestMethod.GET,  RequestMethod.POST})
	public String modifyQnaForm(int qnum , Model model) {
		model.addAttribute("qnaDto", qnaService.modifyreplyView(qnum));
		return "qna/modfyForm";
	}
	//5. 수정하기 처리
	@RequestMapping(params="method=qnaModify", method= RequestMethod.POST)
	public String modifyQna(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna, Model model, String pageNum) {
		model.addAttribute("modifyQna", qnaService.modifyQna(mRequest, request, qna));
		return "forward:qna.do?method=qnaList";
		
	}
	//6. 원글 삭제하면 답변글 까지 삭제
	@RequestMapping(params="method=deleteQna", method= RequestMethod.GET)
	public String deleteQna(QnaBoard qna , Model model, String pageNum) {
		model.addAttribute("qndDelete", qnaService.deleteQna(qna));
		return "forward:qna.do?method=qnaList&pageNum"+pageNum;
	}
	//7. 관리자 답변 view
	@RequestMapping(params="method=qnareplyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaReplyForm(int qnum , Model model) {
		model.addAttribute("qnaDto", qnaService.modifyreplyView(qnum));
		return "qna/qnaReply";
	}
	@RequestMapping(params="method=replyQna", method= RequestMethod.POST)
	public String qnaReplyForm(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna, Model model, String pageNum) {
		model.addAttribute("replyQna", qnaService.replyQna(mRequest, request, qna));
		return "forward:qna.do?method=qnaList&pageNum"+pageNum;
	}
	@RequestMapping(params="method=insertQnaForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertQnaForm() {
		return "qna/qnaInsertForm";
	}
	@RequestMapping(params="method=insertQna", method = RequestMethod.POST)
	public String insertQna(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna, Model model) {
		model.addAttribute("insertQna", qnaService.insertQna(mRequest, request, qna));
		return "forward:qna.do?method=qnaList";
		
	}
}















