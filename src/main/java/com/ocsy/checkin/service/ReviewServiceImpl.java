package com.ocsy.checkin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.ocsy.checkin.dao.ReviewBoardDao;
import com.ocsy.checkin.dto.ReviewBoard;
import com.ocsy.checkin.util.Paging;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewBoardDao reviewDao;
	String backupPath ="C:\\TeamCheckin\\CheckIn\\src\\main\\webapp\\fileUpload\\";
	@Override
	public List<ReviewBoard> listReview(String pageNum) {
		Paging paging = new Paging(reviewDao.countReview(), pageNum, 10, 10);
		ReviewBoard review = new ReviewBoard();
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		return reviewDao.listReview(review);
	}

	@Override
	public int countReview() {
		return reviewDao.countReview();
	}

	@Override
	public ReviewBoard detailReview(int rnum) {
		reviewDao.revuewHitUp(rnum);
		return reviewDao.detailReview(rnum);
	}
	@Override
	public ReviewBoard reviewModifyReplyView(int rnum) { // 조회수 안올리고 수정하기 뷰 답글 뷰
		return reviewDao.reviewModifyReplyView(rnum);
	}

	@Override
	public int insertReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review) {
		//파일 업로드 로직
		review.setRip(request.getRemoteAddr()); // ip  셋팅
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1 , tempBimg2 
		String[] rimg = new String[5]; // 이미지 5개 들어오니 배열로 
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체 생성 ! 
			rimg[idx] = mFile.getOriginalFilename(); // 맨처음에 첨부한 파일 이름 이걸 받아서 똑같은게 있으면 변경하고 없으면 그대로 
			if(rimg[idx]!=null && !rimg[idx].equals("")) { // 첨부함 
				if(new File(uploadPath + rimg[idx]).exists()){ // 서버에 같은 파일이름이 있을 경우
					rimg[idx] = System.currentTimeMillis() + "_" + rimg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + rimg[idx]));
					System.out.println("서버파일 : " + uploadPath + rimg[idx]);
					System.out.println("백업파일 : " + backupPath + rimg[idx]);// 백업 : 껐다가 켰을때 안사라지게
					boolean result = fileCopy(uploadPath + rimg[idx], backupPath + rimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx +"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일 첨부 안 하면 bimg[idx] = ""  빈스트링이 들어감 
				rimg[idx] = "";
			}//if
			idx ++;
		}// while
		
		review.setRimage1(rimg[0]); // 
		review.setRimage2(rimg[1]); // 
		review.setRimage3(rimg[2]); // 
		review.setRimage4(rimg[3]); // 
		review.setRimage5(rimg[4]); //
		System.out.println("정보" + review);
		return reviewDao.insertReview(review); // DB insert
	}

	

	

	@Override
	public int replyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review) {
		review.setRip(request.getRemoteAddr()); // ip  셋팅
		reviewDao.replyPreStepReview(review);
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1 , tempBimg2 
		String[] rimg = new String[5]; // 이미지 5개 들어오니 배열로 
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체 생성 ! 
			rimg[idx] = mFile.getOriginalFilename(); // 맨처음에 첨부한 파일 이름 이걸 받아서 똑같은게 있으면 변경하고 없으면 그대로 
			if(rimg[idx]!=null && !rimg[idx].equals("")) { // 첨부함 
				if(new File(uploadPath + rimg[idx]).exists()){ // 서버에 같은 파일이름이 있을 경우
					rimg[idx] = System.currentTimeMillis() + "_" + rimg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + rimg[idx]));
					System.out.println("서버파일 : " + uploadPath + rimg[idx]);
					System.out.println("백업파일 : " + backupPath + rimg[idx]);// 백업 : 껐다가 켰을때 안사라지게
					boolean result = fileCopy(uploadPath + rimg[idx], backupPath + rimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx +"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일 첨부 안 하면 bimg[idx] = ""  빈스트링이 들어감 
				//bimg[idx] = "";
			}//if
			idx ++;
		}// while
		
		review.setRimage1(rimg[0]); // 
		review.setRimage2(rimg[1]); // 
		review.setRimage3(rimg[2]); // 
		review.setRimage4(rimg[3]); // 
		review.setRimage5(rimg[4]); //
		return reviewDao.replyReview(review); // DB insert
	}

	@Override
	public int modifyReview(MultipartHttpServletRequest mRequest,HttpServletRequest request, ReviewBoard review) {
		review.setRip(request.getRemoteAddr()); // ip  셋팅
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1 , tempBimg2 
		String[] rimg = new String[5]; // 이미지 5개 들어오니 배열로 
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체 생성 ! 
			rimg[idx] = mFile.getOriginalFilename(); // 맨처음에 첨부한 파일 이름 이걸 받아서 똑같은게 있으면 변경하고 없으면 그대로 
			if(rimg[idx]!=null && !rimg[idx].equals("")) { // 첨부함 
				if(new File(uploadPath + rimg[idx]).exists()){ // 서버에 같은 파일이름이 있을 경우
					rimg[idx] = System.currentTimeMillis() + "_" + rimg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + rimg[idx]));
					System.out.println("서버파일 : " + uploadPath + rimg[idx]);
					System.out.println("백업파일 : " + backupPath + rimg[idx]);// 백업 : 껐다가 켰을때 안사라지게
					boolean result = fileCopy(uploadPath + rimg[idx], backupPath + rimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx +"번째 백업실패");
					System.out.println(idx);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일 첨부 안 하면 bimg[idx] = ""  빈스트링이 들어감 
				//rimg[idx] = "";
			}//if
			idx ++;
		}// while
		review.setRimage1(rimg[0]); // 
		review.setRimage2(rimg[1]); // 
		review.setRimage3(rimg[2]); // 
		review.setRimage4(rimg[3]); // 
		review.setRimage5(rimg[4]); //
		return reviewDao.modifyReview(review); // DB insert
	}

	
	@Override
	public int deleteReview(ReviewBoard review) {
		
		return reviewDao.deleteReview(review);
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
