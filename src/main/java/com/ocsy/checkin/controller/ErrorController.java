package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="error")
public class ErrorController {
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(params="method=error404",method= {RequestMethod.GET,RequestMethod.POST})
	public String error404() {
		System.out.println("404에러 발생!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tjqud531@gmail.com");
		message.setTo("kok3443@naver.com");
		message.setSubject("[404 CheckIn] 총 관리자 입니다. 404에러 발생");
		String content = "총 관리자입니다. 404에러 발생했으니 빠르게 처리부탁드립니다.";
		message.setText(content);
		mailSender.send(message);
		return "error/error";
	}
	@RequestMapping(params="method=error405",method= {RequestMethod.GET,RequestMethod.POST})
	public String error405() {
		System.out.println("405에러 발생!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tjqud531@gmail.com");
		message.setTo("yunji_822@naver.com");
		message.setSubject("[405 CheckIn] 총 관리자 입니다. 405에러 발생");
		String content = "총 관리자입니다. 405에러 발생했으니 빠르게 처리부탁드립니다.";
		message.setText(content);
		mailSender.send(message);
		return "error/error";
	}
	@RequestMapping(params="method=error500",method= {RequestMethod.GET,RequestMethod.POST})
	public String error500() {
		System.out.println("500에러 발생!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tjqud531@gmail.com");
		message.setTo("chlwlsdud69@naver.com");
		message.setSubject("[500 CheckIn] 총 관리자 입니다. 500에러 발생");
		String content = "총 관리자입니다. 500에러 발생했으니 빠르게 처리부탁드립니다.";
		message.setText(content);
		mailSender.send(message);
		return "error/error";
	}
}
