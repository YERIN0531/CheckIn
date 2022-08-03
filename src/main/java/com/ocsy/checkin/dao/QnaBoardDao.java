package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.QnaBoard;

@Mapper
public interface QnaBoardDao {
	public List<QnaBoard> listQna(QnaBoard qna); // 글목록
	public int countQna();						 // 글개수
	public QnaBoard detailQna(int qnum, int qpassword);		 // 본인글 상세보기
	public QnaBoard modifyreplyView(int qnum);   // 관리자글 수정 , 답변 view
	public int insertQna(QnaBoard qna);			// 문의하기 원글
	public int hitupQna(int qnum);				// 히트업
	public int replyQna(QnaBoard qna);			// 관리자 답글
	public int modifyQna(QnaBoard qna);			// 글수정
	public int deleteQna(QnaBoard qna);		// 글삭제 답글까지 
	public int adminreply();					// 답변글 여부 확인
	public QnaBoard secreatView(int qnum);
}
