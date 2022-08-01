package com.ocsy.checkin.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.AirDao;
import com.ocsy.checkin.dto.Air;
@Service
public class AirServiceImpl implements AirService {

	@Autowired
	private AirDao airDao;
	
	@Override
	public List<Air> airList(Air air) {
		return airDao.airList(air);
	}

	@Override
	public Air getAirInfo(String acode) {
		return airDao.getAirInfo(acode);
	}

	@Override
	public int airReserve(Air air) {
		return airDao.airReserve(air);
	}

}
