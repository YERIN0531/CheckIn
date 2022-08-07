package com.ocsy.checkin.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Member;
import com.ocsy.checkin.service.MemberService;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(params = "method=loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		return "member/loginForm";
	}

//	@RequestMapping(params = "method=login", method = { RequestMethod.GET, RequestMethod.POST })
//	public String loginCheck(String mid, String mpw, HttpSession httpSession, Model model) {
//		model.addAttribute("loginResult", memberService.loginMember(mid, mpw, httpSession));
//		return "forward:main.do";
//	}
	
	@RequestMapping(params = "method=login", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginCheck(String mid, String mpw, HttpSession httpSession, Model model) {
		model.addAttribute("loginResult", memberService.login(mid, mpw, httpSession));
		return "forward:main.do";
	}
	
	
	@RequestMapping(params="method=logout", method= RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		memberService.logout(httpSession);
		return "redirect:main2.do";
	}
	
	@RequestMapping(params="method=joinAgreePage",method= {RequestMethod.GET, RequestMethod.POST})
	public String joinAgreePage() {
		return "member/joinAgreePage";
	}
	
	@RequestMapping(params="method=joinMemberView", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinMemberView() {
		return "member/joinMemberView";
	}
	
	@RequestMapping(params="method=joinMailSend",method= {RequestMethod.GET, RequestMethod.POST})
	public String joinMailSend(String email,Model model) {
		int mailSenderOk = 0;
		int checkNum = 0;
		try {
			Random random = new Random();
			checkNum = random.nextInt(888888)+111111;
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("tjqud531@gmail.com");
			message.setTo(email);
			message.setSubject("[CheckIn] CheckIn 메일 인증 메일입니다.");
			String content = "안녕하세요! CheckIn 회원가입 메일 인증번호 입니다. 인증번호 : "+ checkNum
								+ "화면에 보이는 인증번호를 입력해주세요.";
			message.setText(content);
			mailSender.send(message);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			mailSenderOk = -1;
		}
		model.addAttribute("mailSenderOk",mailSenderOk);
		model.addAttribute("checkNum",checkNum);
		return "member/mailResult";
	}
	
	@RequestMapping(params="method=idConfirm",method={RequestMethod.GET, RequestMethod.POST})
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult",memberService.idConfirm(mid));
		return "member/idConfirm";
	}
	
	@RequestMapping(params="method=joinMember",method= {RequestMethod.GET, RequestMethod.POST})
	public String joinMember(HttpSession httpSession,Member member,Model model) {
		int result = memberService.joinMember(member, httpSession);
		if(result == 1) {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("tjqud531@gmail.com");
			message.setTo(member.getMemail());
			message.setSubject("[CheckIn] CheckIn 회원가입");
			String content = "회원가입 축하한다. 이놈아!";
			message.setText(content);
			mailSender.send(message);
		}
		model.addAttribute("joinResult",result);
		return "member/loginForm";
	}
	
	@RequestMapping(params="method=myPage",method= {RequestMethod.GET, RequestMethod.POST})
	public String myPage() {
		return "member/myPage";
	}
	@RequestMapping(params="method=modifyPWCheck",method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyPWCheck(String modify) {
		return "member/myPagePWCheck";
	}	
	@RequestMapping(params="method=modifyView",method= {RequestMethod.GET, RequestMethod.POST})
	public String modifyView(String modify, Member member, Model model) {
		model.addAttribute("memberDto",memberService.getMember(member.getMid(),member.getMpw()));
		return "member/modifyView";
	}
	

}
