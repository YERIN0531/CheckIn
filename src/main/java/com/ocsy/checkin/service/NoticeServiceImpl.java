package com.ocsy.checkin.service;

import java.io.File;
import java.io.FileInputStream;
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

import com.ocsy.checkin.dao.NoticeBoardDao;
import com.ocsy.checkin.dto.NoticeBoard;
import com.ocsy.checkin.util.Paging;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeBoardDao noticeDao;
	String backupPath ="C:\\TeamCheckin\\CheckIn\\src\\main\\webapp\\fileUpload\\";
	@Override
	public List<NoticeBoard> listNotice(String pageNum) {
		Paging paging  = new Paging(noticeDao.countNotice(), pageNum, 3, 3);
		NoticeBoard notice = new NoticeBoard();
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		return noticeDao.listNotice(notice);
	}

	@Override
	public int countNotice() {
		
		return noticeDao.countNotice();
	}

	@Override
	public NoticeBoard detailNotice(int nnum) {
		noticeDao.hitupNotice(nnum);
		return noticeDao.detailNotice(nnum);
	}

	@Override
	public int insertNotice(MultipartHttpServletRequest mRequest, NoticeBoard notice) {
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1 , tempBimg2 
		String nimg = new String(); // 이미지 5개 들어오니 배열로 
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체 생성 ! 
			nimg = mFile.getOriginalFilename(); // 맨처음에 첨부한 파일 이름 이걸 받아서 똑같은게 있으면 변경하고 없으면 그대로 
			 if(nimg !=null && !nimg.equals("")) { // 첨부함 
				if(new File(uploadPath + nimg).exists()){ // 서버에 같은 파일이름이 있을 경우
					nimg = System.currentTimeMillis() + "_" + nimg;
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + nimg));
					System.out.println("서버파일 : " + uploadPath + nimg);
					System.out.println("백업파일 : " + backupPath + nimg);// 백업 : 껐다가 켰을때 안사라지게
					boolean result = fileCopy(uploadPath + nimg, backupPath + nimg);
					System.out.println(result ? nimg + "번째 백업성공" : nimg +"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일 첨부 안 하면 bimg[idx] = ""  빈스트링이 들어감 
				nimg = "";
			}//if
		}//if
		notice.setNimage(nimg); //
		return noticeDao.insertNotice(notice);// DB insert
	}

	@Override
	public int modifyNotice(MultipartHttpServletRequest mRequest, NoticeBoard notice) {
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1 , tempBimg2 
		String nimg = new String(); // 이미지 5개 들어오니 배열로 
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체 생성 ! 
			nimg = mFile.getOriginalFilename(); // 맨처음에 첨부한 파일 이름 이걸 받아서 똑같은게 있으면 변경하고 없으면 그대로 
			 if(nimg !=null && !nimg.equals("")) { // 첨부함 
				if(new File(uploadPath + nimg).exists()){ // 서버에 같은 파일이름이 있을 경우
					nimg = System.currentTimeMillis() + "_" + nimg;
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + nimg));
					System.out.println("서버파일 : " + uploadPath + nimg);
					System.out.println("백업파일 : " + backupPath + nimg);// 백업 : 껐다가 켰을때 안사라지게
					boolean result = fileCopy(uploadPath + nimg, backupPath + nimg);
					System.out.println(result ? nimg + "번째 백업성공" : nimg +"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일 첨부 안 하면 bimg[idx] = ""  빈스트링이 들어감 
				nimg = "";
			}//if
		}//if
		notice.setNimage(nimg);; // 
		return noticeDao.modifyNotice(notice);// DB insert
	}

	@Override
	public int deleteNotice(int nnum) {
		return noticeDao.deleteNotice(nnum);
	}
	
	//fileCopy
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

	@Override
	public NoticeBoard modifylView(int nnum) {
		return noticeDao.modifylView(nnum);
	}
}
