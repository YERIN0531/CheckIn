package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ocsy.checkin.dto.TripMate_Board;
import com.ocsy.checkin.dto.TripRequest;
import com.ocsy.checkin.service.TripBoardService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value="trip")
public class TripController {
	@Autowired
	private TripBoardService tripService;
	
	@RequestMapping(params="method=tripBoardList",method= {RequestMethod.GET, RequestMethod.POST})
	public String tripBoardList(TripMate_Board tripBoard,String pageNum, Model model) {
		model.addAttribute("tripList",tripService.tripBoardList(tripBoard, pageNum));
		model.addAttribute("paging",new Paging(tripService.totCnt(tripBoard),pageNum,10,5));
		return "tripBoard/tripBoardList";
	}
	
	@RequestMapping(params="method=tripBoardDetail",method= {RequestMethod.GET, RequestMethod.POST})
	public String tripBoardDetail(int tnum, String pageNum, Model model) {
		model.addAttribute("tripBoard",tripService.tripBoardDetail(tnum));
		return "tripBoard/tripBoardDetail";
	}
	
	@RequestMapping(params="method=applyTeamView",method= {RequestMethod.GET, RequestMethod.POST})
	public String applyTeamView(int tnum) {
		return "tripBoard/applyTeamView";
	}
	@RequestMapping(params="method=applyTeam",method= {RequestMethod.GET, RequestMethod.POST})
	public String applyTeam(TripRequest tripRequest, Model model) {
		model.addAttribute("applyResult",tripService.applyTeam(tripRequest));
		return "forward:trip.do?method=tripBoardList";
	}
	
	@RequestMapping(params="method=tripWriteBoardView",method= {RequestMethod.GET, RequestMethod.POST})
	public String tripWriteBoardView() {
		return "tripBoard/tripWriteBoardView";
	}
}
