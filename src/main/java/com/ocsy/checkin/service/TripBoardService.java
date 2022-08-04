package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.TripMate_Board;
import com.ocsy.checkin.dto.TripRequest;
import com.ocsy.checkin.dto.TripTeam;

public interface TripBoardService {
	public List<TripMate_Board> tripBoardList(TripMate_Board tripBoard, String pageNum);
	
	public int totCnt(TripMate_Board tripBoard);
		
	public TripMate_Board tripBoardDetail(int tnum);
		
	public int tripWriteBoard(MultipartHttpServletRequest mRequest,HttpServletRequest request,TripMate_Board tripBoard); // 여기에 리더 등록도 같이
	
	public String teamLeaderSelect(int tnum);
	
	public List<TripTeam> myTeamList(String mid);
	
	public List<TripTeam> myTeamDetail(int tnum);
	
	public int applyTeam(TripRequest tripRequest);
	
	public List<TripRequest> myTeamApplyList(TripRequest tripRequest);
	
	public int agreeTeam(TripRequest tripRequest);
	
	public int disagreeTeam(TripRequest tripRequest);
}
