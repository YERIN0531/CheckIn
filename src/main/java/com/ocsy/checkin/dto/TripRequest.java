package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TripRequest {
	private int trnum;
	private int tnum;
	private String mid;
	private String trmemo;
	private String mname;
	private String mgender;
	private String mtel;
	private Date mbirth;
	private Date trrdate;
}
