package com.ocsy.checkin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.ReviewBoard;
import com.ocsy.checkin.service.ReviewService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value ="review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	//1. 리뷰 리스트
	@RequestMapping(params="method=reviewList",  method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(String pageNum , Model model) { 
		model.addAttribute("reviewList", reviewService.listReview(pageNum));
		model.addAttribute("paging", new Paging(reviewService.countReview(), pageNum, 5, 5));
		return "review/reviewList";
	}
	//2. 글상세보기 
	@RequestMapping(params="method=detailReview", method= RequestMethod.GET)
	public String detailReview(int rnum , Model model) {
		model.addAttribute("reviewDto",reviewService.detailReview(rnum));
		return "review/detailReview";
		
	}
	//3. 글수정하기 view
	@RequestMapping(params="method=reviewmodifyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewModifyForm(int rnum , Model model) {
		model.addAttribute("reviewDto", reviewService.reviewModifyReplyView(rnum));
		return "review/modifyForm";
	}
	//4. 글수정하기 db 처리 
	@RequestMapping(params="method=modifyReview", method=RequestMethod.POST)
		public String modifyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("modifyReview", reviewService.modifyReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList&pageNum="+pageNum;
	}
	//5. 글 작성 view
	@RequestMapping(params="method=insertReviewForm", method={RequestMethod.GET, RequestMethod.POST})
		public String ReviewForm() {
		return "review/reviewForm";
	}
	// 6. 글 작성 db 처리 
	@RequestMapping(params="method=insertReview", method= RequestMethod.POST)
	public String insertReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("insertReview", reviewService.insertReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList";
	}
	//7. 답변글 view 
	@RequestMapping(params="method=replyForm", method = RequestMethod.GET)
	public String replyForm(int rnum , Model model) {
		model.addAttribute("replyDto", reviewService.reviewModifyReplyView(rnum));
		return "review/reviewReply";
	}
	//8. 답변글 db 처리
	@RequestMapping(params="method=replyReview", method = RequestMethod.POST)
	public String replyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("replyReview", reviewService.replyReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList";
	}
	//9. 원글 삭제하면 답변글 까지 삭제  아직 안됌 
	@RequestMapping(params="method=deleteReview", method = RequestMethod.GET)
	public String deleteReview(ReviewBoard review ,Model model) {
		model.addAttribute("deleteResult", reviewService.deleteReview(review));
		return "redirect:review.do?method=reviewList";
	}
}









