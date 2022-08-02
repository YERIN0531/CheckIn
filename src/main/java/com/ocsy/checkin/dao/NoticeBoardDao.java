package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.NoticeBoard;

@Mapper
public interface NoticeBoardDao {
	public List<NoticeBoard> listNotice(NoticeBoard notice);
	public int countNotice();
	public NoticeBoard detailNotice(int nnum);
	public NoticeBoard modifylView(int nnum);
	public int insertNotice(NoticeBoard notice);
	public int hitupNotice(int nnum);
	public int modifyNotice(NoticeBoard notice);
	public int deleteNotice(int nnum);
}
