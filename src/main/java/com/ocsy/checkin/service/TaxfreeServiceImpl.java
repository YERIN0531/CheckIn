package com.ocsy.checkin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dao.TaxfreeDao;
import com.ocsy.checkin.dto.Taxfree;

@Service
public class TaxfreeServiceImpl implements TaxfreeService {
	
	@Autowired
	private TaxfreeDao taxfreeDao;
	String backupPath = "C:/TeamCheckin/CheckIn/src/main/webapp/img/";
	
	@Override
	public int insertProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree) {
		String uploadPath = mRequest.getRealPath("fileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, tempBimg2
		String[] pimg = new String[3];
		int idx = 0;
		
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			pimg[idx] = mFile.getOriginalFilename(); 
			if(pimg[idx]!=null && !pimg[idx].equals("")) { // 첨부함
				if(new File(uploadPath + pimg[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					pimg[idx] = System.currentTimeMillis() + "_" + pimg[idx];
				}//if
				try {
					mFile.transferTo(new File(uploadPath + pimg[idx])); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + pimg[idx]);
					System.out.println("백업파일 : " + backupPath + pimg[idx]);
					boolean result = fileCopy(uploadPath + pimg[idx], backupPath + pimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				// 파일 첨부 안 하면 bimg[idx] = ""
				// bimg[idx] = "";
			}//if
			idx++;
		}//while

		taxfree.setPimage1(pimg[0]); // 첫번째 첨부한 파일 이름
		taxfree.setPimage2(pimg[1]); // 두번째 첨부한 파일 이름
		taxfree.setPimage3(pimg[2]); // 세번째 첨부한 파일 이름
		
		System.out.println("등록할 책 정보 : " + taxfree);
		return taxfreeDao.insertProduct(taxfree); // DB insert
		
	}
	
	
	// 파일 복사 진행 로직 - fileCopy
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
