package com.ocsy.checkin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Hotel;
import com.ocsy.checkin.dto.Hotel_rs;
import com.ocsy.checkin.dto.Member;
import com.ocsy.checkin.service.HotelService;
import com.ocsy.checkin.service.MemberService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value="hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(params="method=hotelSearch",method= {RequestMethod.GET,RequestMethod.POST})
	public String hotelSearchView() {
		return "hotel/hotelSearch";
	}
	@RequestMapping(params = "method=schHotel", method= {RequestMethod.GET, RequestMethod.POST })    // 호텔 목록 조회할때 
	public String schHotel(Hotel hotel, Model model) {
		model.addAttribute("hotelList",hotelService.checkHotelReservationList(hotel));
		model.addAttribute("hotel",hotel);
		return "hotel/hotelList";
	}
	@RequestMapping(params = "method=getHotelDetail", method= {RequestMethod.GET,RequestMethod.POST})   // 호텔 디테일 들어갔을떄
	public String getHotelDetail(@ModelAttribute("hotelDto") Hotel hotel,Model model) {
		model.addAttribute("hotelDetail",hotelService.getHotelDetail(hotel.getHotelid()));
		model.addAttribute("checkHotelDetail",hotelService.checkHotelReservation(hotel));
		return "hotel/hotelDetail";
	}
	@RequestMapping(params = "method=insertHotelReservationView",method = {RequestMethod.GET, RequestMethod.POST})
	public String insertHotelReservationView(Hotel hotel,Model model,HttpSession session) {
		model.addAttribute("reservationInfo",hotel);
		model.addAttribute("hotelInfo",hotelService.getHotelDetail(hotel.getHotelid()));
		return "hotel/hotelReservationInfo";
	}
	@RequestMapping(params="method=payPage",method= {RequestMethod.GET,RequestMethod.POST})
	public String payPage(Hotel_rs hotel_rs,int payprice,String roomtype, String hotelname,String roomimage, Model model) {	
		model.addAttribute("payprice",payprice);
		model.addAttribute("roomtype",roomtype);
		model.addAttribute("hotelname",hotelname);
		model.addAttribute("roomimage",roomimage);
		return "main/payPage";
	}
	
	@RequestMapping(params="method=insertHotelReservation",method= {RequestMethod.GET, RequestMethod.POST})
	public String insertHotelReservation(Hotel_rs hotel_rs,Member member,HttpSession session, Model model) {
		memberService.minusMileage(member);
		memberService.plusMileage(member,session);
		model.addAttribute("insertHotelReservation",hotelService.insertHotelReservation(hotel_rs));
		return "main/reserveResult";
	}
	
	/* ****************************************관리자 영역***********************************/
	@RequestMapping(params="method=insertHotel",method= {RequestMethod.GET,RequestMethod.POST})
	public String insertHotelView() {
		return "adminHotel/insertView";
	}
	
	@RequestMapping(params="method=adminInsertHotel",method =RequestMethod.POST)
	public String insertHotel(MultipartHttpServletRequest mRequest,Hotel hotel, Model model) {
		model.addAttribute("insertHotelResult",hotelService.insertHotel(mRequest, hotel));
		return "forward:hotel.do?method=adminHotelList";
	}
	
	@RequestMapping(params="method=adminHotelList",method= {RequestMethod.GET,RequestMethod.POST})
	public String adminHotelList(String pageNum,Hotel hotel,Model model) {
		model.addAttribute("hotelList",hotelService.adminHotelList(pageNum, hotel));
		model.addAttribute("paging",new Paging(hotelService.totAllHotel(), pageNum));
		return "adminHotel/hotelList";
	}

	@RequestMapping(params="method=failInsertHotelMail",method= {RequestMethod.GET,RequestMethod.POST})
	public String failInsertHotelMail(Model model) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tjqud531@gmail.com");
		message.setTo("chlwlsdud43@gmail.com");
		message.setSubject("[급신]관리자가 호텔 등록중 오류가 발생했습니다. 빠른 확인 부탁드립니다.[급신]");
		String content = "최진영 관리자님 호텔 등록중 오류가 발생했습니다. 빠른 확인 및 처리 부탁드립니다.";
		message.setText(content);
		mailSender.send(message);
		model.addAttribute("errorResult","관리자가 해결할 동안 잠시 호텔등록을 멈춰주세요.");
		return "forward:hotel.do?method=adminHotelList";
	}
	
	@RequestMapping(params="method=updateHotelView",method= {RequestMethod.GET, RequestMethod.POST})
	public String updateHotelView(String hotelid, String pageNum, Model model) {
		hotelid = hotelid.substring(0,3);
		model.addAttribute("hotelDetail",hotelService.getHotelDetail(hotelid));
		return "adminHotel/updateHotelView";
	}
	
	@RequestMapping(params="method=updateHotel",method= {RequestMethod.GET,RequestMethod.POST})
	public String updateHotel(MultipartHttpServletRequest mRequest,Hotel hotel,Model model) {
		model.addAttribute("updateHotelResult",hotelService.updateHotel(mRequest, hotel));
		return "forward:hotel.do?method=updateHotelView&hotelid"+hotel.getHotelid();
	}
	
	@RequestMapping(params="method=updateHotelRoom",method= {RequestMethod.GET,RequestMethod.POST})
	public String updateHotelRoom(MultipartHttpServletRequest mRequest,Hotel hotel,Model model) {
		model.addAttribute("updateHotelRoomResult",hotelService.updateHotelRoom(mRequest, hotel));
		return "forward:hotel.do?method=updateHotelView&hotelid"+hotel.getHotelid().substring(0,3);
	}
	
	@RequestMapping(params="method=deleteHotelView",method= {RequestMethod.GET,RequestMethod.POST})
	public String deleteHotelView(String hotelid) {
		return "adminHotel/deleteHotelView";
	}
	
	@RequestMapping(params="method=deleteHotel",method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteHotel(String hotelid,Model model) {
		hotelService.deleteHidZZim(hotelid);
		model.addAttribute("deleteHotelResult",hotelService.deleteHotel(hotelid));
		return "forward:hotel.do?method=adminHotelList";
	}
}
