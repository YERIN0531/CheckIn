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

import com.ocsy.checkin.dao.QnaBoardDao;
import com.ocsy.checkin.dto.QnaBoard;
import com.ocsy.checkin.util.Paging;
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaBoardDao qnaDao;
	String backupPath = "C:\\TeamCheckin\\CheckIn\\src\\main\\webapp\\fileUpload\\";
	@Override
	public List<QnaBoard> listQna(String pageNum) { // 글목록
		Paging paging = new Paging(qnaDao.countQna(), pageNum, 7, 7);
		QnaBoard qna = new QnaBoard();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.listQna(qna);
	}

	@Override
	public int countQna() { // 글개수
		return qnaDao.countQna();
	}

	
	

	@Override
	public QnaBoard modifyreplyView(int qnum) { // 관리자모드 답변 수정 뷰
		return qnaDao.modifyreplyView(qnum);
	}

	@Override
	public int insertQna(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna) { // 문의글쓰기
		qna.setQip(request.getRemoteAddr());
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] qimg = new String[2];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qimg[idx] = mFile.getOriginalFilename();
			if (qimg[idx] != null && !qimg[idx].equals("")) {
				if (new File(uploadPath + qimg[idx]).exists()) {
					qimg[idx] = System.currentTimeMillis() + "_" + qimg[idx];

				} // if
				try {
					mFile.transferTo(new File(uploadPath + qimg[idx]));
					System.out.println("서버파일 : " + uploadPath + qimg[idx]);
					System.out.println("백업파일 : " + backupPath + qimg[idx]);
					boolean result = fileCopy(uploadPath + qimg[idx], backupPath + qimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 하면 bimg[idx] = "" 빈스트링이 들어감
				qimg[idx] = "";
			} // if
			idx++;
		} // while

		qna.setQfile1(qimg[0]); //
		qna.setQfile2(qimg[1]); //
		System.out.println("원글쓰기" + qna);
		
		return qnaDao.insertQna(qna); // DB insert
	}

	@Override
	public int replyQna(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna) {
		qna.setQip(request.getRemoteAddr());
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] qimg = new String[2];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qimg[idx] = mFile.getOriginalFilename();
			if (qimg[idx] != null && !qimg[idx].equals("")) {
				if (new File(uploadPath + qimg[idx]).exists()) {
					qimg[idx] = System.currentTimeMillis() + "_" + qimg[idx];

				} // if
				try {
					mFile.transferTo(new File(uploadPath + qimg[idx]));
					System.out.println("서버파일 : " + uploadPath + qimg[idx]);
					System.out.println("백업파일 : " + backupPath + qimg[idx]);
					boolean result = fileCopy(uploadPath + qimg[idx], backupPath + qimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 하면 bimg[idx] = "" 빈스트링이 들어감
				qimg[idx] = "";
			} // if
			idx++;
		} // while

		qna.setQfile1(qimg[0]); //
		qna.setQfile2(qimg[1]); //
		System.out.println("답글" + qna);
		return qnaDao.replyQna(qna); // DB insert
	}

	@Override
	public int modifyQna(MultipartHttpServletRequest mRequest, HttpServletRequest request, QnaBoard qna) {
		qna.setQip(request.getRemoteAddr());
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] qimg = new String[2];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qimg[idx] = mFile.getOriginalFilename();
			if (qimg[idx] != null && !qimg[idx].equals("")) {
				if (new File(uploadPath + qimg[idx]).exists()) {
					qimg[idx] = System.currentTimeMillis() + "_" + qimg[idx];

				} // if
				try {
					mFile.transferTo(new File(uploadPath + qimg[idx]));
					System.out.println("서버파일 : " + uploadPath + qimg[idx]);
					System.out.println("백업파일 : " + backupPath + qimg[idx]);
					boolean result = fileCopy(uploadPath + qimg[idx], backupPath + qimg[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 하면 bimg[idx] = "" 빈스트링이 들어감
				qimg[idx] = "";
			} // if
			idx++;
		} // while

		qna.setQfile1(qimg[0]); //
		qna.setQfile2(qimg[1]); //
		System.out.println("수정" + qna);
		return qnaDao.modifyQna(qna); //
	}

	@Override
	public int deleteQna(QnaBoard qna) {
		return qnaDao.deleteQna(qna);
	}

	@Override
	public int adminreply(QnaBoard qna) {
		return qnaDao.adminreply(qna);
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
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public QnaBoard screatView(int qnum) {
		return qnaDao.secreatView(qnum);
	}

	@Override
	public QnaBoard detailQna(QnaBoard qna) {
		qnaDao.hitupQna(qna.getQnum());
		System.out.println("왜이래"+qna);
		return qnaDao.detailQna(qna);
	}

	@Override
	public QnaBoard detailSecreat(QnaBoard qna) {
		System.out.println("비번글 상세보기 " +qna);
		return qnaDao.detailSecreat(qna);
	}

}
