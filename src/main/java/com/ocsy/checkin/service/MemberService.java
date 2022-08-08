package com.ocsy.checkin.service;

import javax.servlet.http.HttpSession;

import com.ocsy.checkin.dto.Member;

public interface MemberService {

//	public String loginMember(String mid, String mpw, HttpSession httpSession);
	public void logout(HttpSession httpSession);
	public String login(String mid, String mpw, HttpSession httpSession);
	
	public int minusMileage(Member member);
	
	public int plusMileage(Member member,HttpSession httpSession);
	
	public int idConfirm(String mid);
	
	public int joinMember(Member member, HttpSession httpSession);
	
	public Member getMember(String mid, String mpw);
	
	public int modifyMember(Member member,  HttpSession httpSession);
	
}
