package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.Hotel;
import com.ocsy.checkin.service.HotelService;

@Controller
@RequestMapping(value="hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	
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
}
