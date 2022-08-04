package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.TripMate_Board;
import com.ocsy.checkin.dto.TripRequest;
import com.ocsy.checkin.dto.TripTeam;

@Mapper
public interface TripBoardDao {
	public List<TripMate_Board> tripBoardList(TripMate_Board tripBoard);
	
	public int totCnt(TripMate_Board tripBoard);
	
	public TripMate_Board tripBoardDetail(int tnum);
	
	public void tripBoardHitUp(int tnum);
	
	public int tripBoardWriteBoard(TripMate_Board tripBoard);
	
	public int tripTeamLeaderInsert(String mid);
	
	public String teamLeaderSelect(int tnum);
	
	public List<TripTeam> myTeamList(String mid);
	
	public List<TripTeam> myTeamDetail(int tnum);
	
	public int applyTeam(TripRequest tripRequest);
	
	public List<TripRequest> myTeamApplyList(TripRequest tripRequest);
	
	
	public int agreeTeam1(TripRequest tripRequest);
	
	public int agreeTeam2(TripRequest tripRequest);
	
	public int agreeTeam3(TripRequest tripRequest);
	
	public int disagreeTeam(TripRequest tripRequest);
}
