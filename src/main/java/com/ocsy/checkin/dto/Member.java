package com.ocsy.checkin.dto;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String mid;
	private String mpw;
	private String mname;
	private String mename;
	private String mpassport;
	private String mtel;
	private int mpost;
	private String maddress;
	private String mdeaddress;
	private String mgender;
	private Date mbirth;
	private int mwithd;
	private String memail;
	private Date mrdate;
	private int mtotal;
	private int mmileage;

	
}

