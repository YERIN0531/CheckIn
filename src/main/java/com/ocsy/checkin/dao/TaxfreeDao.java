package com.ocsy.checkin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Taxfree;

@Mapper
public interface TaxfreeDao {
	public int insertProduct(Taxfree taxfree); // 면세품 등록
	// public List<Taxfree> listProduct(Taxfree taxfree); // 면세점 리스트 출력
	// public int countProduct(Taxfree taxfree); // 페이징 위한 상품개수 
	public Taxfree detailProduct(int pnum); // pnum으로 상품 상세보기
	public int updateProduct(Taxfree taxfree); // 상품 수정하기
	public int deleteProduct(Taxfree taxfree); // 상품 삭제하기
	
	
	public List<Taxfree> categoryListProduct(Taxfree taxfree); // 카테고리 별로 상품 출력
	public int categoryCountProduct(Taxfree taxfree); // 개수 가져오기
}
