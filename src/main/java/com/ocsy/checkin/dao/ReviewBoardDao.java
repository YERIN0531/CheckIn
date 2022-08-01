package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.ReviewBoard;

@Mapper
public interface ReviewBoardDao {
	public List<ReviewBoard> listReview(ReviewBoard review);
	public int countReview();
	public ReviewBoard detailReview(int rnum);
	public ReviewBoard reviewModifyReplyView(int rnum);
	public int insertReview(ReviewBoard review);
	public int revuewHitUp(int rnum);
	public int replyPreStepReview(ReviewBoard review);
	public int replyReview(ReviewBoard review);
	public int modifyReview(ReviewBoard review);
	public int deleteReview(int rnum);
}
