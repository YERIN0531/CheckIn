package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Air;
@Mapper
public interface AirDao {
	
	public List<Air> airList(Air air);
	public Air getAirInfo(String acode);
	public int airReserve(Air air);
}
