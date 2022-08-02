package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Taxfree;

@Mapper
public interface TaxfreeDao {
	public int insertProduct(Taxfree taxfree);
	public List<Taxfree> listProduct(Taxfree taxfree);
	public int countProduct(Taxfree taxfree);
	public Taxfree detailProduct(int pnum);
}
