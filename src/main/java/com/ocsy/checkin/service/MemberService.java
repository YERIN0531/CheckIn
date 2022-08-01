package com.ocsy.checkin.service;

import javax.servlet.http.HttpSession;

public interface MemberService {

//	public String loginMember(String mid, String mpw, HttpSession httpSession);
	public void logout(HttpSession httpSession);
	public String login(String mid, String mpw, HttpSession httpSession);
}
