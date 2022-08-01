package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.ReviewBoard;

public interface ReviewService {
	public List<ReviewBoard> listReview(String pageNum);
	public int countReview();
	public ReviewBoard detailReview(int rnum);
	public ReviewBoard reviewModifyReplyView(int rnum);
	public int insertReview(MultipartHttpServletRequest mRequest,HttpServletRequest request,ReviewBoard review);
	public int replyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request,ReviewBoard review);
	public int modifyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request,ReviewBoard review);
	public int deleteReview(int rnum);
}
