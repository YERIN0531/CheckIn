package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeBoard {
	private int nnum;
	private String aid;
	private String ntitle;
	private String ncontent;
	private String nimage;
	private int nhit;
	private Date nrdate;
	private int startRow;
	private int endRow;
}
