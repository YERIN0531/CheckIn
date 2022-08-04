package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.QnaBoard;

public interface QnaService {
	public List<QnaBoard> listQna(String pageNum);
	public int countQna();
	public QnaBoard detailQna(QnaBoard qna);
	public QnaBoard modifyreplyView(int qnum);
	public int insertQna(MultipartHttpServletRequest mRequest,HttpServletRequest request,QnaBoard qna);
	public int replyQna(MultipartHttpServletRequest mRequest,HttpServletRequest request,QnaBoard qna);
	public int modifyQna(MultipartHttpServletRequest mRequest,HttpServletRequest request,QnaBoard qna);
	public int deleteQna(QnaBoard qna);
	public int adminreply();
	public QnaBoard screatView(int qnum);
}
