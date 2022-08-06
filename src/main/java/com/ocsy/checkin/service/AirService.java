package com.ocsy.checkin.service;

import java.util.List;

import com.ocsy.checkin.dto.Air;

public interface AirService {

	public List<Air> airList(Air air);
	public Air getAirInfo(String acode);
	public int airReserve(Air air,String[] seatid);
	

	//관리자영역 , 항공기등록, 항공기삭제, 항공기 리스트, 항공기 수정
	public int airInsert(Air air);
	public List<Air> allAirList(String pageNum);
	public int totCntAir();
	public int airUpdate(Air air);
	
	public Air detailAir(String acode);
	public int airDelete(Air air);
	
	public List<String> seatList(Air air);
}
