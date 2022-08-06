package com.ocsy.checkin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		tripService.applyMailSend(tripRequest.getTnum());
		return "forward:trip.do?method=tripBoardList";
	}
	
	@RequestMapping(params="method=tripWriteBoardView",method= {RequestMethod.GET, RequestMethod.POST})
	public String tripWriteBoardView() {
		return "tripBoard/tripWriteBoardView";
	}
	
	@RequestMapping(params="method=tripWriteBoard",method= {RequestMethod.GET, RequestMethod.POST})
	public String tripWriteBoard(MultipartHttpServletRequest mRequest,HttpServletRequest request, TripMate_Board tripBoard) {
		int writeBoardResult = tripService.tripWriteBoard(mRequest, request, tripBoard);
		return "redirect:trip.do?method=tripBoardList&pageNum=1&writeBoardResult="+writeBoardResult;
	}
	
	@RequestMapping(params="method=tripBoardModifyView",method= {RequestMethod.GET,RequestMethod.POST})
	public String tripBoardModifyView(int tnum, Model model) {
		model.addAttribute("boardDto",tripService.tripBoardDetailNoHit(tnum));
		return "tripBoard/tripBoardModifyView";
	}
	
	@RequestMapping(params="method=tripBoardModify",method={RequestMethod.GET, RequestMethod.POST})
	public String tripBoardModify(MultipartHttpServletRequest mRequest,TripMate_Board tripBoard) {
		int modifyResult = tripService.tripBoardModify(mRequest, tripBoard);
		return "redirect:trip.do?method=tripBoardList&pageNum=1&modifyResult="+modifyResult;
	}
	
	@RequestMapping(params="method=myTeamList",method= {RequestMethod.GET, RequestMethod.POST})
	public String myTeamApplyList(HttpSession httpSession,Model model) {
		String mid = (String)httpSession.getAttribute("mid");
		model.addAttribute("myTeamList",tripService.myTeamList(mid));
		return "myPage/myTeamList";
	}
	
	@RequestMapping(params="method=myTeamDetail",method={RequestMethod.GET, RequestMethod.POST})
	public String myTeamDetail(int tnum, Model model) {
		model.addAttribute("myTeamDetail",tripService.myTeamDetail(tnum));
		return "myPage/myTeamDetail";
	}
	
	@RequestMapping(params="method=myTeamApplyList",method={RequestMethod.GET, RequestMethod.POST})
	public String myTeamApplyList(TripRequest tripRequest, Model model) {
		model.addAttribute("myteamApplyList",tripService.myTeamApplyList(tripRequest));
		return "myPage/myTeamApplyList";
	}
	
	@RequestMapping(params="method=agreeTeam",method= {RequestMethod.GET, RequestMethod.POST})
	public String agreeTeam(TripRequest tripRequest,HttpSession httpSession, Model model) {
		model.addAttribute("agreeTeamResult",tripService.agreeTeam(tripRequest));
		tripService.agreeMailSend(tripRequest);
		return "forward:trip.do?method=myTeamList";
	}
	
	@RequestMapping(params="method=disagreeTeam",method={RequestMethod.GET, RequestMethod.POST})
	public String disagreeTeam(TripRequest tripRequest, Model model) {
		model.addAttribute("disagreeTeamResult",tripService.disagreeTeam(tripRequest));
		return "forward:trip.do?method=myTeamList";
	}
	
	@RequestMapping(params="method=dollarApi",method={RequestMethod.GET, RequestMethod.POST})
	public String dollarApi() {
		return "main/dollarApi";
	}
}
