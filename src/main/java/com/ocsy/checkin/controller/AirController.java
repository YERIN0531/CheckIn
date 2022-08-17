package com.ocsy.checkin.controller;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Air;
import com.ocsy.checkin.dto.Member;
import com.ocsy.checkin.service.AirService;
import com.ocsy.checkin.service.MemberService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value = "air")
public class AirController {
	@Autowired
	private AirService airService;
	@Autowired
	private MemberService memberService;
	
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
	public String airReserveInfo(Air air, Model model, String[] seatid) {
		System.out.println("예약한 좌성은 "+Arrays.toString(seatid));
		model.addAttribute("seatid",seatid);
		model.addAttribute("airDto",air);
		return "air/airReserveInfo";	
	}
	
	@RequestMapping(params="method=airReserve", method= {RequestMethod.GET, RequestMethod.POST})
	public String airReserve(@ModelAttribute("m")Member member, Air air, HttpSession session, Model model, String[] seatid) {
		memberService.minusMileage(member);
		memberService.plusMileage(member, session);
		model.addAttribute("reserveResult", airService.airReserve(air, seatid));
		return "main/reserveResult";	
	}
	@RequestMapping(params="method=airInsertView", method= {RequestMethod.GET, RequestMethod.POST})
	public String airInsertView() {
		return "adminAir/airInsertView";
	}
	
	@RequestMapping(params="method=airInsert", method= {RequestMethod.GET, RequestMethod.POST})
	public String airInsert(Air air, Model model) {
		model.addAttribute("insertAirResult", airService.airInsert(air)); ///////////에어리스트 단으로 넘어갈때 페이징 정보 가지고 가야하는지 
		return "adminAir/airList"; 
	}
	
	@RequestMapping(params="method=allAirList", method= {RequestMethod.GET, RequestMethod.POST})
	public String allAirList(Model model, String pageNum) {
		model.addAttribute("allAirList",airService.allAirList(pageNum) );
		model.addAttribute("paging", new Paging(airService.totCntAir(), pageNum, 8, 5));
		return "adminAir/airList";		
	}
	
	
	@RequestMapping(params="method=airModifyView", method= {RequestMethod.GET, RequestMethod.POST})
	public String airModifyView(String pageNum, Model model, String acode) {
		// detail 만들고 (xml,service,dao 다 생성해놓고, jsp 만들지말고 컨트롤러만 생성해준다음 그 부분 model에 attribute 해서 modifyview에 뿌려주기)
		model.addAttribute("airdetail", airService.detailAir(acode));
		return "adminAir/airModifyForm";
	}
	@RequestMapping(params="method=airModify", method= {RequestMethod.GET, RequestMethod.POST})
	public String airModify(Air air, Model model, String pageNum) {
		model.addAttribute("airModifyResult", airService.airUpdate(air));
		model.addAttribute("allAirList",airService.allAirList(pageNum) );
		model.addAttribute("paging", new Paging(airService.totCntAir(), pageNum, 8, 5));
		return "adminAir/airList";
	}
	
	@RequestMapping(params="method=airDelete", method= {RequestMethod.GET, RequestMethod.POST})
	public String airDelete(Air air, Model model, String pageNum) {
		model.addAttribute("airDeleteResult", airService.airDelete(air));
		model.addAttribute("allAirList",airService.allAirList(pageNum) );
		model.addAttribute("paging", new Paging(airService.totCntAir(), pageNum, 8, 5));
		return "adminAir/airList";
	}
	
	@RequestMapping(params="method=reservation", method= {RequestMethod.GET, RequestMethod.POST})
	public String reservation(Model model, Air air) {

		model.addAttribute("airDto",air);
		model.addAttribute("seats",airService.seatList(air));
		// 시간 항공기 번호 
		return "air/airReserve";
	}
	
	@RequestMapping(params="method=myAirReserveList",method={RequestMethod.GET, RequestMethod.POST})
	public String myAirReserveList(String mid, Model model) {
		model.addAttribute("myAirReserveList",airService.myAirReserveList(mid));
		return "myPage/myAirList";
	}
	
	
	
}















