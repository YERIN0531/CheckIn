package com.ocsy.checkin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Taxfree;

public interface TaxfreeService {
	
	public int insertProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree);
	public List<Taxfree> listProduct(String pageNum,Taxfree taxfree);
	public int countProduct(Taxfree taxfree);
	public Taxfree detailProduct(int pnum);
	public int modifyProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree);
	public int deleteProduct(Taxfree taxfree);
	
	
}
