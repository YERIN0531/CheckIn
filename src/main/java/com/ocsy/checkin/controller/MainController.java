package com.ocsy.checkin.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "main.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model) {		
		return "main/main";
	}
	
	@RequestMapping(value = "dongjun")
	public String dongjun() {
		return "main/dongjun";
	}
	@RequestMapping(value = "jinyoung")
	public String jinyoung() {
		return "main/jinyoung";
	}
	@RequestMapping(value = "yerin")
	public String yerin() {
		return "main/yerin";
	}
	@RequestMapping(value = "zeoilm")
	public String zeolim() {
		return "main/zeoilm";
	}
}
