package com.ocsy.checkin.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaBoard {
	private int qnum;
	private String qid;
	private String qtitle;
	private String qcontent;
	private String qfile1;
	private String qfile2;
	private int qhit;
	private String qip;
	private Date qrdate;
	private int qsecret;
	private int qpassword;
	private int qgroup;
	private int qstep;
	private int qindent;
//	private int adminreply;
	private int startRow;
	private int endRow;
}
