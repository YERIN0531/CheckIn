package com.ocsy.checkin.dao;
import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Member;
@Mapper
public interface MemberDao {

//	public Member getDetailMember(String mid);
	public Member loginCheck(Member member);
}
