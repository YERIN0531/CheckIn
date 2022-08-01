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
	@RequestMapping(params="method=reviewList",  method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(String pageNum , Model model) {
		model.addAttribute("reviewList", reviewService.listReview(pageNum));
		model.addAttribute("paging", new Paging(reviewService.countReview(), pageNum, 5, 5));
		return "review/reviewList";
	}
	@RequestMapping(params="method=detailReview", method= RequestMethod.GET)
	public String detailReview(int rnum , Model model) {
		model.addAttribute("reviewDto",reviewService.detailReview(rnum));
		return "review/detailReview";
		
	}
	@RequestMapping(params="method=reviewmodifyForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewModifyForm(int rnum , Model model) {
		model.addAttribute("reviewDto", reviewService.reviewModifyReplyView(rnum));
		return "review/modifyForm";
	}
	@RequestMapping(params="method=modifyReview", method=RequestMethod.POST)
		public String modifyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("modifyReview", reviewService.modifyReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList&pageNum="+pageNum;
	}
	@RequestMapping(params="method=insertReviewForm", method={RequestMethod.GET, RequestMethod.POST})
		public String ReviewForm() {
		return "review/reviewForm";
	}
	@RequestMapping(params="method=insertReview", method= RequestMethod.POST)
	public String insertReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("insertReview", reviewService.insertReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList";
	}
	@RequestMapping(params="method=replyForm", method = RequestMethod.GET)
	public String replyForm(int rnum , Model model) {
		model.addAttribute("replyDto", reviewService.reviewModifyReplyView(rnum));
		return "review/reviewReply";
	}
	@RequestMapping(params="method=replyReview", method = RequestMethod.POST)
	public String replyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review , Model model, String pageNum) {
		model.addAttribute("replyReview", reviewService.replyReview(mRequest, request, review));
		return "redirect:review.do?method=reviewList";
	}
}









