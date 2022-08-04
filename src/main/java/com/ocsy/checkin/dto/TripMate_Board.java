package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TripMate_Board {
	private int tnum;
	private String mid;
	private String ttitle;
	private String tgender;
	private int tmaxmembercount;
	private int tnowmembercount;
	private String tstyle;
	private String thotelstyle;
	private String tplaystyle;
	private String tcontent;
	private String teamname;
	private String timage;
	private int thit;
	private Date trdate;
	private String tip;	
	private int startRow;
	private int endRow;
}
