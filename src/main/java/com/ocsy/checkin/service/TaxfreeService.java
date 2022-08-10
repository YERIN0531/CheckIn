package com.ocsy.checkin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Taxfree;

public interface TaxfreeService {
	
	public int insertProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree);
	// public List<Taxfree> listProduct(String pageNum,Taxfree taxfree); - 나중에 삭제 예정
	// public int countProduct(Taxfree taxfree); // 나중에 삭제 예정
	public Taxfree detailProduct(int pnum);
	public int modifyProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree);
	public int deleteProduct(Taxfree taxfree);
	
	public List<Taxfree> categoryListProduct(String pageNum, Taxfree taxfree);
	public int categoryCountProduct(Taxfree taxfree);
	
}
