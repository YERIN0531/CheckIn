package com.ocsy.checkin.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Air;
import com.ocsy.checkin.service.AirService;

@Controller
@RequestMapping(value = "air")
public class AirController {
	@Autowired
	private AirService airService;
	
	@RequestMapping(params = "method=airMain", method = { RequestMethod.GET, RequestMethod.POST })
	public String airMain() {
		return "air/airmain";
	}
	@RequestMapping(params="method=airList", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, Air air) {
		model.addAttribute("airList",airService.airList(air) );
		return "air/airmain";		
	}
	
	@RequestMapping(params="method=airReserveForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String airReserveForm(Air air, Model model) {
		model.addAttribute("airDto",air);
		return "air/airReserveForm";		
	}
	
	
	@RequestMapping(params="method=airReserveInfo", method= {RequestMethod.GET, RequestMethod.POST})
	public String airReserveInfo(Air air, Model model) {
		model.addAttribute("airDto",air);
		return "air/airReserveInfo";	
	}
	
//airReserve 실제로 예약되는 페이지 
//	@RequestMapping(params="method=airReserve", method= {RequestMethod.GET, RequestMethod.POST})
//	public String airReserve(Air air, Model model) {
//		model.addAttribute("reserveResult", airService.airReserve(air));
//		return "air/airReserveInfo";	
//	}
	
	
}
