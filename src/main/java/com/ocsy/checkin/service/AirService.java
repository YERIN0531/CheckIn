package com.ocsy.checkin.service;

import java.util.List;

import com.ocsy.checkin.dto.Air;

public interface AirService {

	public List<Air> airList(Air air);
	public Air getAirInfo(String acode);
	public int airReserve(Air air);
}
