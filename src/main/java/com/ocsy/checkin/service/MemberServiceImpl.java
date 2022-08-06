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
		Member newMember = memberDao.getMember(member.getMid());
		httpSession.setAttribute("member", newMember);
		return memberDao.plusMileage(member);
	}
	@Override
	public int idConfirm(String mid) {
		return memberDao.idConfirm(mid);
	}
	@Override
	public int joinMember(Member member, HttpSession httpSession) {
		int result = memberDao.joinMember(member);
		System.out.println(result == 1 ? "회원가입 성공" : "회원가입 실패");
		if(result == 1) {
			httpSession.setAttribute("mid", member.getMid());
		}
		return result;
	}
	

}
