package com.ocsy.checkin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Manager;
import com.ocsy.checkin.service.ManagerService;

@Controller
@RequestMapping(value="manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(params = "method=managermain", method={RequestMethod.GET, RequestMethod.POST})
	public String managermain() {
		return "manager/managermain";
	}
	
	//1. 관리자 로그인 view
	@RequestMapping(params = "method=mLoginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "manager/loginForm";
	}
	//2. 관리자 로그인 처리 
	@RequestMapping(params ="method=login", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginCheck(String aid , String apw ,HttpSession httpSession, Model model) {
		model.addAttribute("managerLogin", managerService.login(aid, apw, httpSession));
		return "manager/managermain";
	}
	//3. 관리자 로그아웃
	@RequestMapping(params ="method=logout", method= RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		managerService.managerLogout(httpSession);
		return "redirect:main.do";
	}
	//4. 관리자 등록
	@RequestMapping(params = "method=join", method=RequestMethod.POST )
	public String joinManager(@ModelAttribute("admin") Manager manager , HttpSession httpSession, Model model) {
		model.addAttribute("managerInsert", managerService.joinManager(manager, httpSession));
		return "forward:main.do";
	}
	//5. 관리자 등록 view 
	@RequestMapping(params = "method=joinForm", method={RequestMethod.GET , RequestMethod.POST})
	public String joinForm() {
		return "manager/joinForm";
	}
	//6. 관리자 이메일 검사
	@RequestMapping(params = "method=emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String aemail, Model model) {
		model.addAttribute("emailConfirmResult", managerService.emailConfirm(aemail));
		return "manager/emailConfirm";
	}
	//7. 관리자 리스트 
	@RequestMapping(params = "method=managerList", method = RequestMethod.GET)
	public String managerList(@ModelAttribute("admin") Manager manager , Model model ) {
		model.addAttribute("managerList", managerService.managerList(manager));
		return "manager/managerList";
	}
	@RequestMapping(params = "method=detailManger", method = RequestMethod.GET)
	public String detail(String aid , Model model) {
		model.addAttribute("managerDto",managerService.detailManager(aid));
		return "manager/detailManager";
	}
	@RequestMapping(params = "method=managerDelete", method= RequestMethod.GET)
	public String delete(String aid , Model model) {
		model.addAttribute("deleteResult", managerService.deleteManager(aid));
		return "forward:manager.do?method:managerList";
	}
}











