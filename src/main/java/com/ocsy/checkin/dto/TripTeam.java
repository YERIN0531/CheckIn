package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TripTeam {
	private String teamname;
	private int teamid;
	private int tnum;
	private String mid;
	private int tstep;
	private String mname;
	private String mtel;
	private String mgender;
	private Date mbirth;
	private String memail;
	
}
