package com.ocsy.checkin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocsy.checkin.dao.ManagerDao;
import com.ocsy.checkin.dto.Manager;
@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;
	@Override
	public List<Manager> managerList(Manager manager) {
		
		return managerDao.managerList(manager);
	}
	//2. 로그인
	@Override
	public String login(String aid, String apw, HttpSession httpSession) {
		String result = "관리자 로그인 성공";
	    Manager manager = new Manager();
		manager.setAid(aid);
		manager.setApw(apw);
		manager = managerDao.loginCheck(manager);
		if(manager==null) {
			result ="아이디/비밀번호를 확인하세요";
		}else {
			httpSession.setAttribute("manager", manager);
			httpSession.setAttribute("aid", aid);
		}
		return result;
	}
	@Override
	public void managerLogout(HttpSession httpSession) {
		httpSession.invalidate();
		
	}
	@Override
	public int joinManager(Manager manager, HttpSession httpSession) {
		int result = managerDao.joinManager(manager);
		System.out.println(result == 1? "관리자 등록 성공" : "관리자 등록 실패");
		if(result == 1) {
			httpSession.setAttribute("aid", manager.getAid());
		}
		return result;
	}
	@Override
	public int deleteManager(String aid) {
		System.out.println(1);
		return managerDao.deleteManager(aid);
	}
	@Override
	public int withdrawManager(String aid) {
		return managerDao.withdrawManager(aid);
	}
	@Override
	public int emailConfirm(String aemail) {
		
		return managerDao.emailConfirm(aemail);
	}
	@Override
	public Manager detailManager(String aid) {
		
		return managerDao.detailManager(aid);
	}

	

}
