package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.QnaBoard;

@Mapper
public interface QnaBoardDao {
	public List<QnaBoard> listQna(QnaBoard qna); // 글목록
	public int countQna();						 // 글개수
	public int adminreply(QnaBoard qna);						//같은 group 개수 
	public QnaBoard detailQna(QnaBoard qna);		 // 본인글 상세보기 , int 비번  , int qnum
	public QnaBoard detailSecreat(QnaBoard qna);
	public QnaBoard modifyreplyView(int qnum);   // 관리자글 수정 , 답변 view
	public int insertQna(QnaBoard qna);			// 문의하기 원글
	public int hitupQna(int qnum);				// int qnum 만 했는데 이번에는 다름 
	public int replyQna(QnaBoard qna);			// 관리자 답글
	public int modifyQna(QnaBoard qna);			// 글수정
	public int deleteQna(QnaBoard qna);		// 글삭제 답글까지 
	public QnaBoard secreatView(int qnum);
}
