package com.ocsy.checkin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dao.HotelDao;
import com.ocsy.checkin.dto.Hotel;
import com.ocsy.checkin.dto.Hotel_ZZim;
import com.ocsy.checkin.dto.Hotel_rs;
import com.ocsy.checkin.util.Paging;

@Service
public class HotelServiceImpl implements HotelService {
	@Autowired
	private HotelDao hotelDao;
	String backupPath = "C:\\TeamCheckin\\CheckIn\\src\\main\\webapp\\hotelImg/";
	
	@Override
	public int insertHotel(MultipartHttpServletRequest mRequest,Hotel hotel) {
		String uploadPath = mRequest.getRealPath("hotelImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] hotelimg = new String[4];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			hotelimg[idx] = mFile.getOriginalFilename();
			if(hotelimg[idx] != null && !hotelimg[idx].equals("")) {
				if(new File(uploadPath + hotelimg[idx]).exists()) {
					hotelimg[idx] = System.currentTimeMillis()+"_"+hotelimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + hotelimg[idx]));
					System.out.println("서버 파일 : " + uploadPath + hotelimg[idx]);
					System.out.println("백업 파일 : " + backupPath);
					boolean output = filecopy(uploadPath + hotelimg[idx], backupPath + hotelimg[idx]);
					System.out.println(output ? idx+"번째 백업성공" : idx+" 번째 백업 실패");
				} catch(IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				hotelimg[idx] = "";
			}
			idx++;
		}
		hotel.setHotelimage(hotelimg[0]);
		hotel.setStandardimage(hotelimg[1]);
		hotel.setDeluxeimage(hotelimg[2]);
		hotel.setSweetimage(hotelimg[3]);
		int result = 0;
		result += hotelDao.insertHotel1(hotel);
		result += hotelDao.insertHotel2(hotel);
		result += hotelDao.insertHotel3(hotel);
		if(result == 3) {
			System.out.println("호텔 등록 성공");
		}
		return result;
	}

	@Override
	public int deleteHotel(String hotelid) {
		int result = 0;
		result += hotelDao.deleteHZZim(hotelid);
		result += hotelDao.deleteHotel(hotelid);
		if(result >= 1) {
			System.out.println("호텔 삭제 성공");
		}
		return result;
	}

	@Override
	public int updateHotel(MultipartHttpServletRequest mRequest,Hotel hotel) {
		String uploadPath = mRequest.getRealPath("hotelImg/");
		Iterator<String> params = mRequest.getFileNames();  
		String[] hotelimg = new String[1];  
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			hotelimg[idx] = mFile.getOriginalFilename();
			if(hotelimg[idx] != null && !hotelimg[idx].equals("")) {  // 이럴경우 파일 첨부했을 경우
				if(new File(uploadPath + hotelimg[idx]).exists()) {
					hotelimg[idx] = System.currentTimeMillis()+"_"+hotelimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + hotelimg[idx]));
					System.out.println("서버 파일 : " + uploadPath + hotelimg[idx]);
					System.out.println("백업 파일 : " + backupPath);
					boolean result = filecopy(uploadPath + hotelimg[idx], backupPath + hotelimg[idx]);
					System.out.println(result ? idx+"번째 백업성공" : idx+" 번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else { 
				// 파일 첨부 안한경우 bimg[idx] = ""
				hotelimg[idx] = "";
			}
			idx++;
		}
		hotel.setHotelimage(hotelimg[0]);
		int result = hotelDao.updateHotel(hotel);
		if(result == 3) {
			System.out.println(hotel.getHotelname() + " 수정 성공");
		}
		return result;
	}

	@Override
	public List<Hotel> getHotelDetail(String hotelid) {		
		return hotelDao.getHotelDetail(hotelid);
	}

	@Override
	public int updateHotelRoom(MultipartHttpServletRequest mRequest,Hotel hotel) {
		String uploadPath = mRequest.getRealPath("hotelImg/");
		Iterator<String> params = mRequest.getFileNames();  
		String[] roomimage = new String[1];  
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			roomimage[idx] = mFile.getOriginalFilename();
			if(roomimage[idx] != null && !roomimage[idx].equals("")) {  // 이럴경우 파일 첨부했을 경우
				if(new File(uploadPath + roomimage[idx]).exists()) {
					roomimage[idx] = System.currentTimeMillis()+"_"+roomimage[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + roomimage[idx]));
					System.out.println("서버 파일 : " + uploadPath + roomimage[idx]);
					System.out.println("백업 파일 : " + backupPath);
					boolean result = filecopy(uploadPath + roomimage[idx], backupPath + roomimage[idx]);
					System.out.println(result ? idx+"번째 백업성공" : idx+" 번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else { 
				// 파일 첨부 안한경우 bimg[idx] = ""
				roomimage[idx] = "";
			}
			idx++;
		}
		hotel.setRoomimage(roomimage[0]);		
		int result = hotelDao.updateHotelRoom(hotel);
		return result;
	}

	@Override
	public List<Hotel> checkHotelReservationList(Hotel hotel) {
		return hotelDao.checkHotelReservationList(hotel);
	}

	@Override
	public List<Hotel_rs> myHotelReservationList(String mid) {
		return hotelDao.myHotelReservationList(mid);
	}

	@Override
	public int canselHotel(int hrs_num) {
		int result = hotelDao.canselHotel(hrs_num);
		if(result == 1) {
			System.out.println("호텔 예약 취소");
		}
		return result;
	}

	@Override
	public int insertHotelReservation(Hotel_rs hotel_rs) {
		int result = hotelDao.insertHotelReservation(hotel_rs);
		if(result == 1) {
			System.out.println("호텔 예약 성공");
		}
		return result;
	}

	@Override
	public List<Hotel_rs> checkHotelReservation(Hotel hotel) {
		return hotelDao.checkHotelReservation(hotel);  
	}

	@Override
	public int insertHZZim(Hotel_ZZim hzzim) {
		int result = hotelDao.insertHZZim(hzzim);
		if(result == 1) {
			System.out.println("호텔 찜 성공");
		}
		return result;
	}

	@Override
	public int checkZZim(Hotel_ZZim hzzim) {
		return hotelDao.checkZZim(hzzim);
	}

	@Override
	public List<Hotel> myHZZimList(String mid) {
		return hotelDao.myHZZimList(mid);
	}

	@Override
	public int cancelHZZim(Hotel_ZZim hzzim) {
		int result = hotelDao.cancelHZZim(hzzim);
		if(result == 1) {
			System.out.println("찜 취소 성공");
		}
		return result;
	}
	
	
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		// 복사
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];  // 파일 크기를 1MB로 제한했기때문에 long 형이 들어올수 없으므로 int로 형변환
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) {
					break;
				}
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage() + serverFile + " 이란 파일이 없습니다.");
		} catch (IOException e) {
			// 이거는 파일 읽어올때 예외 
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os != null) {
					os.close();
				}
				if(is != null) {
					is.close();
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public List<Hotel> adminHotelList(String pageNum, Hotel hotel) {
		Paging paging = new Paging(hotelDao.totAllHotel(), pageNum,10,5);
		hotel.setStartRow(paging.getStartRow());
		hotel.setEndRow(paging.getEndRow());
		return hotelDao.adminHotelList(hotel);
	}

	@Override
	public int totAllHotel() {
		return hotelDao.totAllHotel();
	}


}
