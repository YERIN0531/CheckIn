package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewBoard {
	private int rnum;
	private String mid;
	private String rtitle;
	private String rcontent;
	private String rimage1;
	private String rimage2;
	private String rimage3;
	private String rimage4;
	private String rimage5;
	private int rhit;
	private String rip;
	private Date rrdate;
	private int rgroup;
	private int rstep;
	private int rindent;
	private int startRow;
	private int endRow;
	
}
