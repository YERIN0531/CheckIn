package com.ocsy.checkin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.NoticeBoard;

public interface NoticeService {
	public List<NoticeBoard> listNotice(String pageNum);
	public int countNotice();
	public NoticeBoard detailNotice(int nnum);
	public NoticeBoard modifylView(int nnum);
	public int insertNotice(MultipartHttpServletRequest mRequest,NoticeBoard notice);
	public int modifyNotice(MultipartHttpServletRequest mRequest,NoticeBoard notice);
	public int deleteNotice(int nnum);
}
