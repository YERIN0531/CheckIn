package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ocsy.checkin.dto.Manager;

public interface ManagerService {
	public List<Manager> managerList(Manager manager);
	public String  login(String aid, String apw ,HttpSession httpSession);
	public void managerLogout(HttpSession httpSession);
	public int joinManager(Manager manager , HttpSession httpSession);
	public int deleteManager(String aid);
	public int withdrawManager (String aid);
	public int emailConfirm(String aemail);
	public Manager detailManager(String aid);
}
