package com.ocsy.checkin.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "main.do", method= {RequestMethod.GET, RequestMethod.POST})
	   public String main(Locale locale, Model model) {
	      return "main/main";
	   }

	@RequestMapping(value = "intro.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String intro(Locale locale, Model model) {
		return "main/intro";
	}
	
	@RequestMapping(value = "main2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main2(Locale locale, Model model) {
		return "main/main2";
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
