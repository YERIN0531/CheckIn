package com.ocsy.checkin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dao.TripBoardDao;
import com.ocsy.checkin.dto.TripMate_Board;
import com.ocsy.checkin.dto.TripRequest;
import com.ocsy.checkin.dto.TripTeam;
import com.ocsy.checkin.util.Paging;

@Service
public class TripBoardServiceImpl implements TripBoardService {
	@Autowired
	private TripBoardDao tripDao;
	String backupPath ="C:\\TeamCheckin\\CheckIn\\src\\main\\webapp\\fileUpload\\";
	
	@Override
	public List<TripMate_Board> tripBoardList(TripMate_Board tripBoard, String pageNum) {
		Paging paging = new Paging(tripDao.totCnt(tripBoard),pageNum,10,5);
		tripBoard.setStartRow(paging.getStartRow());
		tripBoard.setEndRow(paging.getEndRow());
		return tripDao.tripBoardList(tripBoard);
	}
	
	@Override
	public int totCnt(TripMate_Board tripBoard) {
		return tripDao.totCnt(tripBoard);
	}

	@Override
	public TripMate_Board tripBoardDetail(int tnum) {
		tripDao.tripBoardHitUp(tnum);
		return tripDao.tripBoardDetail(tnum);
	}

	@Override
	public int tripWriteBoard(MultipartHttpServletRequest mRequest,HttpServletRequest request, TripMate_Board tripBoard) {
		tripBoard.setTip(request.getRemoteAddr());
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); 
		String timg = new String();
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			timg = mFile.getOriginalFilename();
			if(timg != null && !timg.equals("")) {
				if(new File(uploadPath + timg).exists()) {
					timg = System.currentTimeMillis() + "_"+timg;
				}
				try {
					mFile.transferTo(new File(uploadPath + timg));
					System.out.println("서버파일 : " + uploadPath + timg);
					System.out.println("백업파일 : " + backupPath + timg);
					boolean result = fileCopy(uploadPath + timg, backupPath + timg);
					System.out.println(result ? "백업성공" : "백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				timg = "";
			}
		}
		tripBoard.setTimage(timg);
		int result = tripDao.tripBoardWriteBoard(tripBoard);
		result += tripDao.tripTeamLeaderInsert(tripBoard.getMid());
		return result;
	}

	@Override
	public String teamLeaderSelect(int tnum) {
		return tripDao.teamLeaderSelect(tnum);
	}

	@Override
	public List<TripTeam> myTeamList(String mid) {
		return tripDao.myTeamList(mid);
	}

	@Override
	public List<TripTeam> myTeamDetail(int tnum) {
		return tripDao.myTeamDetail(tnum);
	}

	@Override
	public int applyTeam(TripRequest tripRequest) {
		return tripDao.applyTeam(tripRequest);
	}

	@Override
	public List<TripRequest> myTeamApplyList(TripRequest tripRequest) {
		return tripDao.myTeamApplyList(tripRequest);
	}

	@Override
	public int agreeTeam(TripRequest tripRequest) {
		int result = tripDao.agreeTeam1(tripRequest);
		result += tripDao.agreeTeam2(tripRequest);
		result += tripDao.agreeTeam3(tripRequest);
		return result;
	}
	
	@Override
	public int disagreeTeam(TripRequest tripRequest) {
		return tripDao.disagreeTeam(tripRequest);
	}
	
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	

	

}
