package com.ocsy.checkin.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Taxfree;

@Mapper
public interface TaxfreeDao {
	public int insertProduct(Taxfree taxfree);
}
