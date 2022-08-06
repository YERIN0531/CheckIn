package com.ocsy.checkin.dao;
import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Member;
@Mapper
public interface MemberDao {

//	public Member getDetailMember(String mid);
	public Member loginCheck(Member member);
	
	public Member getMember(String mid);  // member dto 가져오기 (진영필요 지우지마세요)
	
	public int minusMileage(Member member);
	
	public int plusMileage(Member member);
	
	public int idConfirm(String mid);
	
	public int joinMember(Member member);  // 회원가입
}
