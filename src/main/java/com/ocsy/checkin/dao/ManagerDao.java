package com.ocsy.checkin.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ocsy.checkin.dto.Manager;

@Mapper
public interface ManagerDao {
	public List<Manager> managerList(Manager manager);
	public Manager  loginCheck (Manager manager);
	public int joinManager(Manager manager);
	public int deleteManager(String aid);
	public int withdrawManager (String aid);
	public int emailConfirm(String aemail);
	public Manager detailManager(String aid);
}
