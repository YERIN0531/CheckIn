package com.ocsy.checkin.dto;
import java.sql.Date;

import lombok.Data;
@Data
public class Air {

	private String acode;
	private String airline;
	private String adepartloc;
	private String aariveloc;
	private String agotime;
	private String ago_arrivetime;
	private String acome_departtime;
	private String acome_arrivetime;
	private int aprice;
	
	// reserve join 부분 떄문에 불러올 아이들 
	private int asno;
	private String mid;
	private Date agodate;
	private Date acomedate;
	private String seatid;
	private Date ardate;
	private int totalprice;
	private int checknum;
	
	//페이징
	private int startRow;
	private int endRow;
	
}
