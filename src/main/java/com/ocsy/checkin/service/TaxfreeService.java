package com.ocsy.checkin.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.Taxfree;

public interface TaxfreeService {
	
	public int insertProduct(MultipartHttpServletRequest mRequest, Taxfree taxfree);
	
}
