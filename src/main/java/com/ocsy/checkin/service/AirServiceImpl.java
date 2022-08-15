package com.ocsy.checkin.service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.AirDao;
import com.ocsy.checkin.dto.Air;
import com.ocsy.checkin.util.Paging;
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
	public int airReserve(Air air, String[] seatid) {
		//확장포뭄ㄴ 써서 seatid 가 여러개 들어왔을수 있다는 전제하에
		int result =0;
		for(String seat:seatid) {
			air.setSeatid(seat);
			result += airDao.airReserve(air);
		}
		return result;
	}

	@Override
	public int airInsert(Air air) {
		return airDao.airInsert(air);
	}

	@Override
	public List<Air> allAirList(String pageNum) {
		Paging paging = new Paging(airDao.totCntAir(), pageNum,8,5);
		Air air = new Air();
		air.setStartRow(paging.getStartRow());
		air.setEndRow(paging.getEndRow());
		return airDao.allAirList(air);
	}

	@Override
	public int totCntAir() {
		return airDao.totCntAir();
	}

	@Override
	public int airUpdate(Air air) {
		return airDao.airUpdate(air);
	}

	@Override
	public Air detailAir(String acode) {
		return airDao.detailAir(acode);
	}

	@Override
	public int airDelete(Air air) {
		return airDao.airDelete(air);
	}

	@Override
	public List<String> seatList(Air air) {
		ArrayList<String> seatDbList = (ArrayList<String>) airDao.seatList(air);
		ArrayList<String> seats = new ArrayList<String>();
		for(int i=0; i<20; i++) {
			if(seatDbList.contains("A"+(i+1))) {
				System.out.println("A"+(i+1)+"은 예약가능");
				seats.add("a"+i);
			}else {
				System.out.println("A"+(i+1)+"은 예약불가");
				seats.add("");
			}
		}
		return seats;
	}

	
}
