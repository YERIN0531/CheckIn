package com.ocsy.checkin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.service.MemberService;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	@Autowired
	private MemberService memberService;

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
		return "redirect:main.do";
	}
	

}
