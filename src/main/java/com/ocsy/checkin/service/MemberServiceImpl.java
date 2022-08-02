package com.ocsy.checkin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.MemberDao;
import com.ocsy.checkin.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
//	@Override
//	public String loginMember(String mid, String mpw, HttpSession httpSession) {
//		String result = "로그인 성공";
//		Member member = memberDao.getDetailMember(mid);
//		if(member==null) {
//			result= "유효하지 않은 아이디입니다";
//		}else if(! mpw.equals(member.getMpw())) {
//			result = "비밀번호가 맞지 않습니다";
//		}else {
//			httpSession.setAttribute("member", member);
//			httpSession.setAttribute("mid", mid);
//		}
//		return result;
//	}
	@Override
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();
	}
	@Override
	public String login(String mid, String mpw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = new Member();
		member.setMid(mid);
		member.setMpw(mpw);
		member = memberDao.loginCheck(member);
		if(member==null) {
			result ="아이디/비밀번호를 확인하세요";
		}else {
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mid", mid);
		}
		return result;
	}
	@Override
	public int minusMileage(Member member) {
		return memberDao.minusMileage(member);
	}
	@Override
	public int plusMileage(Member member,HttpSession httpSession) {
		System.out.println("매개변수로 받은 멤버 : "+member);
		Member newMember = memberDao.getMember(member.getMid());
		System.out.println("매개변수로 받은 아이디로 다시 멤버 조회 후 멤버 : "+newMember);
		httpSession.setAttribute("member", newMember);
		return memberDao.plusMileage(member);
	}
	

}
